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
const_1655327918391193000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_1655327918391194000 == 
{x}
----

\* SYMMETRY definition
symm_1655327918391195000 == 
Permutations(const_1655327918391193000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_1655327918391196000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_1655327918391197000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_1655327918391198000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_1655327918391199000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Thu Jun 16 00:18:38 MSK 2022 by user-sc
