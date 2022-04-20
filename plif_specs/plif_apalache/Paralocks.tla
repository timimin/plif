----------------------------- MODULE Paralocks -----------------------------
(***************************************************************************)
(* Paralocks specification is an universal language for defining           *)
(* information flow security policy in applications.  Designed in Chalmers *)
(* University by N.  Broberg, D.  Sands.  This specification represents a  *)
(* subset of Paralocks limitted by sets of unparametrised and unary locks  *)
(* and can be used for information flow control in PL/SQL programs.        *)
(***************************************************************************)

EXTENDS Naturals, Apalache, Sequences, TLC

   
\* @typeAlias: U = Str;
\* @typeAlias: UNDEF = Str;

         \* @type: Set(U);
         U == {"allen", "jorge", "bob", "mattew", "john", "tom", "bill"}      
		         (**********************************************************)
                 (* the set of concrete actors (actor constants)           *)
                 (**********************************************************)
         \* @type: Set(U);
		 UU == {"x"}
        		 (**********************************************************)
                 (* the set of quantified (bound) actor variables used in  *)
                 (* policy definitions                                     *)
                 (**********************************************************)
		 \* @type: U;
		 NONE == "NONE"
         		 (**********************************************************)
                 (* in the absence of partially defined functions in TLA+  *)
                 (* this constant is used for representing empty locks in  *)
                 (* policy clauses                                         *)
                 (**********************************************************)
         \* @type: U;
		 ALL == "ALL"    
		         (**********************************************************)
                 (* is used for representing open unparameterised locks    *)
                 (* in the current lockstate                               *)
                 (**********************************************************)
		 \* @typeAlias: E0 = Str;
		 \* @type: Set(E0);
		 E0 == {"t_expire"}
        		 (**********************************************************)
                 (* the set of unparametrised locks                        *)
                 (**********************************************************) 
         \* @typeAlias: E1 = Str;
		 \* @type: Set(E1);
		 E1 ==  {"guest", "reviewer", "manager", "organizer"}   
		         (**********************************************************)
                 (* the set of unary locks (with a single argument i.e.    *)
                 (* roles)                                                 *)
                 (**********************************************************) 
         \* @type: UNDEF;
		 Undef == "Undef"
        		 (**********************************************************)
                 (* used for specifying undefined values in program state  *)
                 (**********************************************************)        
      
	  
		 GPol == 
		         ("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"}) 
				  
		         (**********************************************************)
                 (* global policies for transitivity                       *)
                 (**********************************************************)          
   
	   
\* @typeAlias: CLAUSE = <<U,<<E0 -> Set(U), E1 -> Set(U)>>>>;								   
\* @typeAlias: POLICY = Set(CLAUSE); 
\* @typeAlias: LOCKS = Str -> Set(U); 

(***************************************************************************)
(* ReduceSeq, ReduceSet, Tup, SeqOf, Range, FindFirstInSeq, IsPrefix,      *)
(* ReplaceInSet, IsNotSeqEmpty - are utility operators                     *)
(***************************************************************************)


\* @type: (a1 -> a2) => Set(a2);
Range(s) == {s[i] : i \in DOMAIN s}

pu == CHOOSE x \in UU: TRUE		

(***************************************************************************)
(* substMap3 - utility function. Rename bound                              *)
(* variables of the first clause in accordance with the variables of the   *)
(* second clause.                                                          *)
(***************************************************************************)

\* @type: (a4 -> a5, a6 -> a7) => (a8 -> a9);
f ## g == [x \in (DOMAIN f) \cup (DOMAIN g) |->
            CASE x \in DOMAIN f /\ x \in DOMAIN g -> 
                                IF f[x] \cap g[x] # {} THEN f[x] \cap g[x]
                                                       ELSE f[x]
            [] x \in DOMAIN f -> f[x]
            [] x \in DOMAIN g -> g[x]]

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

(***************************************************************************)
(* comparePol - is the policy comparison function.  Returns TRUE iff p1 is *)
(* less restrictive than p2.  See the full definition in [1].              *)
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

\* empty clause

		\* @type: CLAUSE;
		EC == <<"Undef", <<[e1 \in E0 |-> {NONE}],[e2 \in E1 |-> {NONE}]>> >> 


\* @type: (CLAUSE, CLAUSE) => CLAUSE;
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
        ELSE EC


