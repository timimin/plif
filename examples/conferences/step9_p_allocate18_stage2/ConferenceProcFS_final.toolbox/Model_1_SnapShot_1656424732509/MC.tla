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
const_16564247143812000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_16564247143813000 == 
{x}
----

\* SYMMETRY definition
symm_16564247143814000 == 
Permutations(const_16564247143812000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_16564247143815000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_16564247143816000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_16564247143817000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_16564247143818000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Tue Jun 28 16:58:34 MSK 2022 by user-sc
