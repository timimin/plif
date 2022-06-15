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
const_165219523654018000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_165219523654019000 == 
{x}
----

\* SYMMETRY definition
symm_165219523654020000 == 
Permutations(const_165219523654018000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_165219523654021000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_165219523654022000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_165219523654023000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_165219523654024000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Tue May 10 18:07:16 MSK 2022 by user-sc
