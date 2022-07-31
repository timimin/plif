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
const_165928194122311000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_165928194122312000 == 
{x}
----

\* SYMMETRY definition
symm_165928194122313000 == 
Permutations(const_165928194122311000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_165928194122314000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_165928194122315000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_165928194122316000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_165928194122317000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Sun Jul 31 18:39:01 MSK 2022 by user-sc
