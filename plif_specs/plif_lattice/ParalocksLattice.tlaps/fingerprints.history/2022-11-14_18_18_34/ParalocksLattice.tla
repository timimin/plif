-------------------------- MODULE ParalocksLattice --------------------------
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
         E0,     (**********************************************************)
                 (* the set of unparametrised locks                        *)
                 (**********************************************************) 
         E1,     (**********************************************************)
                 (* the set of unary locks (with a single argument i.e.    *)
                 (* roles)                                                 *)
                 (**********************************************************) 
         ALL,    (**********************************************************)
                 (* is used for representing open unparameterised locks    *)
                 (* in the current lockstate                               *)
                 (**********************************************************)
         Undef,  (**********************************************************)
                 (* used for specifying undefined values in program state  *)
                 (**********************************************************)        
         GPol    (**********************************************************)
                 (* the global policiy                                     *)
                 (**********************************************************)          
         
Range(s) == {s[i] : i \in DOMAIN s}

f ## g == [x \in (DOMAIN f) \cup (DOMAIN g) |->
            CASE x \in DOMAIN f /\ x \in DOMAIN g -> 
                                IF f[x] \cap g[x] # {} THEN f[x] \cap g[x]
                                                       ELSE f[x]
            [] x \in DOMAIN f -> f[x]
            [] x \in DOMAIN g -> g[x]]

(***************************************************************************)
(* utility functions used for alignment of policy clauses under            *)
(* assumptions listed below                                                *)
(***************************************************************************)

\* @type: (CLAUSE, CLAUSE) => Bool;
substMap3Equality(c1,c2) ==  c1[1] \in UU \/ c1[1] = c2[1]

\* @type: (CLAUSE, CLAUSE, E1) => Set(U);
matchLocks(c1, c2, e) ==
    LET 
        \* @type: Set(U);
        c == c1[2][2][e]
    IN 
        IF c \intersect UU /= {}
        THEN (c \ UU) \union {c2[1]}
        ELSE c 
        
      \*  (c2[2][2][e] \ UU) \cup {y1[1]}  \subseteq y1[2][2][e]
      \*   c2[2][2][e] \subseteq y1[2][2][e]
        
   
(***************************************************************************)
(* comparePol is the policy comparison function (partial order).  Returns  *)
(* TRUE iff p1 is less restrictive (or equal to) than p2.  See the full    *)
(* definition in [].                                                       *)
(***************************************************************************)   

compareClause(c1, c2) ==
    /\ substMap3Equality(c1,c2)
    /\ \A k \in E0 : \/ c1[2][1][k] = c2[2][1][k]
                     \/ c2[2][1][k] = {}
    /\ \A e \in E1 : \/ c1[2][2][e] = {NONE}
                     \/ matchLocks(c1, c2, e) \subseteq c2[2][2][e]

\* @type: (POLICY, POLICY) => Bool;  
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

unionCl(c1,c2) == 
    LET capMap == [e0 \in E0 |-> c1[2][1][e0] \cap c2[2][1][e0]]
    IN
    IF substMap3Equality(c1,c2)
    THEN << c2[1], 
            <<  capMap, 
                [e1 \in E1 |-> 
                    IF NONE \in c1[2][2][e1] /\ NONE \in c2[2][2][e1] 
                    THEN {NONE} 
                    ELSE (matchLocks(c1, c2, e1) \cup c2[2][2][e1]) \ {NONE}]
            >>
         >>
    ELSE
        IF substMap3Equality(c2,c1)
        THEN << c1[1], 
                << capMap,
                    [e1 \in E1 |-> 
                     IF NONE \in c1[2][2][e1] /\ NONE \in c2[2][2][e1] 
                     THEN {NONE} 
                     ELSE (matchLocks(c2, c1, e1) \cup c1[2][2][e1]) \ {NONE}]
                >>
             >>
        ELSE <<>>

LUB (p1, p2) == {x \in {unionCl(c1,c2): c1 \in p1, c2\in p2} : x # <<>>} 

LUB2(p1, p2) == {x \in {unionCl(c1,c2): c1 \in p1, c2\in p2} : 
                   /\ x # <<>>
                   /\ ~\E y \in {unionCl(c1,c2): c1 \in p1, c2\in p2} :
                       /\ x # y
                       /\ compareClause(y, x)                          }  

(***************************************************************************)
(* Since TLA+ does not support partially defined function and types we use *)
(* the special value NONE for representing closed or not required locks    *)
(* here.                                                                   *)
(***************************************************************************)

ClausesSet == \*{c \in
                   {<<u, <<e0, e1>>>> : u  \in (U \cup UU), 
                           e0 \in [E0 -> SUBSET {NONE}],
                           e1 \in [E1 -> ((SUBSET (U) \cup SUBSET(UU)) 
                                                  \ {{}}) \cup {{NONE}}]}\* : 
              \* \/ c[1] \in UU 
              \* \/ /\ c[1] \notin UU
              \*    /\ (UNION Range(c[2][2])) \cap UU = {}}
                                                       
PoliciesSet == {p \in SUBSET ClausesSet: 
                      \A c1 \in p: ~\E c2 \in p: 
                        /\ c1 # c2 
                        /\ (compareClause(c1, c2) \/ compareClause(c2, c1))}
               \cup {{}}

ASSUME U_ASSM == U # {} /\ NONE \notin U

ASSUME UU_ASSM == UU = {"x"} /\ NONE \notin UU 

ASSUME Clause_ASSM1 == 
       \A c \in ClausesSet : 
          c[2][2] \in [E1 -> ((SUBSET (U \cup UU)) \ {{}}) \cup {{NONE}}]

ASSUME Clause_ASSM2 == 
       \A c \in ClausesSet : (\/ /\ c[1] \in UU 
                                 /\ \A e1 \in E1 : c[2][2][e1] = UU
                              \/ /\ c[1] \notin UU
                                 \*/\ (UNION Range(c[2][2])) \cap UU = {}) 
                                 /\ \A e1 \in E1 : c[2][2][e1] \cap UU = {})                               

ASSUME Clause_ASSM3 == \A c \in ClausesSet : c[1] \in U \cup UU

ASSUME Clause_ASSM4 == 
       \A c \in ClausesSet : 
          c[2][1] \in [E0 -> {{NONE},{}}]

ASSUME LUB_PS == \A p1, p2 \in PoliciesSet : LUB (p1, p2) \in PoliciesSet

THEOREM E1_LOCKS == ASSUME NEW c1 \in ClausesSet, NEW c2 \in ClausesSet,  
                    NEW l, NEW e1 \in E1,
                      l = unionCl(c1, c2), substMap3Equality(c1,c2) \/ 
                      (substMap3Equality(c2,c1) /\ ~ substMap3Equality(c1,c2)),
                      l[2][2][e1] \cap UU # {}, 
                      NONE \notin c2[2][2][e1],
                      NONE \notin c1[2][2][e1] 
                    PROVE c2[2][2][e1] \cap UU # {} /\ c1[2][2][e1] \cap UU # {}
<1>1 CASE substMap3Equality(c1,c2)                
<2>1 l[2][2][e1] = (matchLocks(c1, c2, e1) \cup c2[2][2][e1]) \ {NONE}
     PROOF BY <1>1 DEF unionCl
<2>2 CASE c1[2][2][e1] \cap UU = {}
          <3>1 l[2][2][e1] = (c1[2][2][e1] \cup c2[2][2][e1]) \ {NONE}
               PROOF BY <2>2,<2>1 DEF matchLocks
          <3>2 c2[2][2][e1] \cap UU # {} \/ c2[2][2][e1] \cap UU = {}
               BY <2>2, Clause_ASSM2
          <3>3 c1[1] \notin UU
               BY <2>2, Clause_ASSM2, Clause_ASSM3
          <3>4 c2[1] \notin UU
               BY <3>3, <1>1 DEF substMap3Equality
          <3>5 c2[2][2][e1] \cap UU = {}
               BY <3>4, Clause_ASSM2, UU_ASSM
          <3>6 l[2][2][e1] \cap UU = {}
               BY <3>5, <3>1, <2>2
          <3>7 QED BY <3>6 
<2>3 CASE c2[2][2][e1] \cap UU = {}
          <3>1 l[2][2][e1] = (((c1[2][2][e1] \ UU) \cup {c2[1]}) 
                                      \cup c2[2][2][e1]) \ {NONE}
               PROOF BY <2>3,<2>1 DEF matchLocks
          <3>2 c2[1] \notin UU
               BY <2>3, Clause_ASSM2
          <3>6 l[2][2][e1] \cap UU = {}
               BY <3>1, <3>2, <2>3
          <3>7 QED BY <3>6
<2>4 QED BY <2>3, <2>2
<1>2 CASE (substMap3Equality(c2,c1) /\ ~ substMap3Equality(c1,c2))                
<2>1 l[2][2][e1] = (matchLocks(c2, c1, e1) \cup c1[2][2][e1]) \ {NONE}
     PROOF BY <1>2 DEF unionCl
<2>2 CASE c2[2][2][e1] \cap UU = {}
          <3>1 l[2][2][e1] = (c2[2][2][e1] \cup c1[2][2][e1]) \ {NONE}
               PROOF BY <2>2,<2>1 DEF matchLocks
          <3>2 c1[2][2][e1] \cap UU # {} \/ c1[2][2][e1] \cap UU = {}
               BY <2>2, Clause_ASSM2
          <3>3 c2[1] \notin UU
               BY <2>2, Clause_ASSM2, Clause_ASSM3
          <3>4 c1[1] \notin UU
               BY <3>3, <1>2 DEF substMap3Equality
          <3>5 c1[2][2][e1] \cap UU = {}
               BY <3>4, Clause_ASSM2, UU_ASSM
          <3>6 l[2][2][e1] \cap UU = {}
               BY <3>5, <3>1, <2>2
          <3>7 QED BY <3>6 
<2>3 CASE c1[2][2][e1] \cap UU = {}
          <3>1 l[2][2][e1] = (((c2[2][2][e1] \ UU) \cup {c1[1]}) 
                                      \cup c1[2][2][e1]) \ {NONE}
               PROOF BY <2>3,<2>1 DEF matchLocks
          <3>2 c1[1] \notin UU
               BY <2>3, Clause_ASSM2
          <3>6 l[2][2][e1] \cap UU = {}
               BY <3>1, <3>2, <2>3
          <3>7 QED BY <3>6
<2>4 QED BY <2>3, <2>2
<1>3 QED BY <1>2, <1>1

ASSUME UNION_ASSM == \A p1, p2 \in PoliciesSet : \A c \in LUB (p1, p2) :
                     \E c1 \in p1, c2 \in p2 : 
                                          c = unionCl(c1, c2) /\ c # <<>>

Ref == \A p \in PoliciesSet: comparePol(p, p)

THEOREM Reflexitivity == \A p \in PoliciesSet : comparePol(p, p)
<1> USE DEF comparePol, compareClause, substMap3Equality, matchLocks
<1>1 TAKE pol \in PoliciesSet
<1>2 CASE pol = {}      
      <2>1 \A c2 \in pol : (\E c1 \in pol : compareClause (c1, c2)) 
      PROOF BY <1>2
      <2>2 QED
            BY <1>2, <2>1, comparePol(pol, pol)