\* @type: (POLICY, POLICY) => POLICY;		
LUB(p1, p2) == {x \in {unionCl(c1,c2): c1 \in p1, c2\in p2} : x # EC}  

\* TODO: There's probably a property-based way of specifying this
\* @type: Seq(POLICY) => POLICY;   
LUB4Seq(s) ==
    FoldSeq(LUB, 
            {<<
                pu, 
                <<[e1 \in E0 |-> {NONE}], 
                  [e2 \in E1 |-> {NONE}]>>
            >>}, 
            s
            )

(***************************************************************************)
(* ALSTP - the policy specialization operator.  It specializes an          *)
(* expression policy with the current lockstate at the point of            *)
(* assignment.  Logically the algorithm is based on the relational         *)
(* resolution reasoning method (with unification step).                    *)
(***************************************************************************)

\* @type: (Set(U), Set(U)) => Set(U -> U);
substMap4(uu, u) == 
    IF uu = {} 
    THEN {}
    ELSE {[u1 \in uu |-> u1]} \union { [u1 \in uu |-> y] : y \in u }                               

applySub(aset, sub) == 
    IF aset = {NONE} 
    THEN {NONE} 
    ELSE 
        {
            IF x \in DOMAIN sub 
            THEN sub[x]
            ELSE x
            : x \in aset
        }

\* @type: (CLAUSE, LOCKS, U -> U) => CLAUSE;
\* @type: (CLAUSE, LOCKS, U -> U) => CLAUSE;
specifyWithSub(c, locks, y) == 
    LET 
        f == c[2][1]
        g == c[2][2]
    IN LET
        S1 == 
        [ x \in DOMAIN f |-> 
            IF x \in E0 /\ locks[x] /= {}
            THEN {NONE}
            ELSE f[x]
        ]
    IN LET
        S2 == [ x \in DOMAIN g |->
            IF x \in E1
            THEN
                IF locks[x] = {}
                THEN applySub(g[x], y)
                ELSE 
                    IF applySub(g[x], y) \ locks[x] = {}
                    THEN {NONE}
                    ELSE applySub(g[x], y) \ locks[x]
            ELSE g[x]
            (* If we know applySub(g[x], y) cannot be {}, we can further simplify:
            IF x \in E1
            THEN
                IF applySub(g[x], y) \ locks[x] = {}
                THEN {NONE}
                ELSE applySub(g[x], y) \ locks[x]
            ELSE g[x]

            *)
        ]
    IN
    <<IF c[1] \in DOMAIN y 
         THEN y[c[1]]
         ELSE c[1], <<S1, S2>>
    >>

\* @type: (CLAUSE, LOCKS) => POLICY;                
contextClause(c, locks) ==
    LET
        contextClause_OP1 (x, y) ==
            LET sWS == specifyWithSub(c, locks, y)
            IN 
                \* IF ~p THEN A ELSE B is just IF p THEN B ELSE A
                IF \E i \in x: compareClause(i, sWS)
                THEN x
                ELSE (x \cup {sWS}) \ {i \in x: compareClause(sWS, i)}
    IN LET
        f == c[2][1]
    IN LET
        S1 == [ x \in DOMAIN f |->
            IF x \notin E0 \/ locks[x] = {}
            THEN f[x]
            ELSE {NONE}
        ]
    IN
        FoldSet (contextClause_OP1,
            {<< c[1], <<S1, c[2][2]>> >>},                    
            substMap4(
                IF c[1] \in UU 
                THEN {c[1]}
                ELSE {}, 
                UNION Range(locks) \cap U )
            ) 

\* @type: (POLICY, LOCKS) => POLICY;  
ALSTP(p, SE) ==
    LET
        \* Not sure exactly how, but I'm fairly confident there is a 
        \* set-theory-level simplification of this operator (and/or its fold).
        ALSTP_OP(x, y) ==           
             LET specifiedClauses ==
             \* ~\E g \in x: P <=> \A g \in x: ~P
             {i \in contextClause(y, SE): 
                \A g \in x: ~compareClause(g, i)}
             IN
             (x \cup specifiedClauses) \ {i \in x: \E g 
                \in specifiedClauses: compareClause(g, i)}
    IN LET
        \* We can avoid folding OP1, since all it does is add F(y1) to x1
        \* @type: CLAUSE => CLAUSE;
        ALSTP_OP1_direct(y) ==
            LET
                \* @type: E0 -> Set(U);
                f == y[2][1]
            IN LET
                \* We can avoid folding OP2, since all it does is chain EXCEPT
                \* @type: E0 -> Set(U);
                DirectUpdate == [ x \in DOMAIN f |->
                    IF x \in E0 /\ SE[x] /= {}
                    THEN {NONE}
                    ELSE f[x]
                ]
            IN << y[1], <<DirectUpdate, y[2][2]>> >> 
    IN LET
        \* No need to fold \cup, just map ALSTP_OP1_direct over p
        DirectSet == { ALSTP_OP1_direct(y): y \in p } 
    IN
    FoldSet(ALSTP_OP, DirectSet, p) 

									
(***************************************************************************)
(* COpenLocks - adds a new set of open locks generated based on global     *)
(* policy rules (recursive locks) into the current lockstate SE            *)
(***************************************************************************)

\* @type: ((E1 -> U), (E1 -> Set(E1))) => (E1 -> U);
COpenLocks(lock, GLOB) == 
    LET D  == CHOOSE i \in DOMAIN lock : TRUE
    IN 
        IF \E r \in DOMAIN GLOB : r = D
            THEN lock @@ [r \in GLOB[D] |-> lock[D]]
            ELSE lock
			
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
\* Last modified Sun Jan 09 14:19:36 MSK 2022 by user-sc
\* Last modified Sat Jan 08 11:48:34 MSK 2022 by user-sc
\* Last modified Sat Jun 19 12:59:48 MSK 2021 by user-sc
\* Last modified Fri Oct 02 09:31:12 MSK 2020 by user-sc
\* Last modified Sat Aug 29 19:20:37 MSK 2020 by User
\* Created Mon May 25 11:46:28 MSK 2020 by User
