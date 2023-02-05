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
const_1669816714006274000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_1669816714006275000 == 
{x}
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_1669816714006276000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_1669816714006277000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_1669816714006278000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_1669816714006279000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Wed Nov 30 16:58:34 MSK 2022 by user-sc
