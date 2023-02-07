--------------------------- MODULE RuntimeFS--------------------------------
EXTENDS ParametersFS
----------------------------------------------------------------------------
(***************************************************************************)
(* The first argument is a set of locks to be opened.  ReduceSet is used   *)
(* to iterate over the set of locks,                                       *)
(***************************************************************************)

openLock (id, locks) ==
       SLocks' = [SLocks EXCEPT ![id] =
       FoldSet (LAMBDA X, y: 
                      LET OSet == COpenLocks(y, GPol)
                      IN  [x1 \in DOMAIN X |-> (X[x1] \cup
                          IF x1 \in DOMAIN OSet 
                             THEN 
                                IF x1 \in E1 
                                    THEN {OSet[x1]}
                                    ELSE {OSet[x1]}   
                             ELSE {}) \ {NONE}], StateE, locks)]
(*       
openSLock (locks, id) ==
       ReduceSet (LAMBDA X, y: 
                      LET OSet == COpenLocks(y, GPol)
                      IN  [x1 \in DOMAIN X |-> (X[x1] \cup
                         IF x1 \in DOMAIN OSet 
                            THEN  
                                IF x1 \in E1 
                                    THEN {OSet[x1]}
                                    ELSE  OSet[x1]   
                            ELSE {}) \ {NONE}], SLocks[id],locks)
*)

(***************************************************************************)
(* updates columns policies with respect to pvalues, the current context   *)
(* security label and the where_cond security label                        *)
(***************************************************************************)

UpdateTablePolicy (id, columns, pvalues, cond) ==
  LET D == DOMAIN columns
    IN
  LET
        UpdateTablePolicy_OP(x,y)== 
        [x EXCEPT ![y]["policy"] = 
            LUB4Seq(Sessions[id]["PCLabel"] 
                    \o <<x[y]["policy"]>> \o <<pvalues[CHOOSE i \in 
                         D : y = columns[i]]>> \o <<cond>>)]        
  IN
  FoldSeq(UpdateTablePolicy_OP, VPol, columns)

DeleteTablePolicy (id, columns, cond) ==
  LET
        DeleteTablePolicy_OP(x,y)== 
        [x EXCEPT ![y]["policy"] = 
            LUB4Seq(Sessions[id]["PCLabel"] 
                    \o <<x[y]["policy"]>> \o <<cond>>)]        
  IN
  FoldSeq(DeleteTablePolicy_OP, VPol, columns)

(***************************************************************************)
(* updates session vars policies with respect to pvalues, the current      *)
(* context security label and the where_cond security label                *)
(***************************************************************************)


UpdateVarPolicy (id, variables, exprs, cond) ==
  LET D == DOMAIN variables
    IN
  LET   
    UpdateVarPolicy_OP(x,y) == 
        [x EXCEPT ![Head(Sessions[id]["StateRegs"]).fp + y.offs] = 
            LUB4Seq(Sessions[id]["PCLabel"] 
                    \o <<exprs[CHOOSE i \in 
                         D : y = variables[i]]>> \o <<cond>>)]  
  IN
  FoldSeq(UpdateVarPolicy_OP, Sessions[id]["SessionM"], variables)

(* 
UpdateVarPolicy (id, variables, exprs, cond) ==
  LET
    (* @type: (Seq(POLICY), 
       [loc: Str, offs: Int, policy: POLICY, name: Str]) => (Seq(POLICY)); *)
    UpdateVarPolicy_OP(x,y) == 
       SubSeq(x, 1, Head(Sessions[id]["StateRegs"]).fp + y.offs - 1) \o
       <<LUB4Seq(Sessions[id]["PCLabel"] 
               \o <<exprs[CHOOSE i \in 
                    DOMAIN variables : y = variables[i]]>> \o <<cond>>)>> \o
       SubSeq(x, Head(Sessions[id]["StateRegs"]).fp + y.offs + 1, Len(x))   
  IN
  FoldSeq(UpdateVarPolicy_OP, Sessions[id]["SessionM"], variables) 
*)

(* @type: (U, Seq([loc: Str, offs: Int, policy: POLICY, name: Str]), 
              Seq(POLICY), POLICY) => Seq(POLICY); *)              
