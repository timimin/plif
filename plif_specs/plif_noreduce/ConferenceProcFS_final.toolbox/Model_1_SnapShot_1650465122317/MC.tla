---- MODULE MC ----
EXTENDS ConferenceProcFS_final, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
allen, bob, alex, john
----

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
x
----

\* MV CONSTANT definitions U
const_165046511405010000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_165046511405111000 == 
{x}
----

\* SYMMETRY definition
symm_165046511405112000 == 
Permutations(const_165046511405010000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_165046511405113000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_165046511405114000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_165046511405115000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_165046511405116000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Wed Apr 20 17:31:54 MSK 2022 by user-sc
