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
const_16551256364742000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_16551256364743000 == 
{x}
----

\* SYMMETRY definition
symm_16551256364744000 == 
Permutations(const_16551256364742000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_16551256364745000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_16551256364746000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_16551256364747000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_16551256364748000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Mon Jun 13 16:07:16 MSK 2022 by user-sc