<1>3. CASE pol # {}      
      <2>1 TAKE c1 \in pol
      <2>2 c1[1] \in UU \/ c1[1] = c1[1]
           PROOF OBVIOUS
      <2>3 substMap3Equality(c1,c1)
           PROOF BY <2>2
      <2>4 \A k \in E0 : \/ c1[2][1][k] = c1[2][1][k]
                         \/ c1[2][1][k] = {}
           PROOF OBVIOUS 
      <2>5 \A e \in E1 : \/ c1[2][2][e] = {NONE}
                         \/ matchLocks(c1, c1, e) \subseteq c1[2][2][e]   
           <3>1 TAKE e \in E1
           <3>2 CASE c1[2][2][e] = {NONE}
                <4>1 c1[2][2][e] = {NONE}
                     PROOF BY <3>2
                <4>2 QED BY <4>1
           <3>3 CASE c1[2][2][e] # {NONE}
                <4>1 matchLocks(c1, c1, e) \subseteq c1[2][2][e] 
                     <5>1 CASE c1[2][2][e] \cap UU = {}
                          <6>1 c1[2][2][e] \subseteq c1[2][2][e] 
                               PROOF OBVIOUS 
                          <6>2 QED BY <5>1, <6>1
                     <5>2 CASE c1[2][2][e] \cap UU # {}
                          <6>1 c1 \in ClausesSet
                               PROOF BY ONLY  DEF PoliciesSet                 
                          <6>2 {c1[1]} = UU
                               PROOF BY <5>2, <6>1, Clause_ASSM2, UU_ASSM
                          <6>3 QED BY <5>2, <6>2
                     <5>3 QED BY <5>1, <5>2
                <4>2 QED BY <4>1
           <3>4 QED BY <3>2, <3>1, <3>3
      <2>6 QED 
           BY <2>3, <2>4, <2>5
<1>4. QED
      BY <1>2, <1>3


Trans == \A p1, p2, p3 \in PoliciesSet: 
                              \/ comparePol(p1, p3)
                              \/ ~comparePol(p1, p2)
                              \/ ~comparePol(p2, p3)
                              
THEOREM Transitivity == \A p1, p2, p3 \in PoliciesSet: 
        comparePol(p1, p2) /\ comparePol(p2, p3) => comparePol(p1, p3)
<1> USE DEF comparePol, compareClause, substMap3Equality, matchLocks
<1>1 TAKE p1 \in PoliciesSet, p2 \in PoliciesSet, p3 \in PoliciesSet
<1>3 HAVE /\ comparePol(p1, p2) 
          /\ comparePol(p2, p3)
<1>4 \A c3 \in p3 : (\E c1 \in p1 : compareClause (c1, c3))
    <2>1  TAKE c3 \in p3
    <2>2  PICK c2 \in p2: compareClause (c2, c3)
          PROOF BY <1>3
    <2>3  PICK c1 \in p1: compareClause (c1, c2)
          PROOF BY <1>3
    <2>4  c1[1] \in UU \/ c1[1] = c3[1]
          PROOF BY <2>3, <2>2
    <2>5  \A k \in E0 : \/ c1[2][1][k] = c3[2][1][k]
                        \/ c3[2][1][k] = {}
          PROOF BY <2>3, <2>2
    <2>6  \A e \in E1 : \/ c1[2][2][e] = {NONE}
                        \/ matchLocks(c1, c3, e) \subseteq c3[2][2][e]
          <3>1 TAKE e \in E1
          <3>2 CASE c1[2][2][e] = {NONE}
               PROOF BY <3>2
          <3>3 CASE c1[2][2][e] # {NONE}
               <4>1 matchLocks(c1, c2, e) \subseteq c2[2][2][e]
                    PROOF BY <3>3, <2>3
               <4>2 CASE c1[2][2][e] \intersect UU # {}
                    <5>1 ((c1[2][2][e] \ UU) \union {c2[1]}) \subseteq c2[2][2][e]
                         PROOF BY  <4>2, <3>3, <2>3
                    <5>2 ((c1[2][2][e] \ UU) \union {c3[1]}) 
                                       \subseteq ((c2[2][2][e] \ UU) \union {c3[1]})
                         PROOF BY <5>1
                    <5>3 c2 \in ClausesSet
                         PROOF BY ONLY DEF PoliciesSet
                    <5>4 c2[1] # NONE
                         PROOF BY <5>3, U_ASSM, UU_ASSM, Clause_ASSM3
                    <5>5 c2[2][2][e] # {NONE}
                         PROOF BY <5>4, <5>1 
                    <5>6 QED BY <5>5, <5>2, <2>2, <2>3              
               <4>3 CASE c1[2][2][e] \intersect UU = {}
                    <5>1 c1[2][2][e] \subseteq c2[2][2][e]
                         PROOF BY  <4>3, <3>3, <2>3                    
                    <5>2 c2 \in ClausesSet
                         PROOF BY ONLY DEF PoliciesSet 
                    <5>3 c2[2][2][e]  \in ((SUBSET (U \cup UU)) \ {{}}) \cup {{NONE}}
                         PROOF BY <5>2, Clause_ASSM1
                    <5>4 c1 \in ClausesSet
                         PROOF BY ONLY DEF PoliciesSet
                    <5>5 c1[2][2][e]  \in ((SUBSET (U \cup UU)) \ {{}}) \cup {{NONE}}
                         PROOF BY <5>4, Clause_ASSM1
                    <5>6 c2[2][2][e] # {NONE}
                         PROOF BY ONLY <3>3, <5>1, <5>3, <5>5
                    <5>7 \/ c2[2][2][e] \subseteq c3[2][2][e]
                         \/ ((c2[2][2][e] \ UU) \union {c3[1]}) \subseteq c3[2][2][e]
                         PROOF BY <5>6, <2>2
                    <5>8 QED BY <3>3, <4>3, <5>7, <2>2, <2>3          
               <4>4 QED BY <4>3, <4>2
          <3>4 QED BY <3>2, <3>3
    <2>7  QED BY <2>4, <2>5, <2>6
<1>5  QED BY <1>4
                     
                                                     
AntiSym == \A p1, p2 \in PoliciesSet: 
                              \/ p1 = p2
                              \/ ~comparePol(p1, p2)
                              \/ ~comparePol(p2, p1)

THEOREM Antisymmetry == \A p1, p2 \in PoliciesSet: 
                         comparePol(p1, p2) /\ comparePol(p2, p1) => p1 = p2
