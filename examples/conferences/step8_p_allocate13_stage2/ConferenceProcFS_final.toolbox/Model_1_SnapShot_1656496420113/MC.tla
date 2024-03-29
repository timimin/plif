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
const_16564964047052000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_16564964047053000 == 
{x}
----

\* SYMMETRY definition
symm_16564964047054000 == 
Permutations(const_16564964047052000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_16564964047055000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_16564964047056000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_16564964047057000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_16564964047058000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Wed Jun 29 12:53:24 MSK 2022 by user-sc
