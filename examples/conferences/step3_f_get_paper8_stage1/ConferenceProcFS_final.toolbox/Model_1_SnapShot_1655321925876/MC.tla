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
const_165532191481410000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_165532191481411000 == 
{x}
----

\* SYMMETRY definition
symm_165532191481512000 == 
Permutations(const_165532191481410000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_165532191481513000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_165532191481514000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_165532191481515000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_165532191481516000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Wed Jun 15 22:38:34 MSK 2022 by user-sc
