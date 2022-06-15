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
const_1655326180468166000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_1655326180468167000 == 
{x}
----

\* SYMMETRY definition
symm_1655326180468168000 == 
Permutations(const_1655326180468166000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_1655326180468169000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_1655326180468170000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_1655326180468171000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_1655326180468172000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Wed Jun 15 23:49:40 MSK 2022 by user-sc
