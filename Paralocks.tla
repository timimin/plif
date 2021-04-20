----------------------------- MODULE Paralocks -----------------------------
(***************************************************************************)
(* Paralocks specification is an universal language for defining           *)
(* information flow security policy in applications.  Designed in Chalmers *)
(* University by N.  Broberg, D.  Sands.  This specification represents a  *)
(* subset of Paralocks limitted by sets of unparametrised and unary locks  *)
(* and can be used for information flow control in PL/SQL programs.        *)
(***************************************************************************)

EXTENDS Naturals, Sequences, FiniteSets

CONSTANT U,      (**********************************************************)
                 (* the set of concrete actors (actor constants)           *)
                 (**********************************************************)
         UU,     (**********************************************************)
                 (* the set of quantified (bound) actor variables used in  *)
                 (* policy definitions                                     *)
                 (**********************************************************)
         NONE,   (**********************************************************)
                 (* in the absence of partially defined functions in TLA+  *)
                 (* this constant is used for representing closed locks    *)
                 (**********************************************************)
         E0,     (**********************************************************)
                 (* the set of unparametrised locks                        *)
                 (**********************************************************) 
         E1,     (**********************************************************)
                 (* the set of unary locks (with a single argument i.e.    *)
                 (* roles)                                                 *)
                 (**********************************************************) 
         Undef,  (**********************************************************)
                 (* used for specifying undefined values in program state  *)
                 (**********************************************************)        
         GPol    (**********************************************************)
                 (* global policies for transitivity                       *)
                 (**********************************************************)          
         \*E     cursors, exceptions....   
         
Data == 1..10000   (********************************************************)
                   (* the set of possible values for program variables     *)
                   (********************************************************) 
        
ASSUME /\ NONE \notin U 
       /\ U \cap UU = {}
       /\ Cardinality (UU) <= 3
       \* PG ... any specific policy should not include redudant elements with respect to GP
       
VARIABLES StateX,    (******************************************************)
                     (* The set of local and global variables and formal   *)
                     (* arguments including collections.  Data sources     *)
                     (* (tables and views) are global variables.  Any      *)
                     (* variable is represented by a structure with the    *)
                     (* following fields: loc \in {"mem", "persistence"} - *)
                     (* for distinguishing local and global variables,     *)
                     (* offset \in Natural - the offset, size \in Natural  *)
                     (* - 1 for scalar variable or collection size (this   *)
                     (* specification does not currently support dynamic   *)
                     (* memory allocation), policy \in {c1...cn}.          *)
                     (* Policies have a natural reading as conjunctions of *)
                     (* deﬁnite ﬁrst-order Horn clauses.  Each of them     *)
                     (* defines the set of locks to be open for            *)
                     (* information could flow to a specified user.        *)
                     (******************************************************)     
          StateE,    (******************************************************)
                     (* the set of open locks (for concrete actors)        *)
                     (******************************************************)
          New2Old,   (******************************************************)
                     (* this is the tuple of the form <<old, new>>, where  *)
                     (* old - the policy of the changed variable, new -    *)
                     (* the policy of the expression assigned specified to *)
                     (* the current lock state                             *)
                     (******************************************************)   
          S          (******************************************************)
                     (* the set of current user sessions                   *)
                     (******************************************************)           
          
          (*
          PCLabel,   (******************************************************)
                     (* user sessions program counter policies             *)
                     (******************************************************)
          Trace      (******************************************************)
                     (* user sessions observable traces                    *)
                     (******************************************************)
          *) 

LVars  == {x \in StateX : x.loc = "mem"} 
Tables == {x \in StateX : x.loc = "persistence"}

(***************************************************************************)
(* ReduceSeq, ReduceSet, Tup, SeqOf, Range, FindFirstInSeq, IsPrefix,      *)
(* replaceInSet - are utility operators                                    *)
(***************************************************************************)

