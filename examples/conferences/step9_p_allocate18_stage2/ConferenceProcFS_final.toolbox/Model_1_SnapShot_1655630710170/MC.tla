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
const_16556306927742000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_16556306927743000 == 
{x}
----

\* SYMMETRY definition
symm_16556306927754000 == 
Permutations(const_16556306927742000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_16556306927755000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_16556306927756000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_16556306927757000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_16556306927758000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Sun Jun 19 12:24:52 MSK 2022 by user-sc
