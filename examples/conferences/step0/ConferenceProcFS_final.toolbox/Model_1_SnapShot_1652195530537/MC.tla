---- MODULE MC ----
EXTENDS ConferenceProcFS_final, TLC

\* MV CONSTANT declarations@modelParameterConstants
CONSTANTS
x
----

\* MV CONSTANT definitions UU
const_165219551448233000 == 
{x}
----

\* CONSTANT definitions @modelParameterConstants:0U
const_165219551448234000 == 
{"allen", "bob", "alex", "john"}
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_165219551448235000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_165219551448236000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_165219551448237000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_165219551448238000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Tue May 10 18:11:54 MSK 2022 by user-sc
