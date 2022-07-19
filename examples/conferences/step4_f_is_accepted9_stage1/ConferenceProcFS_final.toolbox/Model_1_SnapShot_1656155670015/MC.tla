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
const_165615565995210000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_165615565995211000 == 
{x}
----

\* SYMMETRY definition
symm_165615565995212000 == 
Permutations(const_165615565995210000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_165615565995213000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_165615565995214000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_165615565995215000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_165615565995216000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Sat Jun 25 14:14:19 MSK 2022 by user-sc
