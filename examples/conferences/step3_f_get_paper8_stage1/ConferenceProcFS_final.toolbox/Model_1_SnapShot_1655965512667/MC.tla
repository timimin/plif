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
const_165596549659526000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_165596549659527000 == 
{x}
----

\* SYMMETRY definition
symm_165596549659528000 == 
Permutations(const_165596549659526000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_165596549659529000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_165596549659530000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_165596549659531000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_165596549659532000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Thu Jun 23 09:24:56 MSK 2022 by user-sc
