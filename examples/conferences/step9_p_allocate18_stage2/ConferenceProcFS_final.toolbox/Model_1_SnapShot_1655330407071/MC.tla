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
const_1655330403015266000 == 
{allen, bob, alex, john}
----

\* MV CONSTANT definitions UU
const_1655330403015267000 == 
{x}
----

\* SYMMETRY definition
symm_1655330403015268000 == 
Permutations(const_1655330403015266000)
----

\* CONSTANT definitions @modelParameterConstants:1Session_number
const_1655330403015269000 == 
3
----

\* CONSTANT definitions @modelParameterConstants:3GPol
const_1655330403015270000 == 
("organizer" :> {"manager",  "reviewer", "guest"}) @@
                 ("manager" :> {"guest"}) @@
                 ("reviewer" :> {"guest"}) @@
                 ("guest" :>  {"guest"})
----

\* CONSTANT definitions @modelParameterConstants:6E0
const_1655330403015271000 == 
{"t_expire"}
----

\* CONSTANT definitions @modelParameterConstants:7E1
const_1655330403015272000 == 
{"guest", "reviewer", "manager", "organizer"}
----

\* Constant expression definition @modelExpressionEval
const_expr_1655330403015273000 == 
comparePol(min,min)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1655330403015273000>>)
----

\* INIT definition @modelBehaviorNoSpec:0
init_1655330403015274000 ==
FALSE/\VPol = 0
----
\* NEXT definition @modelBehaviorNoSpec:0
next_1655330403015275000 ==
FALSE/\VPol' = VPol
----
=============================================================================
\* Modification History
\* Created Thu Jun 16 01:00:03 MSK 2022 by user-sc