(*
UpdateVarPolicy (id, variables, exprs, cond) ==
  LET
    (* @type: (Seq(POLICY), 
       [loc: Str, offs: Int, policy: POLICY, name: Str]) => (Seq(POLICY)); *)   
    UpdateVarPolicy_OP(x,y) == 
        LET UpdateVarPolicy_OP2(x1, y1) == 
            IF x1[2] = Head(Sessions[id]["StateRegs"]).fp + y.offs
                THEN <<x1[1] \o 
                <<LUB4Seq(Sessions[id]["PCLabel"] \o <<exprs[CHOOSE i \in 
                  DOMAIN variables : y = variables[i]]>> \o <<cond>>)>>, 
                  x1[2] + 1>> 
                ELSE <<x1[1] \o <<y1>>, x1[2] + 1>>
        IN
          Head(FoldSeq (UpdateVarPolicy_OP2, <<<<>>, 1>>, x))   
  IN
  FoldSeq(UpdateVarPolicy_OP, Sessions[id]["SessionM"], variables)
*)
(***************************************************************************)
(* updates caller block (preceding block) vars policies when return from a *)
(* callee function                                                         *)
(***************************************************************************)

UpdateOuterVarPolicy (id, variables, exprs, cond) ==
  LET D == DOMAIN variables
    IN
  LET
    UpdateOuterVarPolicy_OP(x,y) == 
        [x EXCEPT ![Head(Tail(Sessions[id]["StateRegs"])).fp + y.offs] = 
           LUB4Seq(Sessions[id]["PCLabel"] 
                    \o <<exprs[CHOOSE i \in 
                         D : y = variables[i]]>> \o <<cond>>)]
  IN
  FoldSeq(UpdateOuterVarPolicy_OP, Sessions[id]["SessionM"], variables)    

(***************************************************************************)
(* the instrumented operational semantics                                  *)
(***************************************************************************)

(***************************************************************************)
(* insert operator implements C-INS, C-EXT-INS abstarct semantics rules    *)
(***************************************************************************)

insert(id, columns, exprs, next_stmt) ==
    
    LET isExt == IF VPol[columns[1]]["ext"] = 1
                    THEN TRUE 
                    ELSE FALSE
    IN
    \* Если к таблице предосталвен прямой доступ, осуществляется проверка 
    \* инварианта безопасности, метки безопасности столбцов не меняются.
    \* В противном случае - ParalocksInv == TRUE, столбцам (глобальным)
    \* переменным присваиваются новые метки.
       
    IF isExt
       THEN
           /\ New2Old' = <<FoldSeq(LAMBDA x,y: x \o <<VPol[y]["policy"]>>, 
                                            <<>>, columns), 
                           FoldSeq(LAMBDA x,y: x \o 
                           <<LUB4Seq(Sessions[id]["PCLabel"] \o <<y>>)>>, 
                                                        <<>>, exprs)>>
           
           \* остаемся в том же frame, меняем только pc
           
           /\ Sessions' = 
               [Sessions EXCEPT ![id]["StateRegs"] = 
                                <<[Head(Sessions[id]["StateRegs"]) 
                                            EXCEPT !["pc"] = next_stmt]>> \o
                Tail(Sessions[id]["StateRegs"])]
           /\ VPol' = VPol
            
       ELSE 
           /\ New2Old' = << <<max>>,<<min>> >>
           /\ Sessions' = 
               [Sessions EXCEPT ![id]["StateRegs"] = 
                                <<[Head(Sessions[id]["StateRegs"]) 
                                            EXCEPT !["pc"] = next_stmt]>> \o
                Tail(Sessions[id]["StateRegs"])]
           /\ VPol'  = UpdateTablePolicy (id, columns, exprs, min)


(***************************************************************************)
(* update operator implements C-UPD, C-EXT-UPD abstarct semantics rules    *)
(***************************************************************************)

