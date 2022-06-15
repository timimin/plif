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
const_1655329960643238000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_1655329960643239000 == 
{x}
----

\* SYMMETRY definition
symm_1655329960643240000 == 
Permutations(const_1655329960643238000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_1655329960643241000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_1655329960643242000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_1655329960643243000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_1655329960643244000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Thu Jun 16 00:52:40 MSK 2022 by user-sc
