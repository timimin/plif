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
const_16553177682922000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_16553177682923000 == 
{x}
----

\* SYMMETRY definition
symm_16553177682924000 == 
Permutations(const_16553177682922000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_16553177682925000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_16553177682926000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_16553177682927000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_16553177682928000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Wed Jun 15 21:29:28 MSK 2022 by user-sc