update(id, columns, exprs, cond, next_stmt) ==
    
    LET isExt == IF VPol[columns[1]]["ext"] = 1
                    THEN TRUE 
                    ELSE FALSE
    IN
    IF isExt
       THEN
           /\ New2Old' = <<FoldSeq(LAMBDA x,y: x \o <<VPol[y]["policy"]>>, 
                                                             <<>>, columns), 
                           FoldSeq(LAMBDA x,y: x \o 
                           <<LUB4Seq(Sessions[id]["PCLabel"] 
                                   \o <<cond>> \o <<y>>)>>, <<>>, exprs)>>
           /\ Sessions' = 
               [Sessions EXCEPT ![id]["StateRegs"] = 
                           <<[Head(Sessions[id]["StateRegs"]) 
                                    EXCEPT !["pc"] = next_stmt]>> \o
                                            Tail(Sessions[id]["StateRegs"])]
           /\ VPol' = VPol
            
       ELSE 
           /\ New2Old' = << <<max>>,<<min>> >>
           /\ Sessions' = 
               [Sessions EXCEPT ![id]["StateRegs"] = 
                           <<[Head(Sessions[id]["StateRegs"]) 
                                    EXCEPT !["pc"] = next_stmt]>> \o
                                            Tail(Sessions[id]["StateRegs"])]
           /\ VPol'  = UpdateTablePolicy (id, columns, exprs, cond)
           
(****************************************************************************
select operator implements C-SEL abstarct semantics rule.  It can also
be used for bulk collect operations.  In the last case it is assumed
that bulk collect returns only one row because we abstract away from
individual rows labels.
****************************************************************************)

select(id, variables, exprs, cond, next_stmt) ==
    /\ New2Old' = << <<max>>, <<min>> >>
    /\ Sessions' = 
       [Sessions EXCEPT ![id]["StateRegs"] = 
        <<[Head(Sessions[id]["StateRegs"]) EXCEPT !["pc"] = next_stmt]>> \o
            Tail(Sessions[id]["StateRegs"]),
                        ![id]["SessionM"] = 
                               UpdateVarPolicy (id, variables, exprs, cond)
       ]
 \*rec_assign
 \*coll_asign     
(***************************************************************************)
(* call operator implements C-PROC abstarct semantics rules                *)
(***************************************************************************)

call (id, next_stmt, lbl_ret, exprs) ==
   /\ Sessions' = [Sessions EXCEPT ![id]["SessionM"] = 
             Sessions[id]["SessionM"] \o exprs,
                                   ![id]["StateRegs"] =
                                  
             \* заменяем в старом frame значение pc     
             \* то есть задаем адрес возврата             
                                     
             <<[pc |-> next_stmt, 
                fp |-> Len(Sessions[id]["SessionM"])+1]>> \o
             <<[pc |-> <<Head(Sessions[id]["StateRegs"])["pc"][1], lbl_ret>>, 
                fp |-> Head(Sessions[id]["StateRegs"])["fp"]]>> \o
             Tail(Sessions[id]["StateRegs"]) 
             ] 

(***************************************************************************)
(* exit_call implements assignment to a variable after returning from a    *)
(* function                                                                *)
(***************************************************************************)

exit_call(id, variables, next_stmt) ==
    /\ New2Old' = << <<max>>, <<min>> >>
    /\ Sessions' = 
       [Sessions EXCEPT ![id]["StateRegs"] = 
        <<[Head(Sessions[id]["StateRegs"]) EXCEPT !["pc"] = next_stmt]>> \o
            Tail(Sessions[id]["StateRegs"]),
                        ![id]["SessionM"] = 
                    UpdateVarPolicy (id, variables, Sessions[id]["Ret"], min)
       ]

(***************************************************************************)
(* return operator implements C-RET, C-EXT-RET abstarct semantics rules    *)
(***************************************************************************)

return (id, ret_vars, exprs, next_stmt) ==

    \* Если в стеке сеанса единственный frame, то функция является внешней.
    \* Альтернативный вариант проверки: Head(Sessions[id]["StateRegs"]["fp"]=1) 
    
    LET isExt == IF Len(Sessions[id]["StateRegs"])=1
                    THEN TRUE 
                    ELSE FALSE
    IN
    IF isExt
       THEN
           /\ New2Old' = <<FoldSeq(LAMBDA x,y: x \o <<y["policy"]>>, 
                                                            <<>>, ret_vars), 
                           FoldSeq(LAMBDA x,y: x \o 
                           <<LUB4Seq(Sessions[id]["PCLabel"] 
                                            \o <<y>>)>>, <<>>, exprs)>>
           /\ Sessions' = 
               [Sessions EXCEPT ![id]["StateRegs"] = 
                                <<[Head(Sessions[id]["StateRegs"]) 
                                            EXCEPT !["pc"] = next_stmt]>> \o
                Tail(Sessions[id]["StateRegs"])]
            
       ELSE 
           /\ New2Old' = << <<max>>,<<min>> >>
           /\ Sessions' = 
               [Sessions EXCEPT ![id]["StateRegs"] = 
                                <<[Head(Sessions[id]["StateRegs"]) 
                                            EXCEPT !["pc"] = next_stmt]>> \o
                                            Tail(Sessions[id]["StateRegs"]),
                                ![id]["SessionM"] = 
                                UpdateVarPolicy(id, ret_vars, exprs, min)
                ]

