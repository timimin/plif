----------------------------- MODULE Paralocks -----------------------------
(***************************************************************************)
(* Paralocks specification is an universal language for defining           *)
(* information flow security policy in applications.  Designed in Chalmers *)
(* University by N.  Broberg, D.  Sands.  This specification represents a  *)
(* subset of Paralocks limitted by sets of unparametrised and unary locks  *)
(* and can be used for information flow control in PL/SQL programs.        *)
(***************************************************************************)

EXTENDS Naturals, Sequences, FiniteSets, TLC

CONSTANT U,      (**********************************************************)
                 (* the set of concrete actors (actor constants)           *)
                 (**********************************************************)
         UU,     (**********************************************************)
                 (* the set of quantified (bound) actor variables used in  *)
                 (* policy definitions                                     *)
                 (**********************************************************)
         NONE,   (**********************************************************)
                 (* in the absence of partially defined functions in TLA+  *)
                 (* this constant is used for representing empty locks in  *)
                 (* policy clauses                                         *)
                 (**********************************************************)
         ALL,    (**********************************************************)
                 (* is used for representing open unparameterised locks    *)
                 (* in the current lockstate                               *)
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
       /\ Cardinality (UU) <= 10
       \* PG ... any specific policy should not include redudant elements with respect to GP
    
VARIABLES (*StateX,*)(******************************************************)
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
          New2Old    (******************************************************)
                     (* this is the tuple of the form <<old, new>>, where  *)
                     (* old - the policy of the changed variable, new -    *)
                     (* the policy of the expression assigned specified to *)
                     (* the current lock state                             *)
                     (******************************************************)                 
          (*
          PCLabel,   (******************************************************)
                     (* user sessions program counter policies             *)
                     (******************************************************)
          Trace      (******************************************************)
                     (* user sessions observable traces                    *)
                     (******************************************************)
          *) 
(*
LVars  == {x \in StateX : x.loc = "mem"} 
Tables == {x \in StateX : x.loc = "persistence"}
*)

(***************************************************************************)
(* ReduceSeq, ReduceSet, Tup, SeqOf, Range, FindFirstInSeq, IsPrefix,      *)
(* ReplaceInSet, IsNotSeqEmpty - are utility operators                     *)
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
        
ReduceSeq3(Op(_, _, _), x, s1, s2) == \*two sequences
        LET RECURSIVE Helper(_,_,_)
        Helper(x1, s11, s22) ==
            IF s11 = <<>> THEN x1 
                         ELSE Helper(Op(x1, Head(s11), Head(s22)), 
                                                      Tail(s11), Tail(s22))
        IN Helper(x, s1, s2)



ReduceSet(Op(_, _), x, s) ==
        LET RECURSIVE Helper(_, _)
        Helper(x1, s1) ==
            IF s1 = {} THEN x1 
                       ELSE LET y == CHOOSE y \in s1 : TRUE
                            IN Helper(Op(x1, y), s1 \ {y})
        IN Helper(x, s)

UnionSet(set) == ReduceSet(LAMBDA x, y: x \cup y, {}, set)
        
     
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

ReplaceInSet (set, x1, x2) == {IF x = x1 THEN x2 ELSE x: x \in set}

IsNotSeqEmpty(seq)==\E i \in DOMAIN seq:seq[i].val # Undef



(***************************************************************************)
(* substMap1, substMap2, substMap3 - utility functions.  Rename bound      *)
(* variables of the first clause in accordance with the variables of the   *)
(* second clause.                                                          *)
(***************************************************************************)


f ## g == [x \in (DOMAIN f) \cup (DOMAIN g) |->
            CASE x \in DOMAIN f /\ x \in DOMAIN g -> 
                                IF f[x] \cap g[x] # {} THEN f[x] \cap g[x]
                                                       ELSE f[x]
            [] x \in DOMAIN f -> f[x]
            [] x \in DOMAIN g -> g[x]]


substMap3 (c1, c2) ==
    LET subFunc == IF c1[1] \in UU THEN [h \in {c1[1]} |-> {c2[1]}]
                   ELSE CHOOSE i \in [{} -> {}] : TRUE
    IN  
        LET fun == ReduceSet(LAMBDA x, y: 
                   (IF \E r \in c2[2][2][y]: r # "NONE"
                       THEN x ## [g \in c1[2][2][y] \cap UU |-> c2[2][2][y]]
                       ELSE x), subFunc, E1)
        IN [x1 \in DOMAIN fun |-> 
                       CHOOSE h \in fun[x1] : TRUE]


                                       
