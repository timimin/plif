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
const_1655325242092114000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_1655325242092115000 == 
{x}
----

\* SYMMETRY definition
symm_1655325242092116000 == 
Permutations(const_1655325242092114000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_1655325242092117000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_1655325242092118000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_1655325242092119000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_1655325242092120000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Wed Jun 15 23:34:02 MSK 2022 by user-sc
