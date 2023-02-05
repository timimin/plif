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
const_167562494246042000 == 
{allen, bob, alex, john, tom, cochar, remmy}
----

\* MV CONSTANT definitions UU
const_167562494246043000 == 
{x}
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_167562494246044000 == 
6
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_167562494246045000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_167562494246046000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_167562494246047000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Sun Feb 05 22:22:22 MSK 2023 by user-sc