<1> USE DEF comparePol, compareClause, substMap3Equality, matchLocks                        
<1>1 TAKE p1 \in PoliciesSet, p2 \in PoliciesSet
<1>2 HAVE /\ comparePol(p1, p2) /\ comparePol(p2, p1)
<1>4 p1 = p2
    <2>1 \A c2 \in p2: \E c1 \in p1 : c2 = c1
        <3>1 TAKE c2 \in p2
        \*<3>2 HIDE DEF compareClause
        <3>3 PICK c1 \in p1 : compareClause(c1, c2) 
             PROOF BY <1>2
        <3>4 PICK c3 \in p2 : /\ compareClause(c3, c1)
             PROOF BY <1>2
        <3>5 compareClause(c3, c2)
             <4>1 c3[1] \in UU \/ c3[1] = c2[1]
                  PROOF BY <3>3, <3>4 \*DEF compareClause
             <4>2 \A e \in E0 : 
                        /\ \/ c2[2][1][e] = c3[2][1][e]
                           \/ c2[2][1][e] = {}
                  PROOF BY <3>3, <3>4, Clause_ASSM4 
                        \*DEF compareClause
             <4>3 \A e \in E1 : \/ c3[2][2][e] = {NONE}
                  \/ matchLocks(c3, c2, e) \subseteq c2[2][2][e]
                  <5>1 TAKE e \in E1
                  <5>2 CASE c3[2][2][e] = {NONE}
                       PROOF BY <5>2
                  <5>3 CASE c3[2][2][e] \cap UU = {} /\ c3[2][2][e] # {NONE}
                       <6>1 c3[2][2][e] \cup c1[2][2][e] \subseteq c1[2][2][e]
                            PROOF BY <5>3, <3>4 DEF matchLocks
                       <6>2 \/ c1[2][2][e] = {NONE}
                            \/ /\ c1[2][2][e] \cap UU = {} 
                               /\ c1[2][2][e] \cup c2[2][2][e] \subseteq c2[2][2][e]
                            \/ /\ c1[2][2][e] \cap UU # {} 
                               /\ ((c1[2][2][e] \ UU) \cup {c2[1]}) 
                                                \cup c2[2][2][e] \subseteq c2[2][2][e]
                            PROOF BY <3>3 DEF matchLocks
                       <6>3 CASE /\ c1[2][2][e] \cap UU = {} 
                                 /\ c1[2][2][e] \cup c2[2][2][e] \subseteq c2[2][2][e]
                            <7>1 c3[2][2][e] \subseteq c2[2][2][e]
                                 PROOF BY <5>3, <6>1, <6>2, 
                                       Clause_ASSM1, U_ASSM, UU_ASSM
                            <7>2 QED BY <7>1, <5>3
                       <6>4 CASE /\ c1[2][2][e] \cap UU # {} 
                                 /\ ((c1[2][2][e] \ UU) \cup {c2[1]}) 
                                                \cup c2[2][2][e] \subseteq c2[2][2][e]
                            <7>1 c3[2][2][e] \subseteq c2[2][2][e]
                                 PROOF BY <5>3, <6>1, <6>2, 
                                       Clause_ASSM1, U_ASSM, UU_ASSM
                            <7>2 QED BY <7>1, <5>3
                       <6>5 CASE c1[2][2][e] = {NONE}
                            <7>1 c3 \in ClausesSet
                                  PROOF BY DEF PoliciesSet
                            <7>2 c3[2][2][e] # {}
                                 PROOF BY <7>1, Clause_ASSM1 \* PoliciesSet 
                            <7>3 c3[2][2][e] = {NONE}
                                 PROOF BY <6>5, <6>1, <7>2,
                                       Clause_ASSM1, U_ASSM, UU_ASSM
                            <7>4 QED BY <7>3, <5>3
                       <6>6 QED BY <6>2, <6>3, <6>4, <6>5 DEF matchLocks  
                  <5>4 CASE c3[2][2][e] \cap UU # {} /\ c3[2][2][e] # {NONE}
                       <6>1 ((c3[2][2][e] \ UU) \cup {c1[1]}) 
                                          \cup c1[2][2][e] \subseteq c1[2][2][e]
                            PROOF BY <5>4, <3>4 DEF matchLocks
                       <6>11 c1 \in ClausesSet
                             PROOF BY DEF PoliciesSet
                       <6>12 c1[2][2][e] # {NONE}
                             PROOF BY <6>1, <6>11, U_ASSM, 
                                      UU_ASSM, <6>11, Clause_ASSM3
                       <6>2 \/ /\ c1[2][2][e] \cap UU = {} 
                               /\ c1[2][2][e] \cup c2[2][2][e] \subseteq c2[2][2][e]
                            \/ /\ c1[2][2][e] \cap UU # {} 
                               /\ ((c1[2][2][e] \ UU) \cup {c2[1]}) 
                                                \cup c2[2][2][e] \subseteq c2[2][2][e]
                            PROOF BY <3>3, <6>12, U_ASSM DEF matchLocks
                       <6>3 CASE /\ c1[2][2][e] \cap UU = {} 
                                 /\ c1[2][2][e] \cup c2[2][2][e] \subseteq c2[2][2][e]
                            <7>1  c1 \in ClausesSet
                                  PROOF BY DEF PoliciesSet
                            <7>2 c1[1] \notin UU
                                  PROOF BY <6>3, <7>1, Clause_ASSM2
                            <7>3  c1[1] = c2[1]
                                  PROOF BY <3>3, <7>2 DEF substMap3Equality
                            <7>4 ((c3[2][2][e] \ UU) \cup {c2[1]}) \subseteq c2[2][2][e]
                                  PROOF BY <5>4, <6>1, <6>3, <6>2, <7>3,
                                       Clause_ASSM1, Clause_ASSM3, U_ASSM, UU_ASSM
                            <7>5 QED BY <7>4, <5>4
                       <6>4 CASE /\ c1[2][2][e] \cap UU # {} 
                                 /\ ((c1[2][2][e] \ UU) \cup {c2[1]}) 
                                                \cup c2[2][2][e] \subseteq c2[2][2][e]
                            <7>1  c1 \in ClausesSet /\ c3 \in ClausesSet
                                  PROOF BY DEF PoliciesSet
                            <7>2  c1[1] \in UU
                                  PROOF BY <6>4, <7>1, Clause_ASSM2
                            <7>3  c3[1] \in UU
                                  PROOF BY <3>4, <7>2 DEF substMap3Equality
                            <7>4  c3[2][2][e] = UU /\ c1[2][2][e] = UU
                                  PROOF BY <7>3, <7>2, <7>1,
                                           Clause_ASSM1, Clause_ASSM2, U_ASSM, UU_ASSM
                            <7>5 ((c3[2][2][e] \ UU) \cup {c2[1]}) \subseteq c2[2][2][e]
                                  PROOF BY <5>4, <6>1, <6>3, <6>4, <7>4,
                                       Clause_ASSM1, Clause_ASSM3, U_ASSM, UU_ASSM
                            <7>6 QED BY <7>5, <5>4
                        <6>5 QED BY <6>2, <6>3, <6>4 DEF matchLocks  
                  <5>5 QED BY <5>2, <5>3, <5>4 DEF matchLocks
             <4>4 QED BY <4>1, <4>2, <4>3
        <3>6 c3 = c2
             PROOF BY <3>5  DEF PoliciesSet          
        <3>7 c1[1] = c2[1] 
             PROOF BY <3>3, <3>4, <3>6, UU_ASSM 
        <3>8 c1[2][1] = c2[2][1]
             <4>1 \A e0 \in E0 : c1[2][1][e0] = c2[2][1][e0]
                  PROOF BY <3>3, <3>4, <3>6
             <4>2 QED BY <4>1, Clause_ASSM4 DEF PoliciesSet
        <3>9 c1[2][2] = c2[2][2]
             <4>1 SUFFICES ASSUME NEW e1 \in E1
                           PROVE c1[2][2][e1] = c2[2][2][e1]
                  PROOF BY Clause_ASSM1 DEF PoliciesSet
             <4>2 CASE c2[2][2][e1] = {NONE}
                  <5>1 \/ c1[2][2][e1] = {NONE}
                       \/ (c1[2][2][e1] \ UU) \cup {c2[1]} \subseteq {NONE}
                       \/ c1[2][2][e1] \subseteq {NONE}
                       PROOF BY <3>3, <4>2, Clause_ASSM1, 
                                U_ASSM, UU_ASSM DEF matchLocks 
                  <5>2 c1 \in ClausesSet /\ c2 \in ClausesSet
                       PROOF BY DEF PoliciesSet                  
                  <5>3 QED BY <4>2, <5>1, <5>2,
                       Clause_ASSM3, Clause_ASSM1, U_ASSM, UU_ASSM
             <4>3 CASE c2[2][2][e1] \cap UU = {}  /\ c2[2][2][e1] # {NONE} 
                  <5>1 \/ (c1[2][2][e1] \ UU) \cup {c2[1]} \subseteq c2[2][2][e1]
                       \/ c1[2][2][e1] \subseteq c2[2][2][e1]
                       PROOF BY <3>3,<3>4, <4>3, Clause_ASSM1, 
                                Clause_ASSM2, Clause_ASSM3,
                                U_ASSM, UU_ASSM DEF matchLocks, PoliciesSet 
                  <5>2 CASE c1[2][2][e1] \subseteq c2[2][2][e1]
                       <6>1 c2[2][2][e1] = c3[2][2][e1]
                            PROOF BY <3>6
                       <6>2 c3[2][2][e1] \subseteq c1[2][2][e1]
                            PROOF BY <6>1, <4>3, <3>4 DEF matchLocks
                       <6>3 c2[2][2][e1] \subseteq c1[2][2][e1]
                            PROOF BY <6>2, <3>6
                       <6>4 QED BY <6>3, <5>2
                  <5>3 CASE (c1[2][2][e1] \ UU) \cup {c2[1]} \subseteq c2[2][2][e1]
                       <6>1 c2[2][2][e1] = c3[2][2][e1]
                            PROOF BY <3>6
                       <6>2 c3[2][2][e1] \subseteq c1[2][2][e1]
                            PROOF BY <6>1, <4>3, <3>4 DEF matchLocks
                       <6>3 c2[2][2][e1] \subseteq c1[2][2][e1]
                            PROOF BY <6>2, <3>6
                       <6>4 c2[1] \notin UU
                            PROOF BY <4>3, Clause_ASSM2 DEF PoliciesSet
                       <6>5 c1[1] \notin UU
                            PROOF BY <3>4, <6>4, <3>6 DEF substMap3Equality
                       <6>6 c1[2][2][e1] \cap UU = {}
                            PROOF BY <6>5, Clause_ASSM2 DEF PoliciesSet
                       <6>7 c1[2][2][e1] \subseteq c2[2][2][e1]
                            PROOF BY <5>3, <6>6 
                       <6>8 QED BY <6>3, <6>7
                  <5>4 QED BY <5>1, <5>2, <5>3
             <4>4 CASE c2[2][2][e1] \cap UU # {}  /\ c2[2][2][e1] # {NONE}
                  <5>1 (c1[2][2][e1] \ UU) \cup {c2[1]} \subseteq c2[2][2][e1]
                       \*\/ c1[2][2][e1] \subseteq c2[2][2][e1]
                       PROOF BY <3>3,<3>4, <4>4, Clause_ASSM1, 
                                Clause_ASSM2, Clause_ASSM3,
                                U_ASSM, UU_ASSM DEF matchLocks, PoliciesSet 
                  <5>2 c2[2][2][e1] = c3[2][2][e1]
                       PROOF BY <3>6
                  <5>3 (c3[2][2][e1] \ UU) \cup {c1[1]} \subseteq c1[2][2][e1]
                       PROOF BY <5>2, <4>4, <3>4 DEF matchLocks
                  <5>4 (c2[2][2][e1] \ UU) \cup {c1[1]} \subseteq c1[2][2][e1]
                       PROOF BY <5>3, <5>2
                  <5>5 c2[1] \in UU
                       PROOF BY <4>4, Clause_ASSM2 DEF PoliciesSet
                  <5>6 c1[1] \in UU
                       PROOF BY <3>3, <5>5, <3>6, 
                             UU_ASSM DEF substMap3Equality
                  <5>7 c1[2][2][e1] \cap UU # {}
                       PROOF BY <5>6, Clause_ASSM2 DEF PoliciesSet
                  <5>8 (c1[2][2][e1] \UU) \cup {c2[1]} \subseteq c2[2][2][e1]
                       PROOF BY <3>3, <5>7, UU_ASSM DEF matchLocks 
                  <5>9 c2[2][2][e1] \subseteq c1[2][2][e1]
                       PROOF BY <5>4, <5>6, <4>4, UU_ASSM
                  <5>10 c1[2][2][e1] \subseteq c2[2][2][e1]
                       PROOF BY <5>8, <5>1, <5>5, UU_ASSM    
                  <5>11 QED BY <5>9, <5>10, UU_ASSM
             <4>5 QED BY <4>2, <4>3, <4>4        
        <3>10 QED BY <3>7, <3>8, <3>9 DEF PoliciesSet, ClausesSet
    <2>2 \A c1 \in p1: \E c2 \in p2 : c1 = c2
        <3>1 TAKE c1 \in p1
        \*<3>2 HIDE DEF compareClause
        <3>3 PICK c2 \in p2 : compareClause(c2, c1) 
             PROOF BY <1>2
        <3>4 PICK c3 \in p1 : /\ compareClause(c3, c2)
             PROOF BY <1>2
        <3>5 compareClause(c3, c1)
             <4>1 c3[1] \in UU \/ c3[1] = c1[1]
                  PROOF BY <3>3, <3>4 DEF compareClause
             <4>2 \A e \in E0 : 
                        /\ \/ c1[2][1][e] = c3[2][1][e]
                           \/ c1[2][1][e] = {}
                  PROOF BY <3>3, <3>4, Clause_ASSM4 
                        DEF compareClause
             <4>3 \A e \in E1 : \/ c3[2][2][e] = {NONE}
                  \/ matchLocks(c3, c1, e) \subseteq c1[2][2][e]
                  <5>1 TAKE e \in E1
                  <5>2 CASE c3[2][2][e] = {NONE}
                       PROOF BY <5>2
                  <5>3 CASE c3[2][2][e] \cap UU = {} /\ c3[2][2][e] # {NONE}
                       <6>1 c3[2][2][e] \cup c2[2][2][e] \subseteq c2[2][2][e]
                            PROOF BY <5>3, <3>4 DEF matchLocks
                       <6>2 \/ c2[2][2][e] = {NONE}
                            \/ /\ c2[2][2][e] \cap UU = {} 
                               /\ c2[2][2][e] \cup c1[2][2][e] \subseteq c1[2][2][e]
                            \/ /\ c2[2][2][e] \cap UU # {} 
                               /\ ((c2[2][2][e] \ UU) \cup {c1[1]}) 
                                                \cup c1[2][2][e] \subseteq c1[2][2][e]
                            PROOF BY <3>3 DEF matchLocks
                       <6>3 CASE /\ c2[2][2][e] \cap UU = {} 
                                 /\ c2[2][2][e] \cup c1[2][2][e] \subseteq c1[2][2][e]
                            <7>1 c3[2][2][e] \subseteq c1[2][2][e]
                                 PROOF BY <5>3, <6>1, <6>2, 
                                       Clause_ASSM1, U_ASSM, UU_ASSM
                            <7>2 QED BY <7>1, <5>3
                       <6>4 CASE /\ c2[2][2][e] \cap UU # {} 
                                 /\ ((c2[2][2][e] \ UU) \cup {c1[1]}) 
                                                \cup c1[2][2][e] \subseteq c1[2][2][e]
                            <7>1 c3[2][2][e] \subseteq c1[2][2][e]
                                 PROOF BY <5>3, <6>1, <6>2, 
                                       Clause_ASSM1, U_ASSM, UU_ASSM
                            <7>2 QED BY <7>1, <5>3
                       <6>5 CASE c2[2][2][e] = {NONE}
                            <7>1 c3 \in ClausesSet
                                  PROOF BY DEF PoliciesSet
                            <7>2 c3[2][2][e] # {}
                                 PROOF BY <7>1, Clause_ASSM1 \* PoliciesSet 
                            <7>3 c3[2][2][e] = {NONE}
                                 PROOF BY <6>5, <6>1, <7>2,
                                       Clause_ASSM1, U_ASSM, UU_ASSM
                            <7>4 QED BY <7>3, <5>3
                       <6>6 QED BY <6>2, <6>3, <6>4, <6>5 DEF matchLocks  
                  <5>4 CASE c3[2][2][e] \cap UU # {} /\ c3[2][2][e] # {NONE}
                       <6>1 ((c3[2][2][e] \ UU) \cup {c2[1]}) 
                                          \cup c2[2][2][e] \subseteq c2[2][2][e]
                            PROOF BY <5>4, <3>4 DEF matchLocks
                       <6>11 c2 \in ClausesSet
                             PROOF BY DEF PoliciesSet
                       <6>12 c2[2][2][e] # {NONE}
                             PROOF BY <6>1, <6>11, U_ASSM, 
                                      UU_ASSM, <6>11, Clause_ASSM3
                       <6>2 \/ /\ c2[2][2][e] \cap UU = {} 
                               /\ c2[2][2][e] \cup c1[2][2][e] \subseteq c1[2][2][e]
                            \/ /\ c2[2][2][e] \cap UU # {} 
                               /\ ((c2[2][2][e] \ UU) \cup {c1[1]}) 
                                                \cup c1[2][2][e] \subseteq c1[2][2][e]
                            PROOF BY <3>3, <6>12, U_ASSM DEF matchLocks
                       <6>3 CASE /\ c2[2][2][e] \cap UU = {} 
                                 /\ c2[2][2][e] \cup c1[2][2][e] \subseteq c1[2][2][e]
                            <7>1  c2 \in ClausesSet
                                  PROOF BY DEF PoliciesSet
                            <7>2 c2[1] \notin UU
                                  PROOF BY <6>3, <7>1, Clause_ASSM2
                            <7>3  c2[1] = c1[1]
                                  PROOF BY <3>3, <7>2 DEF substMap3Equality
                            <7>4 ((c3[2][2][e] \ UU) \cup {c1[1]}) \subseteq c1[2][2][e]
                                  PROOF BY <5>4, <6>1, <6>3, <6>2, <7>3,
                                       Clause_ASSM1, Clause_ASSM3, U_ASSM, UU_ASSM
                            <7>5 QED BY <7>4, <5>4
                       <6>4 CASE /\ c2[2][2][e] \cap UU # {} 
                                 /\ ((c2[2][2][e] \ UU) \cup {c1[1]}) 
                                                \cup c1[2][2][e] \subseteq c1[2][2][e]
                            <7>1  c2 \in ClausesSet /\ c3 \in ClausesSet
                                  PROOF BY DEF PoliciesSet
                            <7>2  c2[1] \in UU
                                  PROOF BY <6>4, <7>1, Clause_ASSM2
                            <7>3  c3[1] \in UU
                                  PROOF BY <3>4, <7>2 DEF substMap3Equality
                            <7>4  c3[2][2][e] = UU /\ c2[2][2][e] = UU
                                  PROOF BY <7>3, <7>2, <7>1,
                                           Clause_ASSM1, Clause_ASSM2, U_ASSM, UU_ASSM
                            <7>5 ((c3[2][2][e] \ UU) \cup {c1[1]}) \subseteq c1[2][2][e]
                                  PROOF BY <5>4, <6>1, <6>3, <6>4, <7>4,
                                       Clause_ASSM1, Clause_ASSM3, U_ASSM, UU_ASSM
                            <7>6 QED BY <7>5, <5>4
                        <6>5 QED BY <6>2, <6>3, <6>4 DEF matchLocks  
                  <5>5 QED BY <5>2, <5>3, <5>4 DEF matchLocks
             <4>4 QED BY <4>1, <4>2, <4>3
        <3>6 c3 = c1
             PROOF BY <3>5  DEF PoliciesSet          
        <3>7 c2[1] = c1[1] 
             PROOF BY <3>3, <3>4, <3>6, UU_ASSM 
        <3>8 c2[2][1] = c1[2][1]
             <4>1 \A e0 \in E0 : c2[2][1][e0] = c1[2][1][e0]
                  PROOF BY <3>3, <3>4, <3>6
             <4>2 QED BY <4>1, Clause_ASSM4 DEF PoliciesSet
        <3>9 c2[2][2] = c1[2][2]
             <4>1 SUFFICES ASSUME NEW e1 \in E1
                           PROVE c2[2][2][e1] = c1[2][2][e1]
                  PROOF BY Clause_ASSM1 DEF PoliciesSet
             <4>2 CASE c1[2][2][e1] = {NONE}
                  <5>1 \/ c2[2][2][e1] = {NONE}
                       \/ (c2[2][2][e1] \ UU) \cup {c1[1]} \subseteq {NONE}
                       \/ c2[2][2][e1] \subseteq {NONE}
                       PROOF BY <3>3, <4>2, Clause_ASSM1, 
                                U_ASSM, UU_ASSM DEF matchLocks 
                  <5>2 c2 \in ClausesSet /\ c1 \in ClausesSet
                       PROOF BY DEF PoliciesSet                  
                  <5>3 QED BY <4>2, <5>1, <5>2,
                       Clause_ASSM3, Clause_ASSM1, U_ASSM, UU_ASSM
             <4>3 CASE c1[2][2][e1] \cap UU = {}  /\ c1[2][2][e1] # {NONE}  
                  <5>11 c3[2][2][e1] # {NONE}
                        PROOF BY <3>6, <4>3
                  <5>12 c2 \in ClausesSet /\ c1 \in ClausesSet 
                                          /\ c3 \inClausesSet
                        PROOF BY DEF PoliciesSet
                  <5>13 c2[2][2][e1] # {}
                        PROOF BY <5>12, Clause_ASSM1
                  <5>14 c3[2][2][e1] \subseteq c2[2][2][e1]
                        PROOF BY <5>11, <3>4, <4>3, <3>6 DEF matchLocks
                  <5>15 c2[2][2][e1] # {NONE}
                        PROOF BY <5>11, <5>14, <5>12, U_ASSM, 
                              UU_ASSM, Clause_ASSM1 
                  <5>1 \/ (c2[2][2][e1] \ UU) \cup {c1[1]} \subseteq c1[2][2][e1]
                       \/ c2[2][2][e1] \subseteq c1[2][2][e1]
                       PROOF BY <3>3, <5>15 DEF matchLocks, PoliciesSet      
                  <5>2 CASE c2[2][2][e1] \subseteq c1[2][2][e1]
                       <6>1 c1[2][2][e1] = c3[2][2][e1]
                            PROOF BY <3>6
                       <6>2 c3[2][2][e1] \subseteq c2[2][2][e1]
                            PROOF BY <6>1, <4>3, <3>4 DEF matchLocks
                       <6>3 c1[2][2][e1] \subseteq c2[2][2][e1]
                            PROOF BY <6>2, <3>6
                       <6>4 QED BY <6>3, <5>2
                  <5>3 CASE (c2[2][2][e1] \ UU) \cup {c1[1]} \subseteq c1[2][2][e1]
                       <6>1 c1[2][2][e1] = c3[2][2][e1]
                            PROOF BY <3>6
                       <6>2 c3[2][2][e1] \subseteq c2[2][2][e1]
                            PROOF BY <6>1, <4>3, <3>4 DEF matchLocks
                       <6>3 c1[2][2][e1] \subseteq c2[2][2][e1]
                            PROOF BY <6>2, <3>6
                       <6>4 c1[1] \notin UU
                            PROOF BY <4>3, Clause_ASSM2 DEF PoliciesSet
                       <6>5 c2[1] \notin UU
                            PROOF BY <3>4, <6>4, <3>6 DEF substMap3Equality
                       <6>6 c2[2][2][e1] \cap UU = {}
                            PROOF BY <6>5, Clause_ASSM2 DEF PoliciesSet
                       <6>7 c2[2][2][e1] \subseteq c1[2][2][e1]
                            PROOF BY <5>3, <6>6 
                       <6>8 QED BY <6>3, <6>7
                  <5>4 QED BY <5>1, <5>2, <5>3
             <4>4 CASE c1[2][2][e1] \cap UU # {}  /\ c1[2][2][e1] # {NONE}
                  <5>1 (c2[2][2][e1] \ UU) \cup {c1[1]} \subseteq c1[2][2][e1]
                       \*\/ c2[2][2][e1] \subseteq c1[2][2][e1]
                       PROOF BY <3>3,<3>4, <4>4, Clause_ASSM1, 
                                Clause_ASSM2, Clause_ASSM3,
                                U_ASSM, UU_ASSM DEF matchLocks, PoliciesSet 
                  <5>2 c1[2][2][e1] = c3[2][2][e1]
                       PROOF BY <3>6
                  <5>3 (c3[2][2][e1] \ UU) \cup {c2[1]} \subseteq c2[2][2][e1]
                       PROOF BY <5>2, <4>4, <3>4 DEF matchLocks
                  <5>4 (c1[2][2][e1] \ UU) \cup {c2[1]} \subseteq c2[2][2][e1]
                       PROOF BY <5>3, <5>2
                  <5>5 c1[1] \in UU
                       PROOF BY <4>4, Clause_ASSM2 DEF PoliciesSet
                  <5>6 c2[1] \in UU
                       PROOF BY <3>3, <5>5, <3>6, 
                             UU_ASSM DEF substMap3Equality
                  <5>7 c2[2][2][e1] \cap UU # {}
                       PROOF BY <5>6, Clause_ASSM2 DEF PoliciesSet
                  <5>8 (c2[2][2][e1] \UU) \cup {c1[1]} \subseteq c1[2][2][e1]
                       PROOF BY <3>3, <5>7, UU_ASSM DEF matchLocks 
                  <5>9 c1[2][2][e1] \subseteq c2[2][2][e1]
                       PROOF BY <5>4, <5>6, <4>4, UU_ASSM
                  <5>10 c2[2][2][e1] \subseteq c1[2][2][e1]
                       PROOF BY <5>8, <5>1, <5>5, UU_ASSM    
                  <5>11 QED BY <5>9, <5>10, UU_ASSM
             <4>5 QED BY <4>2, <4>3, <4>4        
        <3>10 QED BY <3>7, <3>8, <3>9 DEF PoliciesSet, ClausesSet
    <2>5 QED BY <2>1, <2>2
