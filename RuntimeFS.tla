--------------------------- MODULE RuntimeFS--------------------------------
EXTENDS ParametersFS, TLC
----------------------------------------------------------------------------
(***************************************************************************)
(* The first argument is a set of locks to be opened.  ReduceSet is used   *)
(* to iterate over the set of locks,                                       *)
(***************************************************************************)

openLock (locks) ==
       StateE' = 
       ReduceSet (LAMBDA X, y: 
                      LET OSet == COpenLocks(y, GPol)
                      IN  [x1 \in DOMAIN X |-> (X[x1] \cup
                          IF x1 \in DOMAIN OSet 
                             THEN 
                                IF x1 \in E1 
                                    THEN {OSet[x1]}
                                    ELSE  OSet[x1]   
                             ELSE {}) \ {NONE}], StateE, locks)
       
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



(***************************************************************************)
(* the operational semantics                                                                *)
(***************************************************************************)

store(id, ptr, value, policy, next_stmt, vname) ==         
    /\ New2Old'   = <<policy[1], 
       ReduceSeq(LAMBDA x,y: LUB(x,y), policy[2], Sessions[id]["PCLabel"])>>               	
    /\ CASE ptr.loc = "persistence" /\ vname = "" -> 
	     /\ StateP'   = [StateP EXCEPT ![ptr.offs] = value]
         /\ Sessions' = 
                [Sessions EXCEPT ![id]["StateRegs"] = 
                    Tail(Sessions[id]["StateRegs"]) \o next_stmt]
         /\ UNCHANGED VPol
	  [] ptr.loc = "persistence" /\ vname # "" ->
	     /\ VPol'     = 
	            [VPol EXCEPT ![vname] = LUB(VPol[vname], 
	                ReduceSeq(LAMBDA x,y: LUB(x,y), policy[2], 
	                   Sessions[id]["PCLabel"]))]
         /\ StateP'   = [StateP EXCEPT ![ptr.offs] = value]
         /\ Sessions' = 
                [Sessions EXCEPT ![id]["StateRegs"] = 
                    Tail(Sessions[id]["StateRegs"]) \o next_stmt]	   
      [] ptr.loc = "mem" /\ vname = "" ->
         /\ StateP'    = StateP
         /\ Sessions'  = 
            [[Sessions 
                EXCEPT ![id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp + 
                    ptr.offs] = value] EXCEPT ![id]["StateRegs"] = 
                        Tail(Sessions[id]["StateRegs"]) \o next_stmt]
         /\ UNCHANGED VPol
      [] OTHER ->            
         /\ StateP'    = StateP
         /\ Sessions'  = 
            [[[Sessions EXCEPT 
              ![id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp + ptr.offs] 
                = value] EXCEPT ![id]["StateRegs"] = 
                    Tail(Sessions[id]["StateRegs"]) \o next_stmt] EXCEPT 
                        ![id]["VPol"][vname] = LUB(Sessions[id]["VPol"][vname], 
                            ReduceSeq(LAMBDA x,y: LUB(x,y), policy[2], 
                                Sessions[id]["PCLabel"]))]
         /\ UNCHANGED VPol       
                  
load(id, ptr) == 
  IF ptr.loc = "persistence"
	THEN StateP[ptr.offs]
	ELSE 
	   Sessions[id]["SessionM"][Head(Sessions[id]["StateRegs"]).fp + ptr.offs]

(***************************************************************************)
(* adds into PClabel a policy of an if expression                          *)
(***************************************************************************)

if(id, policy, next_stmt) == 
    /\ Sessions'  = 
        [[Sessions 
            EXCEPT ![id]["PCLabel"] = <<policy>> \o Sessions[id]["PCLabel"]]
                EXCEPT ![id]["StateRegs"] = 
                    Tail(Sessions[id]["StateRegs"]) \o next_stmt]
                    
(***************************************************************************)
(* removes from PClabel a policy of the last if expression                 *)
(***************************************************************************)

ifend (id, next_stmt) == 
    /\ Sessions'  = 
            [[Sessions 
                EXCEPT ![id]["PCLabel"] = Tail(Sessions[id]["PCLabel"])]
                    EXCEPT ![id]["StateRegs"] = 
                        Tail(Sessions[id]["StateRegs"]) \o next_stmt]

skip(id, next_stmt) == 
    /\ Sessions'  = 
        [Sessions EXCEPT ![id]["StateRegs"] = 
            Tail(Sessions[id]["StateRegs"]) \o next_stmt]
    		
ParalocksInv == IF New2Old # <<>> /\ Ignore # 1
                    THEN comparePol (ALSTP(New2Old[2], StateE), New2Old[1])
                    ELSE TRUE

===========================================================================