ReduceSeq(Op(_, _), x, s) ==
        LET RECURSIVE Helper(_,_)
        Helper(x1, s1) ==
            IF s1 = <<>> THEN x1 
                       ELSE Helper(Op(x1, Head(s1)), Tail(s1))
        IN Helper(x, s)

ReduceSeq2(Op1(_,_,_),Op2(_,_),x,y,s) == \*two accumulators
        LET RECURSIVE Helper(_,_,_)
        Helper(x1,y1,s1) ==
            IF s1 = <<>> THEN x1 
                       ELSE Helper(Op1(x1,y1,Head(s1)), 
                                   Op2(y1,Head(s1)), Tail(s1))
        IN Helper(x,y,s)



ReduceSet(Op(_, _), x, s) ==
        LET RECURSIVE Helper(_, _)
        Helper(x1, s1) ==
            IF s1 = {} THEN x1 
                       ELSE LET y == CHOOSE y \in s1 : TRUE
                            IN Helper(Op(x1, y), s1 \ {y})
        IN Helper(x, s)
        
Tup(Set, n)   == [1..n -> Set]

SeqOf(set, n) == UNION {[1..m -> set] : m \in 0..n}

Range(s) == {s[i] : i \in DOMAIN s}

FindFirstInSeq(Op(_), s) ==
        LET RECURSIVE Helper(_, _)
        Helper(x, s1) ==
            IF Op(Head(s1)) = TRUE THEN x
                              ELSE Helper(x+1, Tail(s1))
        IN Helper(0, s)

IsPrefix(s, t) ==
        DOMAIN s \subseteq DOMAIN t /\ \A i \in DOMAIN s: s[i] = t[i]

replaceInSet (set, x1, x2) == {IF x = x1 THEN x2 ELSE x: x \in set}

IsNotSeqEmpty(seq)==\E i \in DOMAIN seq:seq[i].val # Undef

(***************************************************************************)
(* the total stack memory size (allocated for user sessions)               *)
(***************************************************************************)

StackLength   == ReduceSet(LAMBDA x, y: x + y.size , 0, LVars)

(***************************************************************************)
(* the persistence memory size                                             *)
(***************************************************************************)

PMemoryLength == ReduceSet(LAMBDA x, y: x + y.size , 0, Tables)

(***************************************************************************)
(* comparePol - is the policy comparison function.  Returns TRUE iff p1 is *)
(* less restrictive than p2.  See the full definition in [1].              *)
(***************************************************************************)
         
comparePol (p1, p2) ==
    LET RECURSIVE compareClause (_,_)
        compareClause (c1, c2) ==
            \/ /\ IF c1[1] \in UU /\ c2[1] \in UU 
                    THEN TRUE
                    ELSE c1[1] = c2[1] 
               /\ \A y \in E0 : \/ c1[2][1][y] = c2[2][1][y]
                                \/ c2[2][1][y] = {}
               /\ \A z \in E1 : 
                        \/ c1[2][2][z] \in SUBSET(c2[2][2][z])
                        \/ c1[2][2][z] \in SUBSET(UU) /\ c2[2][2][z] # {NONE}
                        \/ c1[2][2][z] = {NONE}
            \/ IF c1[1] \in UU /\ c2[1] \notin UU 
                THEN compareClause(<<c2[1], <<c1[2][1], 
                        [r \in E1 |-> 
                            replaceInSet (c1[2][2][r], c1[1], c2[1])]>>>>,c2) 
                ELSE FALSE
    IN \A c2 \in p2 : (\E c1 \in p1 : compareClause (c1, c2))

(***************************************************************************)
(* GLB - the meet operation on policies.  It corresponds to conjunction of *)
(* (sets of) Horn clauses and can be represented as the union of all       *)
(* clauses of two policies.                                                *)
(***************************************************************************)

GLB(p1, p2) == p1 \cup p2

(***************************************************************************)
(* LUB - the join operator on policies.  Defined as specified in [] under  *)
(* assumption that we have unparametrised and unary locks only.            *)
(***************************************************************************)

