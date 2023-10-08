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
const_1669816438135210000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_1669816438135211000 == 
{x}
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_1669816438135212000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_1669816438135213000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_1669816438135214000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_1669816438135215000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Wed Nov 30 16:53:58 MSK 2022 by user-sc
