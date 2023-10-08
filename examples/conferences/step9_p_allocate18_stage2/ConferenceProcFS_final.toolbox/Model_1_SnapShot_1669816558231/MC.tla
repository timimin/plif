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
const_1669816546172234000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_1669816546172235000 == 
{x}
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_1669816546172236000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_1669816546172237000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_1669816546172238000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_1669816546172239000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Wed Nov 30 16:55:46 MSK 2022 by user-sc