LUB(p1, p2) == 
    LET unionCl(c1,c2) == 
        CASE c1[1] = c2[1] -> 
            <<c1[1], <<[e0 \in E0 |-> 
                IF c1[2][1][e0] = {} \/ c2[2][1][e0] ={}
                    THEN {} ELSE {NONE}],
                       [e1 \in E1 |-> 
                        IF NONE \in c1[2][2][e1] /\ NONE \in c2[2][2][e1] 
                            THEN {NONE} 
                            ELSE (c1[2][2][e1] \cup c2[2][2][e1]) \ {NONE}]>>>>                     
        [] c1[1] \in U /\ c2[1] \in UU -> 
            <<c1[1], <<[e0 \in E0 |-> 
                IF c1[2][1][e0] = {} \/ c2[2][1][e0] ={}
                    THEN {} ELSE {NONE}],
                       [e1 \in E1 |-> 
                        IF NONE \in c1[2][2][e1] /\ NONE \in
                                         replaceInSet(c2[2][2][e1],c2[1],c1[1]) 
                            THEN {NONE} 
                            ELSE c1[2][2][e1] 
                                \cup (replaceInSet(c2[2][2][e1],c2[1],c1[1])
                                                                  \{NONE})]>>>>                          
        [] c1[1] \in UU /\ c2[1] \in U -> 
            <<c2[1], <<[e0 \in E0 |-> 
                IF c1[2][1][e0] = {} \/ c2[2][1][e0] ={}
                    THEN {} ELSE {NONE}],
                       [e1 \in E1 |-> 
                        IF NONE \in c2[2][2][e1] /\ NONE \in
                                         replaceInSet(c2[2][2][e1],c2[1],c1[1]) 
                            THEN {NONE}
                            ELSE c2[2][2][e1] 
                               \cup (replaceInSet(c1[2][2][e1],c1[1],c2[1])
                                                                  \{NONE})]>>>>                                                                                                    
        [] OTHER -> <<>> 
    IN {x \in {unionCl(c1,c2): c1 \in p1, c2\in p2} : x # <<>>}

(***************************************************************************)
(* ALSTP - the policy specialization operator.  It specializes an          *)
(* expression policy with the current lockstate at the point of            *)
(* assignment.  Logically the algorithm is based on the relational         *)
(* resolution reasoning method (with unification step).                    *)
(***************************************************************************)

ALSTP (p, SE) ==
    LET
    contextClause (c, lock) == 
        LET D  == CHOOSE i \in DOMAIN lock : TRUE
        IN
            CASE lock[D] = {} /\ D \notin E0 -> {c}
            [] D \in E0 /\ lock[D] = {} ->
                {<<c[1], <<[c[2][1] EXCEPT ![D]={NONE}],c[2][2]>>>>} 
            [] D \in E0 /\ lock[D] = {NONE} -> {c}
            [] c[1] \in U /\ D \in E1 ->
                IF c[2][2][D] \in SUBSET(UU)
                    THEN
                        {<<c[1], <<c[2][1],[c[2][2] EXCEPT ![D]= {NONE}]>>>>}
                    ELSE
                        {<<c[1], <<c[2][1],[c[2][2] EXCEPT ![D]= 
                            IF c[2][2][D] \ lock[D] = {}
                                THEN {NONE} 
                                ELSE c[2][2][D] \ lock[D]]>>>>}                                                      
            [] c[1] \in UU /\ D \in E1 ->                                
                IF c[1] \in c[2][2][D]
                    THEN
                        {c} \cup
                        {<<x, <<c[2][1],[c[2][2] EXCEPT ![D]= 
                            {NONE}]>>>> : x \in lock[D]}
                    ELSE
                        {<<c[1], <<c[2][1],[c[2][2] EXCEPT ![D]= 
                            IF c[2][2][D] \ lock[D] = {}
                                THEN {NONE} 
                                ELSE c[2][2][D] \ lock[D]]>>>>}
            [] OTHER -> {c}
    IN 
        LET applyLockStateToClause (c, openLocks) == 
            LET RECURSIVE Helper (_,_)
                Helper (accum, ldoms) ==
                IF ldoms = {} 
                    THEN accum
                    ELSE LET l == CHOOSE z \in ldoms : TRUE
                         IN Helper(ReduceSet(LAMBDA x, y: x \cup 
                            contextClause (y, [z \in {l} |-> openLocks [l]]), 
                                                    {}, accum), ldoms \ {l})
            IN Helper ({c}, DOMAIN openLocks)
        IN ReduceSet(LAMBDA x, y: x 
                            \cup applyLockStateToClause (y, SE) , {}, p)    
                            
(***************************************************************************)
(* COpenLocks - adds a new set of open locks generated based on global     *)
(* policy rules (recursive locks) into the current lockstate SE            *)
(***************************************************************************)

COpenLocks(lock, GLOB) == 
  LET D  == CHOOSE i \in DOMAIN lock : TRUE
  IN 
    IF D \in E0
         THEN lock
      (* THEN [SE EXCEPT ![D] = {}] 
       ELSE  
          IF lock[D] \in SE[D]
            THEN SE *)
         ELSE   
             LET RECURSIVE Helper(_,_)
             Helper (accum, roles) ==
                 LET dom ==
                     UNION {DOMAIN z[1]: z \in roles}
                 IN    
                     IF  roles = {}
                         THEN accum
                         ELSE Helper ([d \in dom \cup 
                                         (DOMAIN accum) |-> lock[D]],
                                             {r \in GLOB: dom \cap 
                                                    DOMAIN r[2] # {}})
             IN Helper(lock,{r \in GLOB: D \in DOMAIN r[2]})
                  
                  (*
                    LET OSet == Helper(lock,{r \in GLOB: D \in DOMAIN r[2]})
                    IN  [x \in DOMAIN SE |-> SE[x] \cup
                        IF x \in DOMAIN OSet 
                            THEN {OSet[x]}
                            ELSE {}]
                   *)
                  
(***************************************************************************)
(* Since TLA+ does not support partially defined function and types we use *)
(* the special value NONE for representing closed or not required locks    *)
(* here.                                                                   *)
(***************************************************************************)
(*
ParalocksTypeOK ==
     /\ StateE \in {<<e1, e2>> : 
        e1 \in [E0 -> {} \cup {{NONE}}],
        e2 \in [E1 -> (SUBSET  (U) \ {{}})  \cup {{NONE}}]}
     /\ PCLabel \in <<[S -> 
        SUBSET {<<u,locks>> : u \in UU \cup U, locks \in 
                    {<<e1, e2>> : e1 \in [E0 -> {} \cup {{NONE}}]>>,
                        e2 \in [E1 -> (SUBSET  (U \cup UU) \ {{}} ) 
                            \cup {{NONE}} ]}}]
     /\ New2Old \in {<<new, old>> : new \in  SUBSET 
            {<<u,locks>> : u \in UU \cup U, locks \in 
                {<<e1, e2>> : 
                    e1 \in [E0 -> {} \cup {{NONE}}],
                    e2 \in [E1 -> (SUBSET (U \cup UU) \ {{}}) 
                        \cup {{NONE}}]}},
                                    old \in  SUBSET 
            {<<u,locks>> : u \in UU \cup U, locks \in 
                {<<e1, e2>> : 
                    e1 \in [E0 -> {} \cup {{NONE}}],
                    e2 \in [E1 -> (SUBSET  (U \cup UU) \ {{}})  
                        \cup {{NONE}}]}}}
*)
=============================================================================
\* Modification History
\* Last modified Wed Feb 24 22:52:14 MSK 2021 by user-sc
\* Last modified Fri Oct 02 09:31:12 MSK 2020 by user-sc
\* Last modified Sat Aug 29 19:20:37 MSK 2020 by User
\* Created Mon May 25 11:46:28 MSK 2020 by User