substMap2 (c1, c2) ==
    LET subFunc == IF c1[1] \in UU THEN [h \in {c1[1]} |-> c2[1]]
                   ELSE CHOOSE i \in [{} -> {}] : TRUE             
    IN
        ReduceSet(LAMBDA x, y:
                x @@ ReduceSet(LAMBDA x1, y1:         
                IF /\ y1 \in UU 
                   /\ y1 \notin DOMAIN (x @@ x1)
                   /\ \E r \in c2[2][2][y]: 
                        /\ r # "NONE" 
                        /\ r \notin Range(x @@ x1)
                THEN x1 @@ [t \in {y1} |-> CHOOSE r \in c2[2][2][y]:
                     /\ r # "NONE" 
                     /\ r \notin Range(x @@ x1)]
                ELSE x1
                    , CHOOSE i \in [{} -> {}] : TRUE, c1[2][2][y])
                    , subFunc, E1) 



substMap1 (c1, c2) ==
    IF c1[1] \in UU THEN 
       ReduceSet(LAMBDA x, y:  
                    IF   /\ c1[2][2][y] \in UU 
                         /\ c1[2][2][y] \notin DOMAIN x
                         /\ c2[2][2][y] # "NONE"
                         /\ c2[2][2][y] \notin Range(x)
                    THEN x @@ [h2 \in {c1[2][2][y]} |-> c2[2][2][y]]
                    ELSE x, 
                                              [h1 \in {c1[1]} |-> c2[1]],E1)   
    ELSE ReduceSet(LAMBDA x, y:  
                    IF /\ c1[2][2][y] \in UU 
                       /\ c1[2][2][y] \notin DOMAIN x
                       /\ c2[2][2][y] # "NONE"
                       /\ c2[2][2][y] \notin Range(x)
                    THEN x @@ [h2 \in {c1[2][2][y]} |-> c2[2][2][y]]
                    ELSE x, 
                                        CHOOSE i \in [{} -> {}] : TRUE, E1)

   
(***************************************************************************)
(* comparePol - is the policy comparison function.  Returns TRUE iff p1 is *)
(* less restrictive than p2.  See the full definition in [1].              *)
(***************************************************************************)   

compareClause (c1, c2) ==
    /\ IF c1[1] \in DOMAIN (substMap3 (c1, c2))
            THEN substMap3 (c1, c2)[c1[1]] = c2[1] 
            ELSE c1[1] = c2[1] 
    /\ \A k \in E0 : \/ c1[2][1][k] = c2[2][1][k]
                     \/ c2[2][1][k] = {}
    /\ \A z \in E1 : 
            \/ c1[2][2][z] = {NONE}
            \/ ReduceSet(LAMBDA x, y: 
                    IF y \in DOMAIN (substMap3 (c1, c2))
                       THEN x \cup {substMap3 (c1, c2)[y]}
                       ELSE x \cup {y}
                                  ,{}, c1[2][2][z]) 
                       \in SUBSET(c2[2][2][z])