(***************************************************************************)
(* load operator reads a label from the stack like session memory          *)
(***************************************************************************)

load(id, ptr) == 
      Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp + ptr.offs]
                 
(***************************************************************************)
(* adds the policy of the if expression into PClabel                       *)
(***************************************************************************)

if(id, policy, next_stmt) == 
    /\ Sessions'  = 
        [Sessions 
            EXCEPT ![id]["PCLabel"] = <<policy>> \o Sessions[id]["PCLabel"],
                   ![id]["StateRegs"] = 
                    <<[Head(Sessions[id]["StateRegs"]) 
                                            EXCEPT !["pc"] = next_stmt]>> \o
                          Tail(Sessions[id]["StateRegs"])]

(***************************************************************************)
(* adds the policy of the EXCEPTION expression into PClabel                *)
(***************************************************************************)

whenexc (id, policy, next_stmt) == 
    /\ Sessions'  = 
        [Sessions 
            EXCEPT ![id]["PCLabel"] = <<policy>> \o Sessions[id]["PCLabel"],
                   ![id]["StateRegs"] = 
                    <<[Head(Sessions[id]["StateRegs"]) 
                                            EXCEPT !["pc"] = next_stmt]>> \o
                          Tail(Sessions[id]["StateRegs"])]
                    
(***************************************************************************)
(* removes from PClabel a policy of the last if expression                 *)
(***************************************************************************)

ifend (id, next_stmt) == 
    /\ Sessions'  = 
            [Sessions 
                EXCEPT ![id]["PCLabel"] = Tail(Sessions[id]["PCLabel"]),
                       ![id]["StateRegs"] = 
                        <<[Head(Sessions[id]["StateRegs"]) 
                                            EXCEPT !["pc"] = next_stmt]>> \o
                          Tail(Sessions[id]["StateRegs"])]

(***************************************************************************)
(* skip operator implements C-NULL abstarct semantics rule                 *)
(***************************************************************************)

skip(id, next_stmt) == 
    /\ Sessions'  = 
        [Sessions EXCEPT ![id]["StateRegs"] = 
            <<[Head(Sessions[id]["StateRegs"]) 
                                            EXCEPT !["pc"] = next_stmt]>> \o
                          Tail(Sessions[id]["StateRegs"])]

(***************************************************************************)
(* assign operator implements C-ASSGN abstarct semantics rule              *)
(***************************************************************************)

(***************************************************************************)
(* assign operator implements C-ASSGN abstarct semantics rule.  Since      *)
(* records are represented as sets of vars as well as arrays are           *)
(* considered to be sets of records multiple-assignment statements are     *)
(* possible                                                                *)
(***************************************************************************)

assign(id, variables, exprs, next_stmt) ==
    /\ New2Old' = << <<max>>, <<min>> >>
    /\ Sessions' = 
       [Sessions EXCEPT ![id]["StateRegs"] = 
        <<[Head(Sessions[id]["StateRegs"]) EXCEPT !["pc"] = next_stmt]>> \o
            Tail(Sessions[id]["StateRegs"]),
                        ![id]["SessionM"] = 
                               UpdateVarPolicy (id, variables, exprs, min)
       ]

(***************************************************************************)
(* while operator semantics resembles that of if                           *)
(***************************************************************************)

while(id, policy, next_stmt) == 
      /\  Sessions'  = 
         [Sessions 
            EXCEPT ![id]["PCLabel"] = <<policy>> \o Sessions[id]["PCLabel"],
                   ![id]["StateRegs"] = 
                    <<[Head(Sessions[id]["StateRegs"]) 
                                            EXCEPT !["pc"] = next_stmt]>> \o
                          Tail(Sessions[id]["StateRegs"])]

