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
const_16535813440132000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_16535813440133000 == 
{x}
----

\* SYMMETRY definition
symm_16535813440134000 == 
Permutations(const_16535813440132000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_16535813440135000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_16535813440136000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_16535813440137000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_16535813440138000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Thu May 26 19:09:04 MSK 2022 by user-sc
