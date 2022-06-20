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
const_16557432168332000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_16557432168333000 == 
{x}
----

\* SYMMETRY definition
symm_16557432168334000 == 
Permutations(const_16557432168332000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_16557432168335000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_16557432168336000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_16557432168337000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_16557432168338000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Mon Jun 20 19:40:16 MSK 2022 by user-sc