<1>5 QED BY <1>4               
                         

THEOREM ParalocksLattice == 
            \A p1, p2 \in PoliciesSet : 
                      /\ comparePol(p1, LUB (p1, p2)) 
                      /\ comparePol(p2, LUB (p1, p2))
                      /\ \A y \in PoliciesSet :
                              comparePol(p1, y) /\ comparePol(p2, y) 
                                                 => comparePol (LUB (p1, p2), y) 
<1>1  TAKE p1, p2 \in PoliciesSet                                                
<1>2  LUB (p1, p2) \in PoliciesSet 
      PROOF BY LUB_PS
<1>3  PICK l \in PoliciesSet : l = LUB (p1, p2) 
      PROOF BY <1>2
<1>4  \A l1 \in l : /\ \E c1 \in p1 : compareClause (c1, l1)
                    /\ \E c2 \in p2 : compareClause (c2, l1)
      \*<2>  USE DEF capMap\*HIDE DEF unionCl, PoliciesSet, LUB
      <2>1 TAKE l1 \in l
      <2>2 PICK c1 \in p1, c2 \in p2 : l1 = unionCl(c1, c2) /\ l1 # <<>>
           PROOF BY ONLY <1>3, UNION_ASSM
      <2>3 \/ l1 = <<c2[1], <<[e0 \in E0 |-> c1[2][1][e0] \cap c2[2][1][e0]], 
                              [e1 \in E1 |-> 
                     IF NONE \in c1[2][2][e1] /\ NONE \in c2[2][2][e1] 
                     THEN {NONE} 
                     ELSE (matchLocks(c1, c2, e1) \cup c2[2][2][e1]) \ {NONE}]>>>>
           \/ l1 = <<c1[1], <<[e0 \in E0 |-> c1[2][1][e0] \cap c2[2][1][e0]],
                              [e1 \in E1 |-> 
                     IF NONE \in c1[2][2][e1] /\ NONE \in c2[2][2][e1] 
                     THEN {NONE} 
                     ELSE (matchLocks(c2, c1, e1) \cup c1[2][2][e1]) \ {NONE}]>>>>           
           PROOF BY <2>2 DEF unionCl
      <2>4 CASE l1 = <<c2[1], <<[e0 \in E0 |-> c1[2][1][e0] \cap c2[2][1][e0]], 
                                [e1 \in E1 |-> 
                     IF NONE \in c1[2][2][e1] /\ NONE \in c2[2][2][e1] 
                     THEN {NONE} 
                     ELSE (matchLocks(c1, c2, e1) \cup c2[2][2][e1]) \ {NONE}]>>>>
            <3>1  c1[1] \in UU \/ c1[1] = c2[1]
                  PROOF BY <2>2, <2>4 DEF unionCl, substMap3Equality
            <3>2  /\ c1[1] \in UU \/ c1[1] = l1[1]
                  /\ c2[1] = l1[1]
                     PROOF BY <3>1, <2>4
            <3>3  c1 \in ClausesSet /\ c2 \in ClausesSet  
                  PROOF BY <2>2 DEF PoliciesSet
            <3>4  \A k \in E0 :/\  \/ c1[2][1][k] = {NONE}
                                   \/ c1[2][1][k] = {}
                               /\  \/ c2[2][1][k] = {NONE}
                                   \/ c2[2][1][k] = {}
                  PROOF BY <3>3, Clause_ASSM4
            <3>8  \A k \in E0 :/\ \/ c1[2][1][k] = l1[2][1][k]
                                  \/ l1[2][1][k] = {}
                               /\ \/ c2[2][1][k] = l1[2][1][k]
                                  \/ l1[2][1][k] = {}
                  PROOF BY <2>4, <3>4
            <3>9  \A e1 \in E1 : 
                    /\ \/ c1[2][2][e1] = {NONE}
                       \/ /\ c1[2][2][e1] # {NONE}
                          /\ l1[2][2][e1] = (matchLocks(c1, c2, e1) 
                                            \cup c2[2][2][e1]) \ {NONE}
                    /\ \/ c2[2][2][e1] = {NONE}
                       \/ /\ c2[2][2][e1] # {NONE}
                          /\ l1[2][2][e1] = (matchLocks(c1, c2, e1) 
                                            \cup c2[2][2][e1]) \ {NONE}
                  PROOF BY <2>4, <3>3, Clause_ASSM1, U_ASSM, UU_ASSM
            <3>10 \A e1 \in E1 : 
                     \/ c1[2][2][e1] = {NONE} 
                     \/ NONE \notin (c1[2][2][e1] \ UU)
                  PROOF BY <3>9, <3>3, U_ASSM, UU_ASSM, Clause_ASSM3, Clause_ASSM1
            <3>11 NONE \notin {c2[1]}
                  PROOF BY <3>3, U_ASSM, UU_ASSM, Clause_ASSM3
            <3>12 \A e1 \in E1 : 
                     \/ c1[2][2][e1] = {NONE} 
                     \/ NONE \notin (c1[2][2][e1] \ UU) \union {c2[1]}
                  PROOF BY <3>10, <3>11
            <3>13 \A e1 \in E1 : 
                     \/ c1[2][2][e1] = {NONE} 
                     \/ matchLocks(c1, c2, e1) \ {NONE} \subseteq l1[2][2][e1]
                  PROOF BY <3>9
            <3>14 \A e1 \in E1 : 
                     \/ c1[2][2][e1] = {NONE}
                     \/ matchLocks(c1, c2, e1)  \subseteq l1[2][2][e1]
                  PROOF BY <3>13, <3>12  DEF matchLocks
            <3>15 c2[1] = l1[1] 
                  PROOF BY <2>4
            <3>16 \A e1 \in E1 : 
                        \/ c1[2][2][e1] = {NONE}
                        \/ matchLocks(c1, l1, e1)  \subseteq l1[2][2][e1]
                  PROOF BY <3>14, <3>15 DEF matchLocks
            <3>17 \A e1 \in E1 : 
                        \/ c2[2][2][e1] = {NONE}
                        \/ l1[2][2][e1] = (matchLocks(c1, c2, e1) 
                                              \cup c2[2][2][e1]) \ {NONE}
                  PROOF BY <3>9                        
            <3>18 \A e1 \in E1 : 
                        \/ c2[2][2][e1] = {NONE}
                        \/ NONE \notin c2[2][2][e1]
                  PROOF BY <3>3, Clause_ASSM1, U_ASSM, UU_ASSM            
            <3>19 \A e1 \in E1 : 
                        \/ c2[2][2][e1] = {NONE}
                        \/ c2[2][2][e1] \subseteq l1[2][2][e1]
                  PROOF BY <3>17, <3>18          
            <3>20 \A e1 \in E1 :                        
                           \/ /\ c2[2][2][e1] \cap UU = {}
                              /\ matchLocks(c2, l1, e1) = c2[2][2][e1]
                           \/ /\ c2[2][2][e1] \cap UU # {}
                              /\ matchLocks(c2, l1, e1) = (c2[2][2][e1] \ UU) \cup {l1[1]}                           
                  PROOF BY DEF matchLocks
            <3>21 \A e1 \in E1 : matchLocks(c2, l1, e1) = c2[2][2][e1]
                  <4>1 SUFFICES ASSUME NEW e1 \in E1, c2[2][2][e1] \cap UU # {}
                                PROVE matchLocks(c2, l1, e1) = c2[2][2][e1]
                       PROOF BY <3>20
                  <4>2 DOMAIN c2[2][2] = E1
                       PROOF BY <3>3, Clause_ASSM1
                  <4>3 c2[2][2][e1] \intersect UU # {}
                       PROOF BY <4>1
                  \*<4>4 (UNION Range(c2[2][2])) \cap UU # {}
                  \*     PROOF BY <4>2, <4>3, Clause_ASSM2 DEF Range
                  <4>5 c2[1] \in UU
                       PROOF BY <4>3, <3>3, Clause_ASSM2
                  <4>6 {l1[1]} = UU
                       PROOF BY <4>5, <3>15, UU_ASSM                      
                  <4>8 QED BY <4>6, <3>20
            <3>22 \A e1 \in E1 : 
                        \/ c2[2][2][e1] = {NONE}
                        \/ matchLocks(c2, l1, e1)  \subseteq l1[2][2][e1]
                  PROOF BY <3>19, <3>21
            <3>23 QED BY <2>4, <3>2, <3>8, <3>16, <3>22
                         DEF compareClause, substMap3Equality
      <2>5 CASE l1 = <<c1[1], <<[e0 \in E0 |-> c1[2][1][e0] \cap c2[2][1][e0]], 
                                [e1 \in E1 |-> 
                     IF NONE \in c1[2][2][e1] /\ NONE \in c2[2][2][e1] 
                     THEN {NONE} 
                     ELSE (matchLocks(c2, c1, e1) \cup c1[2][2][e1]) \ {NONE}]>>>>
            <3>1  c2[1] \in UU \/ c1[1] = c2[1]
                  PROOF BY <2>2, <2>5 DEF unionCl, substMap3Equality
            <3>2  /\ c2[1] \in UU \/ c2[1] = l1[1]
                  /\ c1[1] = l1[1]
                     PROOF BY <3>1, <2>5
            <3>3  c1 \in ClausesSet /\ c2 \in ClausesSet  
                  PROOF BY <2>2 DEF PoliciesSet
            <3>4  \A k \in E0 :/\  \/ c1[2][1][k] = {NONE}
                                   \/ c1[2][1][k] = {}
                               /\  \/ c2[2][1][k] = {NONE}
                                   \/ c2[2][1][k] = {}
                  PROOF BY <3>3, Clause_ASSM4
            <3>8  \A k \in E0 :/\ \/ c1[2][1][k] = l1[2][1][k]
                                  \/ l1[2][1][k] = {}
                               /\ \/ c2[2][1][k] = l1[2][1][k]
                                  \/ l1[2][1][k] = {}
                  PROOF BY <2>5, <3>4
            <3>9  \A e1 \in E1 : 
                    /\ \/ c1[2][2][e1] = {NONE}
                       \/ /\ c1[2][2][e1] # {NONE}
                          /\ l1[2][2][e1] = (matchLocks(c2, c1, e1) 
                                            \cup c1[2][2][e1]) \ {NONE}
                    /\ \/ c2[2][2][e1] = {NONE}
                       \/ /\ c2[2][2][e1] # {NONE}
                          /\ l1[2][2][e1] = (matchLocks(c2, c1, e1) 
                                            \cup c1[2][2][e1]) \ {NONE}
                  PROOF BY <2>5, <3>3, Clause_ASSM1, U_ASSM, UU_ASSM
            <3>10 \A e1 \in E1 : 
                     \/ c2[2][2][e1] = {NONE} 
                     \/ NONE \notin (c2[2][2][e1] \ UU)
                  PROOF BY <3>9, <3>3, U_ASSM, UU_ASSM, Clause_ASSM3, Clause_ASSM1
            <3>11 NONE \notin {c1[1]}
                  PROOF BY <3>3, U_ASSM, UU_ASSM, Clause_ASSM3
            <3>12 \A e1 \in E1 : 
                     \/ c2[2][2][e1] = {NONE} 
                     \/ NONE \notin (c2[2][2][e1] \ UU) \union {c1[1]}
                  PROOF BY <3>10, <3>11
            <3>13 \A e1 \in E1 : 
                     \/ c2[2][2][e1] = {NONE} 
                     \/ matchLocks(c2, c1, e1) \ {NONE} \subseteq l1[2][2][e1]
                  PROOF BY <3>9
            <3>14 \A e1 \in E1 : 
                     \/ c2[2][2][e1] = {NONE}
                     \/ matchLocks(c2, c1, e1)  \subseteq l1[2][2][e1]
                  PROOF BY <3>13, <3>12  DEF matchLocks
            <3>15 c1[1] = l1[1] 
                  PROOF BY <2>5
            <3>16 \A e1 \in E1 : 
                        \/ c2[2][2][e1] = {NONE}
                        \/ matchLocks(c2, l1, e1)  \subseteq l1[2][2][e1]
                  PROOF BY <3>14, <3>15 DEF matchLocks
            <3>17 \A e1 \in E1 : 
                        \/ c1[2][2][e1] = {NONE}
                        \/ l1[2][2][e1] = (matchLocks(c2, c1, e1) 
                                              \cup c1[2][2][e1]) \ {NONE}
                  PROOF BY <3>9                        
            <3>18 \A e1 \in E1 : 
                        \/ c1[2][2][e1] = {NONE}
                        \/ NONE \notin c1[2][2][e1]
                  PROOF BY <3>3, Clause_ASSM1, U_ASSM, UU_ASSM            
            <3>19 \A e1 \in E1 : 
                        \/ c1[2][2][e1] = {NONE}
                        \/ c1[2][2][e1] \subseteq l1[2][2][e1]
                  PROOF BY <3>17, <3>18          
            <3>20 \A e1 \in E1 :                        
                           \/ /\ c1[2][2][e1] \cap UU = {}
                              /\ matchLocks(c1, l1, e1) = c1[2][2][e1]
                           \/ /\ c1[2][2][e1] \cap UU # {}
                              /\ matchLocks(c1, l1, e1) = (c1[2][2][e1] \ UU) \cup {l1[1]}                           
                  PROOF BY DEF matchLocks
            <3>21 \A e1 \in E1 : matchLocks(c1, l1, e1) = c1[2][2][e1]
                  <4>1 SUFFICES ASSUME NEW e1 \in E1, c1[2][2][e1] \cap UU # {}
                                PROVE matchLocks(c1, l1, e1) = c1[2][2][e1]
                       PROOF BY <3>20
                  <4>2 DOMAIN c1[2][2] = E1
                       PROOF BY <3>3, Clause_ASSM1
                  <4>3 c1[2][2][e1] \intersect UU # {}
                       PROOF BY <4>1
                  \*<4>4 (UNION Range(c1[2][2])) \cap UU # {}
                  \*     PROOF BY <4>2, <4>3, Clause_ASSM2 DEF Range
                  <4>5 c1[1] \in UU
                       PROOF BY <4>3, <3>3, Clause_ASSM2
                  <4>6 {l1[1]} = UU
                       PROOF BY <4>5, <3>15, UU_ASSM                      
                  <4>8 QED BY <4>6, <3>20
            <3>22 \A e1 \in E1 : 
                        \/ c1[2][2][e1] = {NONE}
                        \/ matchLocks(c1, l1, e1)  \subseteq l1[2][2][e1]
                  PROOF BY <3>19, <3>21
            <3>23 QED BY <2>5, <3>2, <3>8, <3>16, <3>22
                         DEF compareClause, substMap3Equality
      <2>6 QED BY <2>2, <2>3, <2>4, <2>5
