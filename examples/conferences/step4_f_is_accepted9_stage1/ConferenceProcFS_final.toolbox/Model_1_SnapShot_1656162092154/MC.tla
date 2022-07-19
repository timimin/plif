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
const_165616207707718000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_165616207707719000 == 
{x}
----

\* SYMMETRY definition
symm_165616207707720000 == 
Permutations(const_165616207707718000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_165616207707721000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_165616207707722000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_165616207707723000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_165616207707724000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Sat Jun 25 16:01:17 MSK 2022 by user-sc
