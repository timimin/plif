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
const_165644265026329000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_165644265026330000 == 
{x}
----

\* SYMMETRY definition
symm_165644265026331000 == 
Permutations(const_165644265026329000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_165644265026332000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_165644265026333000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_165644265026334000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_165644265026335000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Tue Jun 28 21:57:30 MSK 2022 by user-sc
