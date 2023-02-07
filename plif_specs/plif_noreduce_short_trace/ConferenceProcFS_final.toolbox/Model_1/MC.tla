---- MODULE MC ----
EXTENDS ConferenceProcFS_final, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
allen, bob, alex, john, tom, cochar, remmy
----

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
x
----

\* MV CONSTANT definitions U
const_167578624898842000 == 
{allen, bob, alex, john, tom, cochar, remmy}
----

\* MV CONSTANT definitions UU
const_167578624898843000 == 
{x}
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_167578624898844000 == 
4
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_167578624898845000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_167578624898846000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_167578624898847000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Tue Feb 07 19:10:48 MSK 2023 by user-sc