comparePol (p1, p2) ==
    \A c2 \in p2 : (\E c1 \in p1 : compareClause (c1, c2))

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
            <<c2[1], <<[e0 \in E0 |-> 
                IF c1[2][1][e0] = {} \/ c2[2][1][e0] ={}
                    THEN {} ELSE {NONE}],
                       [e1 \in E1 |-> 
                        IF NONE \in c1[2][2][e1] /\ NONE \in c2[2][2][e1] 
                            THEN {NONE} 
                            ELSE (ReduceSet(LAMBDA x, y: 
                                    IF y \in DOMAIN (substMap3 (c1, c2))
                                        THEN x \cup {substMap3 (c1, c2)[y]}
                                        ELSE x \cup {y}
                                        ,{}, c1[2][2][e1]) \cup c2[2][2][e1])
                                                                \{NONE}]>>>>                      
        [] /\ c1[1] \in DOMAIN (substMap3 (c1, c2))
           /\ substMap3 (c1, c2)[c1[1]] = c2[1]  -> 
            <<c2[1], <<[e0 \in E0 |-> 
                IF c1[2][1][e0] = {} \/ c2[2][1][e0] ={}
                    THEN {} ELSE {NONE}],
                       [e1 \in E1 |-> 
                        IF NONE \in c1[2][2][e1] /\ NONE \in c2[2][2][e1] 
                            THEN {NONE} 
                            ELSE (ReduceSet(LAMBDA x, y: 
                                    IF y \in DOMAIN (substMap3 (c1, c2))
                                        THEN x \cup {substMap3 (c1, c2)[y]}
                                        ELSE x \cup {y}
                                        ,{}, c1[2][2][e1]) \cup c2[2][2][e1])
                                                                \{NONE}]>>>>
        [] /\ c2[1] \in DOMAIN (substMap3 (c2, c1))
           /\ substMap3 (c2, c1)[c2[1]] = c1[1]  -> 
            <<c1[1], <<[e0 \in E0 |-> 
                IF c1[2][1][e0] = {} \/ c2[2][1][e0] ={}
                    THEN {} ELSE {NONE}],
                       [e1 \in E1 |-> 
                        IF NONE \in c1[2][2][e1] /\ NONE \in c2[2][2][e1] 
                            THEN {NONE} 
                            ELSE (ReduceSet(LAMBDA x, y: 
                                    IF y \in DOMAIN (substMap3 (c2, c1))
                                        THEN x \cup {substMap3 (c2, c1)[y]}
                                        ELSE x \cup {y}
                                        ,{}, c2[2][2][e1]) \cup c1[2][2][e1])
                                                                \{NONE}]>>>>                                                                                                                         
        [] OTHER -> <<>> 
    IN {x \in {unionCl(c1,c2): c1 \in p1, c2\in p2} : x # <<>>}
    
LUB4Seq (s) == ReduceSeq(LAMBDA x, y: LUB(x,y), 
                                \* min policy 
                                {<<CHOOSE x \in UU: TRUE, 
                                 <<[e1 \in E0 |-> {NONE}], 
                                  [e2 \in E1 |-> {NONE}]>>>>}, s)

(***************************************************************************)
(* ALSTP - the policy specialization operator.  It specializes an          *)
(* expression policy with the current lockstate at the point of            *)
(* assignment.  Logically the algorithm is based on the relational         *)
(* resolution reasoning method (with unification step).                    *)
(***************************************************************************)

substMap4(uu, u) == ReduceSet(LAMBDA x, y : 
                    x \cup ReduceSet(LAMBDA x1, y1: 
                        x1 \cup {y1 @@ [h \in y |-> h]},
                              {}, [uu \ y -> u \cap U]), {}, SUBSET(uu))
                              
applySub(aset, sub) == 
                    CASE aset = {NONE} -> {NONE} 
                      [] /\ aset # {NONE} 
                         /\ DOMAIN sub # {} -> {sub[x]: x \in aset}
                      [] OTHER -> aset

specifyWithSub (c, locks, y) == 
    <<IF c[1] \in DOMAIN y 
         THEN y[c[1]]
         ELSE c[1],                   
                <<ReduceSet(LAMBDA x1, y1: 
                                IF locks[y1] = {}
                                    THEN [x1 EXCEPT ![y1] = x1[y1]]
                                    ELSE [x1 EXCEPT ![y1] = {NONE}],
                                        c[2][1], E0),                   
          ReduceSet(LAMBDA x2, y2: 
          IF locks[y2] = {}
             THEN [x2 EXCEPT ! [y2] = applySub(x2[y2], y)]
             ELSE IF applySub(x2[y2], y) \ locks[y2] = {}
                  THEN [x2 EXCEPT ! [y2] = {NONE}]
                  ELSE [x2 EXCEPT ! [y2] = applySub(x2[y2], y) \ locks[y2]],
                                    c[2][2], E1)>>>>
                
contextClause (c, locks) ==
    ReduceSet (LAMBDA x, y:
               IF ~\E i \in x: 
                  compareClause (i, 
                  specifyWithSub (c, locks, y))
                  THEN (x \cup {specifyWithSub (c, locks, y)}) \ 
                       {i \in x: 
                              compareClause(specifyWithSub (c, locks, y), i)}
                  ELSE x,
                      {<<c[1], <<ReduceSet(LAMBDA x1, y1: 
                        IF locks[y1] = {}
                           THEN [x1 EXCEPT ![y1] = x1[y1]]
                           ELSE [x1 EXCEPT ![y1] = {NONE}],
                                    c[2][1], E0), c[2][2]>>>>},
                    substMap4((UnionSet(Range(c[2][2])) \cup {c[1]}) \cap UU, 
                        UnionSet(Range(locks)) \cap U ))

ALSTP (p, SE) == 
    ReduceSet(LAMBDA x, y:           
             LET specifiedClauses ==
             {i \in contextClause (y, SE): 
                ~\E g \in x: compareClause(g, i)}
             IN
             (x \cup specifiedClauses) \ {i \in x: \E g 
                \in specifiedClauses: compareClause(g, i)},                    
              ReduceSet(LAMBDA x1, y1:
                x1 \cup  
                   {<<y1[1], <<ReduceSet(LAMBDA x2, y2: 
                               IF SE[y2] = {}
                                    THEN [x2 EXCEPT ![y2] = x2[y2]]
                                    ELSE [x2 EXCEPT ![y2] = {NONE}],
                                    y1[2][1], E0), y1[2][2]>>>>}, {}, p),p)   
                    
(***************************************************************************)
(* COpenLocks - adds a new set of open locks generated based on global     *)
(* policy rules (recursive locks) into the current lockstate SE            *)
(***************************************************************************)

COpenLocks(lock, GLOB) == 
  LET D  == CHOOSE i \in DOMAIN lock : TRUE
  IN 
    IF D \in E0
         THEN lock
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
\* Last modified Sat Jun 19 12:59:48 MSK 2021 by user-sc
\* Last modified Fri Oct 02 09:31:12 MSK 2020 by user-sc
\* Last modified Sat Aug 29 19:20:37 MSK 2020 by User
\* Created Mon May 25 11:46:28 MSK 2020 by User
