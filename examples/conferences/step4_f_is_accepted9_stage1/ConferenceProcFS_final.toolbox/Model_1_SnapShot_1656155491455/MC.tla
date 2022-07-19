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
const_16561554812332000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_16561554812333000 == 
{x}
----

\* SYMMETRY definition
symm_16561554812334000 == 
Permutations(const_16561554812332000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_16561554812335000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_16561554812336000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_16561554812337000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_16561554812338000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Sat Jun 25 14:11:21 MSK 2022 by user-sc
