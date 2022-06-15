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
const_1655324850084106000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_1655324850084107000 == 
{x}
----

\* SYMMETRY definition
symm_1655324850084108000 == 
Permutations(const_1655324850084106000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_1655324850084109000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_1655324850084110000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_1655324850084111000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_1655324850084112000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Wed Jun 15 23:27:30 MSK 2022 by user-sc
