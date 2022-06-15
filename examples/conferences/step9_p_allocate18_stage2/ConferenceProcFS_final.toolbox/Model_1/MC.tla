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
const_1655330623767285000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_1655330623767286000 == 
{x}
----

\* SYMMETRY definition
symm_1655330623767287000 == 
Permutations(const_1655330623767285000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_1655330623767288000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_1655330623767289000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_1655330623767290000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_1655330623767291000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Thu Jun 16 01:03:43 MSK 2022 by user-sc
