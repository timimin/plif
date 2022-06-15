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
const_165512573523310000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_165512573523311000 == 
{x}
----

\* SYMMETRY definition
symm_165512573523312000 == 
Permutations(const_165512573523310000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_165512573523313000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_165512573523314000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_165512573523315000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_165512573523316000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Mon Jun 13 16:08:55 MSK 2022 by user-sc
