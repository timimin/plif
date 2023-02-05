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
const_167562177434818000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_167562177434819000 == 
{x}
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_167562177434820000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_167562177434821000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_167562177434822000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_167562177434823000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Sun Feb 05 21:29:34 MSK 2023 by user-sc
