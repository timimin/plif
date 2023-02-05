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
const_16756212116972000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_16756212116973000 == 
{x}
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_16756212116984000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_16756212116985000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_16756212116986000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_16756212116987000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Sun Feb 05 21:20:11 MSK 2023 by user-sc