<1>5  \A y \in PoliciesSet : comparePol(p1, y) /\ comparePol(p2, y) 
                             => comparePol (l, y)
      
      <2>1 TAKE y \in PoliciesSet
      <2>2 SUFFICES \A y1 \in y :
                           (/\ \E c1 \in p1 : compareClause (c1, y1)
                            /\ \E c2 \in p2 : compareClause (c2, y1)) =>
                            \E l1 \in l : compareClause (l1, y1)
           PROOF BY <1>3 DEF comparePol
      <2>3 TAKE y1 \in y
      <2>4 HAVE /\ \E c1 \in p1 : compareClause (c1, y1)
                /\ \E c2 \in p2 : compareClause (c2, y1)
      <2>5 PICK c1 \in p1 : compareClause (c1, y1)
           PROOF BY <2>4
      <2>6 PICK c2 \in p2 : compareClause (c2, y1)
           PROOF BY <2>4
      <2>7 \A l1 \in l : \E s1 \in p1, s2 \in p2 : 
                 /\ l1 = unionCl (s1, s2)
                 /\ l1 # <<>>             
           PROOF BY <1>3 DEF LUB
      <2>8 /\ c1[1] \in UU \/ c1[1] = y1[1]
           /\ c2[1] \in UU \/ c2[1] = y1[1]  
           PROOF BY <2>5, <2>6 DEF compareClause, substMap3Equality      
      <2>9 PICK u: u = unionCl (c1, c2)
           PROOF OBVIOUS
      <2>10 \/ /\ c1[1] \notin UU 
               /\ c2[1] \notin UU 
               /\ c1[1] = c2[1]
            \/ \/ c1[1] \in UU
               \/ c2[1] \in UU
            PROOF BY <2>8
      <2>11 \/ c1[1] \in UU 
            \/ c2[1] \in UU 
            \/ c2[1] = c1[1]
            PROOF BY <2>8
      <2>12 u # <<>>
            PROOF BY <2>9, <2>11 DEF unionCl, substMap3Equality
      <2>13 u \in l
            PROOF BY <1>3, <2>9, <2>12 DEF LUB
      <2>15 u[1] = c1[1] \/ u[1] = c2[1]
            PROOF BY <2>9, <2>12 DEF unionCl
      <2>16 u[1] \in UU \/ u[1] = y1[1]
            PROOF BY <2>15, <2>8
      <2>17 \A k \in E0 : /\ \/ c1[2][1][k] = y1[2][1][k]
                             \/ y1[2][1][k] = {}
                          /\ \/ c2[2][1][k] = y1[2][1][k]
                             \/ y1[2][1][k] = {}
            PROOF BY <2>5, <2>6 DEF compareClause
      <2>18 \A k \in E0 : u[2][1][k] = c1[2][1][k] \cap c2[2][1][k]
            PROOF BY <2>9, <2>12 DEF unionCl
      <2>19 \A k \in E0 :
               c1[2][1][k] = {NONE} /\ c2[2][1][k] = {NONE} => 
               y1[2][1][k] = {NONE} \/ y1[2][1][k] = {}
            PROOF BY <2>17
      <2>20 \A k \in E0 :
               c1[2][1][k] = {} \/ c2[2][1][k] = {} => 
               y1[2][1][k] = {} 
            PROOF BY <2>17
      <2>21 \A k \in E0 :
               c1[2][1][k] = {NONE} /\ c2[2][1][k] = {NONE} => 
               u[2][1][k] = {NONE} 
            PROOF BY <2>18
      <2>22 \A k \in E0 :
               c1[2][1][k] = {} \/ c2[2][1][k] = {} => 
               u[2][1][k] = {} 
            PROOF BY <2>18 
      <2>23 \A k \in E0 :
               \/ c1[2][1][k] = {NONE} /\ c2[2][1][k] = {NONE}
               \/ c1[2][1][k] = {} \/ c2[2][1][k] = {}
            PROOF BY <2>5, <2>6, Clause_ASSM4 DEF PoliciesSet   
      <2>24 \A k \in E0 :    \/ u[2][1][k] = y1[2][1][k]
                             \/ y1[2][1][k] = {}
            PROOF BY <2>23, <2>22, <2>21, <2>20, <2>19    
      <2>25 \A e \in E1 : 
            \/ u[2][2][e] = {NONE}
            \/ matchLocks(u, y1, e) \subseteq y1[2][2][e]
            <3>1 TAKE e \in E1
            <3>2 CASE u[2][2][e] = {NONE} 
                 PROOF BY <3>2
            <3>3 CASE u[2][2][e] # {NONE} /\ u[2][2][e] \cap UU = {}
                 <4>1 substMap3Equality(c1,c2) \/ substMap3Equality(c2,c1)
                      PROOF BY <2>9, <2>12 DEF unionCl
                 <4>2 CASE substMap3Equality(c1,c2)               
                      <5>1 u[2][2][e] = IF ((matchLocks(c1, c2, e) \cup c2[2][2][e]) \ {NONE}) \ UU = {}
                                        THEN (matchLocks(c1, c2, e) \cup c2[2][2][e]) \ {NONE} 
                                        ELSE ((matchLocks(c1, c2, e) \cup c2[2][2][e]) \ {NONE}) \ UU
                           PROOF BY <4>2, <2>9, <3>3 DEF unionCl
                      <5>2 CASE c1[2][2][e] \intersect UU = {}
                           <6>1 u[2][2][e] = IF ((c1[2][2][e] 
                                                \cup c2[2][2][e]) \ {NONE}) \UU = {}
                                                THEN (c1[2][2][e] \cup c2[2][2][e]) \ {NONE}
                                                ELSE ((c1[2][2][e] \cup c2[2][2][e]) \ {NONE}) \UU
                                PROOF BY <5>2, <5>1 DEF matchLocks
                           <6>2 CASE /\ c1[2][2][e] # {NONE} 
                                     /\ c2[2][2][e] # {NONE}
                                <7>1 c1[2][2][e] \subseteq y1[2][2][e]
                                     PROOF BY <2>5, <5>2, <6>2
                                     DEF compareClause, matchLocks                    
                                <7>2 (c2[2][2][e] \ UU) \subseteq y1[2][2][e]
                                     PROOF BY <2>6, <5>2, <6>2 \*, <7>2
                                           DEF compareClause, matchLocks   
                                <7>4 QED BY <7>1, <7>2, <6>1, 
                                            <3>3 DEF matchLocks
                           <6>3 CASE /\ c1[2][2][e] # {NONE} 
                                     /\ c2[2][2][e] = {NONE}  
                                <7>1 c1[2][2][e] \subseteq y1[2][2][e]
                                     PROOF BY <2>5, <5>2, <6>3
                                           DEF compareClause, matchLocks
                                <7>2 QED BY <7>1, <6>3, <6>1, 
                                            <3>3 DEF matchLocks
                           <6>4 CASE /\ c1[2][2][e] = {NONE} 
                                     /\ c2[2][2][e] # {NONE}  
                                <7>1 c2[2][2][e] \UU \subseteq y1[2][2][e]
                                     PROOF BY <2>6, <5>2, <6>4
                                           DEF compareClause, matchLocks   
                                <7>2 QED BY <7>1, <6>4, <6>1, 
                                            <3>3 DEF matchLocks
                           <6>5 CASE /\ c1[2][2][e] = {NONE} 
                                     /\ c2[2][2][e] = {NONE} 
                                PROOF BY <6>5, <6>1, <3>3 DEF matchLocks 
                           <6>6 QED BY <6>2, <6>3, <6>4, <6>5
                      <5>3 CASE c1[2][2][e] \intersect UU # {}   
                           <6>1 u[2][2][e] = IF (((c1[2][2][e] \ UU) \cup {c2[1]}  
                                                \cup c2[2][2][e]) \ {NONE}) \UU = {}
                                                THEN ((c1[2][2][e] \ UU) \cup {c2[1]} \cup c2[2][2][e]) \ {NONE}
                                                ELSE (((c1[2][2][e] \ UU) \cup {c2[1]} \cup c2[2][2][e]) \ {NONE}) \UU
                                PROOF BY <5>3, <5>1 DEF matchLocks
                           <6>2 CASE /\ c1[2][2][e] # {NONE} 
                                     /\ c2[2][2][e] # {NONE}
                                <7>1 (c1[2][2][e] \ UU) \cup {y1[1]}  
                                                        \subseteq y1[2][2][e]
                                     PROOF BY <2>5, <5>3, <6>2
                                           DEF compareClause, matchLocks
                                <7>2 (c2[2][2][e] \ UU) \subseteq y1[2][2][e]
                                     PROOF BY <2>6, <6>2
                                           DEF compareClause, matchLocks 
                                <7>3 c2[1] = y1[1] \/ c2[1] \in UU
                                     PROOF BY <2>6, UU_ASSM
                                           DEF compareClause, substMap3Equality
                                <7>5 QED BY <7>1, <7>2, <7>3, <6>1, 
                                            <3>3 DEF matchLocks
                           <6>3 CASE /\ c1[2][2][e] # {NONE} 
                                     /\ c2[2][2][e] = {NONE}  
                                <7>1 (c1[2][2][e] \ UU) \cup {y1[1]}  
                                                        \subseteq y1[2][2][e]
                                     PROOF BY <2>5, <5>3, <6>3
                                           DEF compareClause, matchLocks
                                <7>2 c2[1] = y1[1] \/ c2[1] \in UU
                                     PROOF BY <2>6, UU_ASSM
                                           DEF compareClause, substMap3Equality
                                <7>3 QED BY <7>1, <7>2, <6>3, <6>1, 
                                            <3>3 DEF matchLocks
                           <6>4 c1[2][2][e] # {NONE}
                                PROOF BY <5>3, UU_ASSM
                           <6>5 QED BY <6>1,<6>2,<6>3, <6>4
                      <5>4 QED BY <5>2, <5>3                      
                 <4>3 CASE substMap3Equality(c2,c1) /\ ~substMap3Equality(c1,c2) 
                      <5>1 u[2][2][e] = IF((matchLocks(c2, c1, e) \cup c1[2][2][e]) \ {NONE}) \ UU = {} 
                                            THEN (matchLocks(c2, c1, e) \cup c1[2][2][e]) \ {NONE} 
                                            ELSE ((matchLocks(c2, c1, e) \cup c1[2][2][e]) \ {NONE}) \ UU
                           PROOF BY <4>3, <2>9, <3>3 DEF unionCl
                      <5>2 CASE c2[2][2][e] \intersect UU = {}
                           <6>1 u[2][2][e] = IF ((c2[2][2][e] 
                                                \cup c1[2][2][e]) \ {NONE}) \UU = {}
                                                THEN (c2[2][2][e] \cup c1[2][2][e]) \ {NONE}
                                                ELSE ((c2[2][2][e] \cup c1[2][2][e]) \ {NONE}) \UU
                                PROOF BY <5>2, <5>1 DEF matchLocks
                           <6>2 CASE /\ c1[2][2][e] # {NONE} 
                                     /\ c2[2][2][e] # {NONE}
                                <7>1 c2[2][2][e] \subseteq y1[2][2][e]
                                     PROOF BY <2>6, <5>2, <6>2
                                           DEF compareClause, matchLocks
                                <7>2 c1[2][2][e] \ UU \subseteq y1[2][2][e]
                                     PROOF BY <2>5, <5>2, <6>2
                                           DEF compareClause, matchLocks   
                                <7>3 QED BY <7>1, <7>2, <6>1, 
                                            <3>3 DEF matchLocks
                           <6>3 CASE /\ c2[2][2][e] # {NONE} 
                                     /\ c1[2][2][e] = {NONE}  
                                <7>1 c2[2][2][e] \subseteq y1[2][2][e]
                                     PROOF BY <2>6, <5>2, <6>3
                                           DEF compareClause, matchLocks
                                <7>2 QED BY <7>1, <6>3, <6>1, 
                                            <3>3 DEF matchLocks
                           <6>4 CASE /\ c2[2][2][e] = {NONE} 
                                     /\ c1[2][2][e] # {NONE}  
                                <7>1 (c1[2][2][e] \ UU) \subseteq y1[2][2][e]
                                     PROOF BY <2>5, <5>2, <6>4
                                           DEF compareClause, matchLocks   
                                <7>2 QED BY <7>1, <6>4, <6>1, 
                                            <3>3 DEF matchLocks
                           <6>5 CASE /\ c1[2][2][e] = {NONE} 
                                     /\ c2[2][2][e] = {NONE} 
                                PROOF BY <6>5, <6>1, <3>3 DEF matchLocks 
                           <6>6 QED BY <6>2, <6>3, <6>4, <6>5          
                      <5>3 CASE c2[2][2][e] \intersect UU # {}   
                           <6>1 u[2][2][e] = IF (((c2[2][2][e] \ UU) \cup {c1[1]}  
                                                \cup c1[2][2][e]) \ {NONE}) \UU = {}
                                                THEN ((c2[2][2][e] \ UU) \cup {c1[1]} \cup c1[2][2][e]) \ {NONE}
                                                ELSE (((c2[2][2][e] \ UU) \cup {c1[1]} \cup c1[2][2][e]) \ {NONE}) \UU
                                PROOF BY <5>3, <5>1 DEF matchLocks 
                           <6>2 CASE /\ c1[2][2][e] # {NONE} 
                                     /\ c2[2][2][e] # {NONE}
                                <7>1 (c2[2][2][e] \ UU) \cup {y1[1]}  
                                                        \subseteq y1[2][2][e]
                                     PROOF BY <2>6, <5>3, <6>2
                                           DEF compareClause, matchLocks
                                <7>2 c1[2][2][e] \ UU \subseteq y1[2][2][e]
                                     PROOF BY <2>5, <5>2, <6>2
                                           DEF compareClause, matchLocks 
                                <7>3 c1[1] = y1[1] \/ c1[1] \in UU
                                     PROOF BY <2>5, UU_ASSM
                                           DEF compareClause, substMap3Equality
                                <7>5 QED BY <7>1, <7>2, <7>3, <6>1, 
                                            <3>3 DEF matchLocks
                           <6>3 CASE /\ c2[2][2][e] # {NONE} 
                                     /\ c1[2][2][e] = {NONE}  
                                <7>1 (c2[2][2][e] \ UU) \cup {y1[1]}  
                                                        \subseteq y1[2][2][e]
                                     PROOF BY <2>6, <5>3, <6>3
                                           DEF compareClause, matchLocks
                                <7>2 c1[1] = y1[1] \/ c1[1] \in UU
                                     PROOF BY <2>5, UU_ASSM
                                           DEF compareClause, substMap3Equality
                                <7>3 QED BY <7>1, <7>2, <6>3, <6>1, 
                                            <3>3 DEF matchLocks
                           <6>4 c2[2][2][e] # {NONE}
                                PROOF BY <5>3, UU_ASSM
                           <6>5 QED BY <6>1,<6>2,<6>3, <6>4
                      <5>4 QED BY <5>2, <5>3                      
                 <4>4 QED BY <4>2, <4>3, <3>3, <2>12, <2>9 DEF unionCl
            <3>4 CASE u[2][2][e] # {NONE} /\ u[2][2][e] \cap UU # {}                 
                 <4>1 substMap3Equality(c1,c2) \/ substMap3Equality(c2,c1)
                      PROOF BY <2>9, <2>12 DEF unionCl
                 <4>2 CASE substMap3Equality(c1,c2)               
                      <5>1 u[2][2][e] = (matchLocks(c1, c2, e) 
                                                \cup c2[2][2][e]) \ {NONE}
                           PROOF BY <4>2, <2>9, <3>4 DEF unionCl
                      <5>2 CASE c1[2][2][e] \intersect UU = {}
                           <6>1 u[2][2][e] = (c1[2][2][e] 
                                                \cup c2[2][2][e]) \ {NONE}
                                PROOF BY <5>2, <5>1 DEF matchLocks
                           <6>2 CASE /\ c1[2][2][e] # {NONE} 
                                     /\ c2[2][2][e] # {NONE}
                                <7>1 c1[2][2][e] \subseteq y1[2][2][e]
                                     PROOF BY <2>5, <5>2, <6>2
                                           DEF compareClause, matchLocks
                                <7>2 c2[2][2][e] \intersect UU # {}
                                     PROOF BY <6>1, <5>2, <3>4, UU_ASSM
                                <7>3 (c2[2][2][e] \ UU) \cup {y1[1]} 
                                                        \subseteq y1[2][2][e]
                                     PROOF BY <2>6, <5>2, <6>2, <7>2
                                           DEF compareClause, matchLocks   
                                <7>4 QED BY <7>1, <7>3, <6>1, <7>2,
                                            <3>4 DEF matchLocks                                    
                           <6>3 CASE /\ c1[2][2][e] # {NONE} 
                                     /\ c2[2][2][e] = {NONE}  
                                <7>1 c1[2][2][e] \subseteq y1[2][2][e]
                                     PROOF BY <2>5, <5>2, <6>3
                                           DEF compareClause, matchLocks
                                <7>2 SUFFICES ((c1[2][2][e] \cup c2[2][2][e]) 
                                               \ {NONE}) \cup {y1[1]} 
                                               \subseteq y1[2][2][e]
                                     PROOF BY <5>1, <3>4, <5>2 DEF matchLocks
                                <7>3 y1[1] \in UU
                                     PROOF BY <3>4, <5>1, <5>2, <6>3,
                                     UU_ASSM DEF matchLocks                           
                                <7>4 QED BY <7>1, <7>2, <7>3, <5>2, <6>3, <6>1, 
                                            <3>4 DEF matchLocks
                           <6>4 CASE /\ c1[2][2][e] = {NONE} 
                                     /\ c2[2][2][e] # {NONE}  
                                <7>1 c2[2][2][e] \intersect UU # {}
                                     PROOF BY <6>1,<5>2, <3>4, UU_ASSM
                                <7>2 (c2[2][2][e] \UU) \cup {y1[1]} 
                                                  \subseteq y1[2][2][e]
                                     PROOF BY <2>6, <5>2, <6>4, <7>1
                                           DEF compareClause, matchLocks   
                                <7>3 QED BY <7>2, <6>4, <6>1, 
                                            <3>4 DEF matchLocks
                           <6>5 CASE /\ c1[2][2][e] = {NONE} 
                                     /\ c2[2][2][e] = {NONE} 
                                PROOF BY <6>5, <6>1, <3>4 DEF matchLocks 
                           <6>6 QED BY <6>2,<6>3, <6>4, <6>5                           
                      <5>3 CASE c1[2][2][e] \intersect UU # {}
                           <6>1 u[2][2][e] = ((c1[2][2][e] \ UU) \cup {c2[1]} 
                                                   \cup c2[2][2][e]) \ {NONE}
                                PROOF BY <5>3, <5>1 DEF matchLocks                          
                           <6>3 \/ /\ c2[2][2][e] \cap UU = {} /\ c2[1] \in UU
                                \/    c2[2][2][e] \cap UU # {}
                                PROOF BY <3>4, <6>1, <5>3
                           <6>4 CASE /\ c1[2][2][e] # {NONE} 
                                     /\ c2[2][2][e] # {NONE}
                                <7>1 ((c1[2][2][e] \ UU )
                                           \cup {y1[1]}) \subseteq y1[2][2][e]
                                     PROOF BY <2>5, <5>3, <6>4
                                           DEF compareClause, matchLocks
                                <7>2 (c2[2][2][e] \ UU) 
                                           \cup {y1[1]}  \subseteq y1[2][2][e]
                                     PROOF BY <2>6, <5>3, <6>4, <7>1
                                           DEF compareClause, matchLocks 
                                <7>3 c2[2][2][e] \cap UU # {}                                       
                                     PROOF BY <2>12, <4>2, <3>4, <2>9, <6>4, 
                                              Clause_ASSM1, U_ASSM, UU_ASSM, E1_LOCKS
                                           DEF PoliciesSet                            
                                \*<7>4 DOMAIN c2[2][2] = E1
                                \*     PROOF BY <6>4, <2>6, Clause_ASSM1 
                                \*           DEF PoliciesSet
                                \*<7>5 (UNION Range(c2[2][2])) \cap UU # {}
                                \*      PROOF BY <7>4, <7>3, <2>6, Clause_ASSM2 
                                \*            DEF Range, PoliciesSet
                                <7>6 {c2[1]} = UU
                                     PROOF BY  <7>3, Clause_ASSM2, UU_ASSM
                                           DEF PoliciesSet                                
                                <7>7 u[2][2][e] = (c1[2][2][e] \cup c2[2][2][e]) 
                                     PROOF BY <6>1, <6>4, <7>6, <5>3, <2>5, <2>6,
                                              U_ASSM, UU_ASSM, Clause_ASSM1
                                              DEF PoliciesSet
                                <7>8 u[2][2][e] = (c1[2][2][e] \ UU) 
                                                   \cup (c2[2][2][e] \ UU) \cup UU
                                     PROOF BY <7>7, <6>1, <7>3, UU_ASSM
                                <7>9 SUFFICES (((c1[2][2][e] \ UU) 
                                               \cup (c2[2][2][e] \ UU) \cup UU) \ UU) 
                                               \cup {y1[1]} \subseteq y1[2][2][e]
                                     PROOF BY <7>8, <3>4, UU_ASSM DEF matchLocks                               
                                <7>10 QED BY <7>1, <7>2                         
                           <6>5 CASE /\ c1[2][2][e] # {NONE} 
                                     /\ c2[2][2][e] = {NONE}  
                                <7>1 (c1[2][2][e] \ UU) 
                                                  \cup {y1[1]} \subseteq y1[2][2][e]
                                     PROOF BY <2>5, <5>3, <6>5
                                           DEF compareClause, matchLocks                                
                                <7>2 SUFFICES (((c1[2][2][e] \ UU) 
                                                  \cup {c2[1]}) \cup UU) \UU \subseteq y1[2][2][e]
                                     PROOF BY <5>1, <3>4, <5>3, <6>5, <7>1 
                                           DEF matchLocks 
                                <7>3 c2[1] \in UU
                                     PROOF BY <6>3, <6>5, UU_ASSM                          
                                <7>4 QED BY <7>1, <7>3, <3>4 DEF matchLocks
                           <6>6 c1[2][2][e] # {NONE}                                  
                                PROOF BY <5>3, UU_ASSM                           
                           <6>7 QED BY <6>6, <6>4, <6>5                       
                      <5>4 QED BY <5>2, <5>3
                 <4>3 CASE substMap3Equality(c2,c1) /\ ~substMap3Equality(c1,c2)               
                      <5>1 u[2][2][e] = (matchLocks(c2, c1, e) 
                                                \cup c1[2][2][e]) \ {NONE}
                           PROOF BY <4>3, <2>9, <3>4 DEF unionCl
                      <5>2 CASE c2[2][2][e] \intersect UU = {}
                           <6>1 u[2][2][e] = (c2[2][2][e] 
                                                \cup c1[2][2][e]) \ {NONE}
                                PROOF BY <5>2, <5>1 DEF matchLocks
                           <6>2 CASE /\ c1[2][2][e] # {NONE} 
                                     /\ c2[2][2][e] # {NONE}
                                <7>1 c2[2][2][e] \subseteq y1[2][2][e]
                                     PROOF BY <2>6, <5>2, <6>2
                                           DEF compareClause, matchLocks
                                <7>2 c1[2][2][e] \intersect UU # {}
                                     PROOF BY <6>1, <5>2, <3>4, UU_ASSM
                                <7>3 (c1[2][2][e] \ UU) \cup {y1[1]} 
                                                        \subseteq y1[2][2][e]
                                     PROOF BY <2>5, <5>2, <6>2, <7>2
                                           DEF compareClause, matchLocks   
                                <7>4 QED BY <7>1, <7>3, <6>1, <7>2,
                                            <3>4 DEF matchLocks                                    
                           <6>3 CASE /\ c1[2][2][e] = {NONE} 
                                     /\ c2[2][2][e] # {NONE}  
                                <7>1 c2[2][2][e] \subseteq y1[2][2][e]
                                     PROOF BY <2>6, <5>2, <6>3
                                           DEF compareClause, matchLocks
                                <7>2 SUFFICES ((c1[2][2][e] \cup c2[2][2][e]) 
                                               \ {NONE}) \cup {y1[1]} 
                                               \subseteq y1[2][2][e]
                                     PROOF BY <5>1, <3>4, <5>2 DEF matchLocks
                                <7>3 y1[1] \in UU
                                     PROOF BY <3>4, <5>1, <5>2, <6>3,
                                     UU_ASSM DEF matchLocks                           
                                <7>4 QED BY <7>1, <7>2, <7>3, <5>2, <6>3, <6>1, 
                                            <3>4 DEF matchLocks
                           <6>4 CASE /\ c1[2][2][e] # {NONE} 
                                     /\ c2[2][2][e] = {NONE}  
                                <7>1 c1[2][2][e] \intersect UU # {}
                                     PROOF BY <6>1,<5>2, <3>4, UU_ASSM
                                <7>2 (c1[2][2][e] \UU) \cup {y1[1]} 
                                                  \subseteq y1[2][2][e]
                                     PROOF BY <2>5, <5>2, <6>4, <7>1
                                           DEF compareClause, matchLocks   
                                <7>3 QED BY <7>2, <6>4, <6>1, 
                                            <3>4 DEF matchLocks
                           <6>5 CASE /\ c1[2][2][e] = {NONE} 
                                     /\ c2[2][2][e] = {NONE} 
                                PROOF BY <6>5, <6>1, <3>4 DEF matchLocks 
                           <6>6 QED BY <6>2,<6>3, <6>4, <6>5                           
                      <5>3 CASE c2[2][2][e] \intersect UU # {}
                           <6>1 u[2][2][e] = ((c2[2][2][e] \ UU) \cup {c1[1]} 
                                                   \cup c1[2][2][e]) \ {NONE}
                                PROOF BY <5>3, <5>1 DEF matchLocks                          
                           <6>3 \/ /\ c1[2][2][e] \cap UU = {} /\ c1[1] \in UU
                                \/    c1[2][2][e] \cap UU # {}
                                PROOF BY <3>4, <6>1, <5>3
                           <6>4 CASE /\ c1[2][2][e] # {NONE} 
                                     /\ c2[2][2][e] # {NONE}
                                <7>1 ((c2[2][2][e] \ UU )
                                           \cup {y1[1]}) \subseteq y1[2][2][e]
                                     PROOF BY <2>6, <5>3, <6>4
                                           DEF compareClause, matchLocks
                                <7>2 (c1[2][2][e] \ UU) 
                                           \cup {y1[1]}  \subseteq y1[2][2][e]
                                     PROOF BY <2>5, <5>3, <6>4, <7>1
                                           DEF compareClause, matchLocks 
                                <7>3 c1[2][2][e] \cap UU # {}
                                     PROOF BY <2>12, <4>3, <3>4, <2>9, <6>4, 
                                              Clause_ASSM1, U_ASSM, UU_ASSM, E1_LOCKS
                                           DEF PoliciesSet                                                                                                          
                              \*  <7>4 DOMAIN c1[2][2] = E1
                              \*       PROOF BY <6>4, <2>5, Clause_ASSM1 
                              \*             DEF PoliciesSet
                              \*  <7>5 (UNION Range(c1[2][2])) \cap UU # {}
                              \*        PROOF BY <7>4, <7>3, <2>5, Clause_ASSM2 
                              \*              DEF Range, PoliciesSet
                                <7>6 {c1[1]} = UU
                                     PROOF BY  <7>3, Clause_ASSM2, UU_ASSM
                                           DEF PoliciesSet                                
                                <7>7 u[2][2][e] = (c1[2][2][e] \cup c2[2][2][e]) 
                                     PROOF BY <6>1, <6>4, <7>6, <5>3, <2>5, <2>6, 
                                              UU_ASSM, U_ASSM, Clause_ASSM1 
                                              DEF PoliciesSet
                                <7>8 u[2][2][e] = (c2[2][2][e] \ UU) 
                                                   \cup (c1[2][2][e] \ UU) \cup UU
                                     PROOF BY <7>7, <6>1, <7>3, UU_ASSM
                                <7>9 SUFFICES (((c2[2][2][e] \ UU) 
                                               \cup (c1[2][2][e] \ UU) \cup UU) \ UU) 
                                               \cup {y1[1]} \subseteq y1[2][2][e]
                                     PROOF BY <7>8, <3>4, UU_ASSM DEF matchLocks                               
                                <7>10 QED BY <7>1, <7>2                         
                           <6>5 CASE /\ c2[2][2][e] # {NONE} 
                                     /\ c1[2][2][e] = {NONE}  
                                <7>1 (c2[2][2][e] \ UU) 
                                                  \cup {y1[1]} \subseteq y1[2][2][e]
                                     PROOF BY <2>6, <5>3, <6>5
                                           DEF compareClause, matchLocks                                
                                <7>2 SUFFICES (((c2[2][2][e] \ UU) 
                                                  \cup {c1[1]}) \cup UU) \UU \subseteq y1[2][2][e]
                                     PROOF BY <5>1, <3>4, <5>3, <6>5, <7>1 
                                           DEF matchLocks 
                                <7>3 c1[1] \in UU
                                     PROOF BY <6>3, <6>5, UU_ASSM                          
                                <7>4 QED BY <7>1, <7>3, <3>4 DEF matchLocks
                           <6>6 c2[2][2][e] # {NONE}                                  
                                PROOF BY <5>3, UU_ASSM                           
                           <6>7 QED BY <6>6, <6>4, <6>5                       
                      <5>4 QED BY <5>2, <5>3
                 <4>4 QED BY <4>2, <4>3, <3>4, <2>12, <2>9 DEF unionCl
            <3>5 QED BY <3>2, <3>3, <3>4
        
      <2>26 QED BY <2>25, <2>24, <2>16, <2>13 
                DEF compareClause, substMap3Equality
