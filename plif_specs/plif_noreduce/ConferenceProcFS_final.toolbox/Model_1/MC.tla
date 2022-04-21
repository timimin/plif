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
const_16505711439142000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_16505711439143000 == 
{x}
----

\* SYMMETRY definition
symm_16505711439144000 == 
Permutations(const_16505711439142000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_16505711439145000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_16505711439146000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_16505711439147000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_16505711439148000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Thu Apr 21 22:59:03 MSK 2022 by user-sc
