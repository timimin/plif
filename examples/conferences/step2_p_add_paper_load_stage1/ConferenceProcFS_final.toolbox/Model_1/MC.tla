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
const_165576165043010000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_165576165043011000 == 
{x}
----

\* SYMMETRY definition
symm_165576165043012000 == 
Permutations(const_165576165043010000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_165576165043013000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_165576165043014000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_165576165043015000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_165576165043016000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Tue Jun 21 00:47:30 MSK 2022 by user-sc