<1>6  QED BY <1>3, <1>4, <1>5 DEF comparePol


(***************************************************************************)
(* Lattice Invariant Def                                                   *)
(***************************************************************************)

LUBC (SS) == {p \in PoliciesSet : /\ \A s \in SS : comparePol(s, p)
                                  /\ \A y \in PoliciesSet : 
                                     \/ comparePol(p, y)
                                     \/ ~(\A r \in SS : comparePol(r, y))}

VARIABLES Policies2Set, curSet
varsP == <<Policies2Set, curSet>>

InitLattice == 
            /\ Policies2Set = {{x, y} : x \in PoliciesSet, y \in PoliciesSet}
            /\ curSet = CHOOSE x \in Policies2Set: TRUE

NextLattice == \/  /\ Policies2Set # {}
                   /\ Policies2Set' = Policies2Set \ {curSet}
                   /\ curSet' = CHOOSE x \in Policies2Set: TRUE 
               \/  UNCHANGED varsP 

LatticeInv == /\   LUBC (curSet) # {} \*Cardinality(LUBC (curSet)) = 1
                             
SpecLattice == InitLattice /\ [] [NextLattice]_varsP 


=============================================================================
\* Modification History
\* Last modified Mon Nov 14 18:18:32 MSK 2022 by user-sc
\* Created Fri Mar 25 14:37:19 MSK 2022 by user-sc
