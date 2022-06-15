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
const_165219514519710000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_165219514519711000 == 
{x}
----

\* SYMMETRY definition
symm_165219514519712000 == 
Permutations(const_165219514519710000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_165219514519713000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_165219514519714000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_165219514519715000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_165219514519716000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Tue May 10 18:05:45 MSK 2022 by user-sc
