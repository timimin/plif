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
const_165644806090038000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_165644806090039000 == 
{x}
----

\* SYMMETRY definition
symm_165644806090040000 == 
Permutations(const_165644806090038000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_165644806090041000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_165644806090042000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_165644806090043000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_165644806090044000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Tue Jun 28 23:27:40 MSK 2022 by user-sc
