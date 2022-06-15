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
const_165532450058182000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_165532450058183000 == 
{x}
----

\* SYMMETRY definition
symm_165532450058184000 == 
Permutations(const_165532450058182000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_165532450058185000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_165532450058186000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_165532450058187000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_165532450058188000 == 
{"guest", "reviewer", "manager", "organizer"}
----

=============================================================================
\* Modification History
\* Created Wed Jun 15 23:21:40 MSK 2022 by user-sc
