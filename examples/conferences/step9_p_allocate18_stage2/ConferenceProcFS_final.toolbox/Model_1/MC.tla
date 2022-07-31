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
const_16592788148782000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_16592788148783000 == 
{x}
----

\* SYMMETRY definition
symm_16592788148784000 == 
Permutations(const_16592788148782000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_16592788148785000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_16592788148786000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_16592788148787000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_16592788148788000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Sun Jul 31 17:46:54 MSK 2022 by user-sc
