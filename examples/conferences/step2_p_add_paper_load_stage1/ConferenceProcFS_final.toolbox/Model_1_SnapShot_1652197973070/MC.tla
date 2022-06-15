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
const_165219796101562000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_165219796101563000 == 
{x}
----

\* SYMMETRY definition
symm_165219796101564000 == 
Permutations(const_165219796101562000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_165219796101565000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_165219796101566000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_165219796101567000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_165219796101568000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Tue May 10 18:52:41 MSK 2022 by user-sc
