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
const_16504653927392000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_16504653927393000 == 
{x}
----

\* SYMMETRY definition
symm_16504653927394000 == 
Permutations(const_16504653927392000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_16504653927395000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_16504653927396000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_16504653927397000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_16504653927398000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Wed Apr 20 17:36:32 MSK 2022 by user-sc