(***************************************************************************)
(* whilend operator semantics resembles that of ifend                      *)
(***************************************************************************)

whilend (id, next_stmt) == 
    /\ Sessions'  = 
            [Sessions 
                EXCEPT ![id]["PCLabel"] = Tail(Sessions[id]["PCLabel"]),
                       ![id]["StateRegs"] = 
                        <<[Head(Sessions[id]["StateRegs"]) 
                                            EXCEPT !["pc"] = next_stmt]>> \o
                           Tail(Sessions[id]["StateRegs"])]

(***************************************************************************)
(* delete operator implements C-DEL, C-EXT-DEL abstarct semantics rules    *)
(***************************************************************************)

delete(id, columns, cond, next_stmt) ==
    
    LET isExt == IF VPol[columns[1]]["ext"] = 1
                    THEN TRUE 
                    ELSE FALSE
    IN
    IF isExt
       THEN
           /\ New2Old' = <<FoldSeq(LAMBDA x,y: x \o <<VPol[y]["policy"]>>, 
                                                             <<>>, columns), 
                           FoldSeq(LAMBDA x,y: x \o 
                           <<LUB4Seq(Sessions[id]["PCLabel"] 
                                     \o <<cond>>)>>, <<>>, columns)>>
           /\ Sessions' = 
               [Sessions EXCEPT ![id]["StateRegs"] = 
                           <<[Head(Sessions[id]["StateRegs"]) 
                                    EXCEPT !["pc"] = next_stmt]>> \o
                                            Tail(Sessions[id]["StateRegs"])]
           /\ VPol' = VPol
            
       ELSE 
           /\ New2Old' = << <<max>>,<<min>> >>
           /\ Sessions' = 
               [Sessions EXCEPT ![id]["StateRegs"] = 
                           <<[Head(Sessions[id]["StateRegs"]) 
                                    EXCEPT !["pc"] = next_stmt]>> \o
                                            Tail(Sessions[id]["StateRegs"])]
           /\ VPol'  = DeleteTablePolicy (id, columns, cond)
           
\* остальное skip



(*
ParalocksInv == 
    LET
        ParalocksInv_OP1(x, y) ==
            x /\ (*comparePol(New2Old[2][CHOOSE i \in DOMAIN New2Old[1]: 
                            y = New2Old[1][i]], y) *)
            
            comparePol(ALSTP(New2Old[2][y[2]], StateE), y[1])
    IN
    LET
        ParalocksInv_OP2(x1, y1) == 
                    <<<<Head(x1)[1], Head(x1)[2] + 1>>>> 
                                 \o Tail (x1) \o <<<<y1, Head(x1)[2] + 1>>>>
    IN
    IF  Ignore # 1
        THEN 
           FoldSeq(ParalocksInv_OP1, TRUE, 
             Tail(FoldSeq(ParalocksInv_OP2, <<<<min, 0>>>>, New2Old[1]))) 
        ELSE TRUE
*)

ParalocksInv == 
    LET
        \* @type: (Bool, <<POLICY, Int>>) => Bool;
        ParalocksInv_OP1(x, y) ==
            x /\ comparePol(ALSTP(New2Old[2][y[2]], StateE), y[1])
    IN
    LET 
        \* @type: (Seq(<<POLICY, Int>>), POLICY) => Seq(<<POLICY, Int>>);
        ParalocksInv_OP2(x1, y1) == 
                    <<<<Head(x1)[1], Head(x1)[2] + 1>>>> 
                                 \o Tail (x1) \o <<<<y1, Head(x1)[2] + 1>>>>
    IN
    IF  Ignore # 1
        THEN 
             FoldSeq(ParalocksInv_OP1, TRUE, 
             Tail(FoldSeq(ParalocksInv_OP2, <<<<min, 0>>>>, New2Old[1]))) 
        ELSE TRUE


VPolUnchanged ==  
    LET CompInv_OP1 (x, y) == /\ x
                              /\ comparePol(VPol[y].policy, VPol'[y].policy)
                              /\ comparePol(VPol'[y].policy, VPol[y].policy)
    IN FoldSet(CompInv_OP1, TRUE, DOMAIN VPol)

CompInv == [] [VPolUnchanged]_vars 

===========================================================================
