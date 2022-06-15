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
const_16547905997052000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_16547905997053000 == 
{x}
----

\* SYMMETRY definition
symm_16547905997054000 == 
Permutations(const_16547905997052000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_16547905997055000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_16547905997056000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_16547905997057000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_16547905997058000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Thu Jun 09 19:03:19 MSK 2022 by user-sc
