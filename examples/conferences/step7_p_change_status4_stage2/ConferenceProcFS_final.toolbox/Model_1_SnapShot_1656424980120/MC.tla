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
const_165642496603011000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_165642496603012000 == 
{x}
----

\* SYMMETRY definition
symm_165642496603013000 == 
Permutations(const_165642496603011000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_165642496603014000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_165642496603015000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_165642496603016000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_165642496603017000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Tue Jun 28 17:02:46 MSK 2022 by user-sc
