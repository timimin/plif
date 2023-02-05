(* automatically generated -- do not edit manually *)
theory ParalocksLattice imports Constant Zenon begin
ML_command {* writeln ("*** TLAPS PARSED\n"); *}
consts
  "isReal" :: c
  "isa_slas_a" :: "[c,c] => c"
  "isa_bksl_diva" :: "[c,c] => c"
  "isa_perc_a" :: "[c,c] => c"
  "isa_peri_peri_a" :: "[c,c] => c"
  "isInfinity" :: c
  "isa_lbrk_rbrk_a" :: "[c] => c"
  "isa_less_more_a" :: "[c] => c"

lemma ob'59:
(* usable definition IsFiniteSet suppressed *)
(* usable definition Cardinality suppressed *)
fixes U
fixes UU
fixes NONE
fixes a_E0a
fixes a_E1a
fixes ALL
fixes Undef
fixes GPol
(* usable definition Range suppressed *)
(* usable definition ## suppressed *)
(* usable definition substMap3Equality suppressed *)
(* usable definition matchLocks suppressed *)
(* usable definition compareClause suppressed *)
(* usable definition comparePol suppressed *)
(* usable definition GLB suppressed *)
(* usable definition unionCl suppressed *)
(* usable definition LUB suppressed *)
(* usable definition LUB2 suppressed *)
(* usable definition ClausesSet suppressed *)
(* usable definition PoliciesSet suppressed *)
(* usable definition Ref suppressed *)
(* usable definition Trans suppressed *)
(* usable definition AntiSym suppressed *)
fixes a_p1a
assumes a_p1a_in : "(a_p1a \<in> (PoliciesSet))"
fixes a_p2a
assumes a_p2a_in : "(a_p2a \<in> (PoliciesSet))"
fixes l
assumes l_in : "(l \<in> (PoliciesSet))"
fixes y
assumes y_in : "(y \<in> (PoliciesSet))"
fixes a_y1a
assumes a_y1a_in : "(a_y1a \<in> (y))"
fixes a_c1a
assumes a_c1a_in : "(a_c1a \<in> (a_p1a))"
fixes a_c2a
assumes a_c2a_in : "(a_c2a \<in> (a_p2a))"
fixes u
assumes v'93: "(\<forall> k \<in> (a_E0a) : ((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({(NONE)}))) \<and> (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({(NONE)}))))) | (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))) \<or> (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({})))))))"
assumes v'94: "(\<forall> k \<in> (a_E0a) : (((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))) \<or> (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) \<Rightarrow> (((fapply ((fapply ((fapply ((u), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))))"
assumes v'95: "(\<forall> k \<in> (a_E0a) : (((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({(NONE)}))) \<and> (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({(NONE)}))))) \<Rightarrow> (((fapply ((fapply ((fapply ((u), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({(NONE)}))))))"
assumes v'96: "(\<forall> k \<in> (a_E0a) : (((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))) \<or> (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) \<Rightarrow> (((fapply ((fapply ((fapply ((a_y1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))))"
assumes v'97: "(\<forall> k \<in> (a_E0a) : (((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({(NONE)}))) \<and> (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({(NONE)}))))) \<Rightarrow> (((((fapply ((fapply ((fapply ((a_y1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({(NONE)}))) \<or> (((fapply ((fapply ((fapply ((a_y1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))))))"
shows "(\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((u), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_y1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_y1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({})))))"(is "PROP ?ob'59")
proof -
ML_command {* writeln "*** TLAPS ENTER 59"; *}
show "PROP ?ob'59"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_cb2dab.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_cb2dab.znn.out
;; obligation #59
$hyp "a_p1a_in" (TLA.in a_p1a PoliciesSet)
$hyp "a_p2a_in" (TLA.in a_p2a PoliciesSet)
$hyp "l_in" (TLA.in l PoliciesSet)
$hyp "y_in" (TLA.in y PoliciesSet)
$hyp "a_y1a_in" (TLA.in a_y1a y)
$hyp "a_c1a_in" (TLA.in a_c1a a_p1a)
$hyp "a_c2a_in" (TLA.in a_c2a a_p2a)
$hyp "v'93" (TLA.bAll a_E0a ((k) (\/ (/\ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.set NONE))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.set NONE)))
(\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset)
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset)))))
$hyp "v'94" (TLA.bAll a_E0a ((k) (=> (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset)
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))
(= (TLA.fapply (TLA.fapply (TLA.fapply u (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
$hyp "v'95" (TLA.bAll a_E0a ((k) (=> (/\ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.set NONE))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.set NONE)))
(= (TLA.fapply (TLA.fapply (TLA.fapply u (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.set NONE)))))
$hyp "v'96" (TLA.bAll a_E0a ((k) (=> (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset)
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_y1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
$hyp "v'97" (TLA.bAll a_E0a ((k) (=> (/\ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.set NONE))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.set NONE)))
(\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_y1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.set NONE))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_y1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset)))))
$goal (TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply u (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_y1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_y1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Hh:"bAll(a_E0a, (\<lambda>k. ((((((a_c1a[2])[1])[k])={NONE})&((((a_c2a[2])[1])[k])={NONE}))|(((((a_c1a[2])[1])[k])={})|((((a_c2a[2])[1])[k])={})))))" (is "?z_hh")
 using v'93 by blast
 have z_Hk:"bAll(a_E0a, (\<lambda>k. ((((((a_c1a[2])[1])[k])={})|((((a_c2a[2])[1])[k])={}))=>((((a_y1a[2])[1])[k])={}))))" (is "?z_hk")
 using v'96 by blast
 have z_Hl:"bAll(a_E0a, (\<lambda>k. ((((((a_c1a[2])[1])[k])={NONE})&((((a_c2a[2])[1])[k])={NONE}))=>(((((a_y1a[2])[1])[k])={NONE})|((((a_y1a[2])[1])[k])={})))))" (is "?z_hl")
 using v'97 by blast
 have z_Hj:"bAll(a_E0a, (\<lambda>k. ((((((a_c1a[2])[1])[k])={NONE})&((((a_c2a[2])[1])[k])={NONE}))=>((((u[2])[1])[k])={NONE}))))" (is "?z_hj")
 using v'95 by blast
 have zenon_L1_: "(\\A x:((x \\in a_E0a)=>((((((a_c1a[2])[1])[x])={NONE})&((((a_c2a[2])[1])[x])={NONE}))|(((((a_c1a[2])[1])[x])={})|((((a_c2a[2])[1])[x])={}))))) ==> ((CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={}))))) \\in a_E0a) ==> ((((a_c1a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))])~={NONE}) ==> ((((a_c1a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))])~={}) ==> ((((a_c2a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))])~={}) ==> FALSE" (is "?z_hcc ==> ?z_hcp ==> ?z_hcy ==> ?z_hda ==> ?z_hdb ==> FALSE")
 proof -
  assume z_Hcc:"?z_hcc" (is "\\A x : ?z_hdd(x)")
  assume z_Hcp:"?z_hcp"
  assume z_Hcy:"?z_hcy" (is "?z_hcz~=?z_hz")
  assume z_Hda:"?z_hda"
  assume z_Hdb:"?z_hdb" (is "?z_hdc~=_")
  have z_Hde: "?z_hdd((CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={}))))))" (is "_=>?z_hdf")
  by (rule zenon_all_0 [of "?z_hdd" "(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))", OF z_Hcc])
  show FALSE
  proof (rule zenon_imply [OF z_Hde])
   assume z_Hdg:"(~?z_hcp)"
   show FALSE
   by (rule notE [OF z_Hdg z_Hcp])
  next
   assume z_Hdf:"?z_hdf" (is "?z_hdh|?z_hdi")
   show FALSE
   proof (rule zenon_or [OF z_Hdf])
    assume z_Hdh:"?z_hdh" (is "?z_hdj&?z_hdk")
    have z_Hdj: "?z_hdj"
    by (rule zenon_and_0 [OF z_Hdh])
    show FALSE
    by (rule notE [OF z_Hcy z_Hdj])
   next
    assume z_Hdi:"?z_hdi" (is "?z_hdl|?z_hdm")
    show FALSE
    proof (rule zenon_or [OF z_Hdi])
     assume z_Hdl:"?z_hdl"
     show FALSE
     by (rule notE [OF z_Hda z_Hdl])
    next
     assume z_Hdm:"?z_hdm"
     show FALSE
     by (rule notE [OF z_Hdb z_Hdm])
    qed
   qed
  qed
 qed
 have zenon_L2_: "(~(((((a_c1a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))])={})|((((a_c2a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))])={}))) ==> ((((a_c1a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))])~={NONE}) ==> ((CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={}))))) \\in a_E0a) ==> (\\A x:((x \\in a_E0a)=>((((((a_c1a[2])[1])[x])={NONE})&((((a_c2a[2])[1])[x])={NONE}))|(((((a_c1a[2])[1])[x])={})|((((a_c2a[2])[1])[x])={}))))) ==> FALSE" (is "?z_hdn ==> ?z_hcy ==> ?z_hcp ==> ?z_hcc ==> FALSE")
 proof -
  assume z_Hdn:"?z_hdn" (is "~(?z_hdl|?z_hdm)")
  assume z_Hcy:"?z_hcy" (is "?z_hcz~=?z_hz")
  assume z_Hcp:"?z_hcp"
  assume z_Hcc:"?z_hcc" (is "\\A x : ?z_hdd(x)")
  have z_Hda: "(?z_hcz~={})"
  by (rule zenon_notor_0 [OF z_Hdn])
  have z_Hdb: "((((a_c2a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))])~={})" (is "?z_hdc~=_")
  by (rule zenon_notor_1 [OF z_Hdn])
  show FALSE
  by (rule zenon_L1_ [OF z_Hcc z_Hcp z_Hcy z_Hda z_Hdb])
 qed
 have zenon_L3_: "(\\A x:((x \\in a_E0a)=>((((((a_c1a[2])[1])[x])={})|((((a_c2a[2])[1])[x])={}))=>((((a_y1a[2])[1])[x])={})))) ==> ((CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={}))))) \\in a_E0a) ==> ((((a_c1a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))])~={NONE}) ==> (\\A x:((x \\in a_E0a)=>((((((a_c1a[2])[1])[x])={NONE})&((((a_c2a[2])[1])[x])={NONE}))|(((((a_c1a[2])[1])[x])={})|((((a_c2a[2])[1])[x])={}))))) ==> ((((a_y1a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))])~={}) ==> FALSE" (is "?z_hdo ==> ?z_hcp ==> ?z_hcy ==> ?z_hcc ==> ?z_hdr ==> FALSE")
 proof -
  assume z_Hdo:"?z_hdo" (is "\\A x : ?z_hdt(x)")
  assume z_Hcp:"?z_hcp"
  assume z_Hcy:"?z_hcy" (is "?z_hcz~=?z_hz")
  assume z_Hcc:"?z_hcc" (is "\\A x : ?z_hdd(x)")
  assume z_Hdr:"?z_hdr" (is "?z_hds~=_")
  have z_Hdu: "?z_hdt((CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={}))))))" (is "_=>?z_hdv")
  by (rule zenon_all_0 [of "?z_hdt" "(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))", OF z_Hdo])
  show FALSE
  proof (rule zenon_imply [OF z_Hdu])
   assume z_Hdg:"(~?z_hcp)"
   show FALSE
   by (rule notE [OF z_Hdg z_Hcp])
  next
   assume z_Hdv:"?z_hdv" (is "?z_hdi=>?z_hdw")
   show FALSE
   proof (rule zenon_imply [OF z_Hdv])
    assume z_Hdn:"(~?z_hdi)" (is "~(?z_hdl|?z_hdm)")
    show FALSE
    by (rule zenon_L2_ [OF z_Hdn z_Hcy z_Hcp z_Hcc])
   next
    assume z_Hdw:"?z_hdw"
    show FALSE
    by (rule notE [OF z_Hdr z_Hdw])
   qed
  qed
 qed
 have zenon_L4_: "(\\A x:((x \\in a_E0a)=>((((((a_c1a[2])[1])[x])={NONE})&((((a_c2a[2])[1])[x])={NONE}))|(((((a_c1a[2])[1])[x])={})|((((a_c2a[2])[1])[x])={}))))) ==> ((CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={}))))) \\in a_E0a) ==> ((((a_c2a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))])~={NONE}) ==> ((((a_c1a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))])~={}) ==> ((((a_c2a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))])~={}) ==> FALSE" (is "?z_hcc ==> ?z_hcp ==> ?z_hdx ==> ?z_hda ==> ?z_hdb ==> FALSE")
 proof -
  assume z_Hcc:"?z_hcc" (is "\\A x : ?z_hdd(x)")
  assume z_Hcp:"?z_hcp"
  assume z_Hdx:"?z_hdx" (is "?z_hdc~=?z_hz")
  assume z_Hda:"?z_hda" (is "?z_hcz~=_")
  assume z_Hdb:"?z_hdb"
  have z_Hde: "?z_hdd((CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={}))))))" (is "_=>?z_hdf")
  by (rule zenon_all_0 [of "?z_hdd" "(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))", OF z_Hcc])
  show FALSE
  proof (rule zenon_imply [OF z_Hde])
   assume z_Hdg:"(~?z_hcp)"
   show FALSE
   by (rule notE [OF z_Hdg z_Hcp])
  next
   assume z_Hdf:"?z_hdf" (is "?z_hdh|?z_hdi")
   show FALSE
   proof (rule zenon_or [OF z_Hdf])
    assume z_Hdh:"?z_hdh" (is "?z_hdj&?z_hdk")
    have z_Hdk: "?z_hdk"
    by (rule zenon_and_1 [OF z_Hdh])
    show FALSE
    by (rule notE [OF z_Hdx z_Hdk])
   next
    assume z_Hdi:"?z_hdi" (is "?z_hdl|?z_hdm")
    show FALSE
    proof (rule zenon_or [OF z_Hdi])
     assume z_Hdl:"?z_hdl"
     show FALSE
     by (rule notE [OF z_Hda z_Hdl])
    next
     assume z_Hdm:"?z_hdm"
     show FALSE
     by (rule notE [OF z_Hdb z_Hdm])
    qed
   qed
  qed
 qed
 have zenon_L5_: "(~(((((a_c1a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))])={})|((((a_c2a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))])={}))) ==> ((((a_c2a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))])~={NONE}) ==> ((CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={}))))) \\in a_E0a) ==> (\\A x:((x \\in a_E0a)=>((((((a_c1a[2])[1])[x])={NONE})&((((a_c2a[2])[1])[x])={NONE}))|(((((a_c1a[2])[1])[x])={})|((((a_c2a[2])[1])[x])={}))))) ==> FALSE" (is "?z_hdn ==> ?z_hdx ==> ?z_hcp ==> ?z_hcc ==> FALSE")
 proof -
  assume z_Hdn:"?z_hdn" (is "~(?z_hdl|?z_hdm)")
  assume z_Hdx:"?z_hdx" (is "?z_hdc~=?z_hz")
  assume z_Hcp:"?z_hcp"
  assume z_Hcc:"?z_hcc" (is "\\A x : ?z_hdd(x)")
  have z_Hda: "((((a_c1a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))])~={})" (is "?z_hcz~=_")
  by (rule zenon_notor_0 [OF z_Hdn])
  have z_Hdb: "(?z_hdc~={})"
  by (rule zenon_notor_1 [OF z_Hdn])
  show FALSE
  by (rule zenon_L4_ [OF z_Hcc z_Hcp z_Hdx z_Hda z_Hdb])
 qed
 have zenon_L6_: "(\\A x:((x \\in a_E0a)=>((((((a_c1a[2])[1])[x])={})|((((a_c2a[2])[1])[x])={}))=>((((a_y1a[2])[1])[x])={})))) ==> ((CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={}))))) \\in a_E0a) ==> ((((a_c2a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))])~={NONE}) ==> (\\A x:((x \\in a_E0a)=>((((((a_c1a[2])[1])[x])={NONE})&((((a_c2a[2])[1])[x])={NONE}))|(((((a_c1a[2])[1])[x])={})|((((a_c2a[2])[1])[x])={}))))) ==> ((((a_y1a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))])~={}) ==> FALSE" (is "?z_hdo ==> ?z_hcp ==> ?z_hdx ==> ?z_hcc ==> ?z_hdr ==> FALSE")
 proof -
  assume z_Hdo:"?z_hdo" (is "\\A x : ?z_hdt(x)")
  assume z_Hcp:"?z_hcp"
  assume z_Hdx:"?z_hdx" (is "?z_hdc~=?z_hz")
  assume z_Hcc:"?z_hcc" (is "\\A x : ?z_hdd(x)")
  assume z_Hdr:"?z_hdr" (is "?z_hds~=_")
  have z_Hdu: "?z_hdt((CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={}))))))" (is "_=>?z_hdv")
  by (rule zenon_all_0 [of "?z_hdt" "(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))", OF z_Hdo])
  show FALSE
  proof (rule zenon_imply [OF z_Hdu])
   assume z_Hdg:"(~?z_hcp)"
   show FALSE
   by (rule notE [OF z_Hdg z_Hcp])
  next
   assume z_Hdv:"?z_hdv" (is "?z_hdi=>?z_hdw")
   show FALSE
   proof (rule zenon_imply [OF z_Hdv])
    assume z_Hdn:"(~?z_hdi)" (is "~(?z_hdl|?z_hdm)")
    show FALSE
    by (rule zenon_L5_ [OF z_Hdn z_Hdx z_Hcp z_Hcc])
   next
    assume z_Hdw:"?z_hdw"
    show FALSE
    by (rule notE [OF z_Hdr z_Hdw])
   qed
  qed
 qed
 assume z_Hm:"(~bAll(a_E0a, (\<lambda>k. (((((u[2])[1])[k])=(((a_y1a[2])[1])[k]))|((((a_y1a[2])[1])[k])={})))))" (is "~?z_hdy")
 have z_Hcc_z_Hh: "(\\A x:((x \\in a_E0a)=>((((((a_c1a[2])[1])[x])={NONE})&((((a_c2a[2])[1])[x])={NONE}))|(((((a_c1a[2])[1])[x])={})|((((a_c2a[2])[1])[x])={}))))) == ?z_hh" (is "?z_hcc == _")
 by (unfold bAll_def)
 have z_Hcc: "?z_hcc" (is "\\A x : ?z_hdd(x)")
 by (unfold z_Hcc_z_Hh, fact z_Hh)
 have z_Hec_z_Hj: "(\\A x:((x \\in a_E0a)=>((((((a_c1a[2])[1])[x])={NONE})&((((a_c2a[2])[1])[x])={NONE}))=>((((u[2])[1])[x])={NONE})))) == ?z_hj" (is "?z_hec == _")
 by (unfold bAll_def)
 have z_Hec: "?z_hec" (is "\\A x : ?z_heg(x)")
 by (unfold z_Hec_z_Hj, fact z_Hj)
 have z_Hdo_z_Hk: "(\\A x:((x \\in a_E0a)=>((((((a_c1a[2])[1])[x])={})|((((a_c2a[2])[1])[x])={}))=>((((a_y1a[2])[1])[x])={})))) == ?z_hk" (is "?z_hdo == _")
 by (unfold bAll_def)
 have z_Hdo: "?z_hdo" (is "\\A x : ?z_hdt(x)")
 by (unfold z_Hdo_z_Hk, fact z_Hk)
 have z_Heh_z_Hl: "(\\A x:((x \\in a_E0a)=>((((((a_c1a[2])[1])[x])={NONE})&((((a_c2a[2])[1])[x])={NONE}))=>(((((a_y1a[2])[1])[x])={NONE})|((((a_y1a[2])[1])[x])={}))))) == ?z_hl" (is "?z_heh == _")
 by (unfold bAll_def)
 have z_Heh: "?z_heh" (is "\\A x : ?z_hem(x)")
 by (unfold z_Heh_z_Hl, fact z_Hl)
 have z_Hen_z_Hm: "(~(\\A x:((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={}))))) == (~?z_hdy)" (is "?z_hen == ?z_hm")
 by (unfold bAll_def)
 have z_Hen: "?z_hen" (is "~(\\A x : ?z_hep(x))")
 by (unfold z_Hen_z_Hm, fact z_Hm)
 have z_Heq: "(\\E x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))" (is "\\E x : ?z_her(x)")
 by (rule zenon_notallex_0 [of "?z_hep", OF z_Hen])
 have z_Hes: "?z_her((CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={}))))))" (is "~(?z_hcp=>?z_het)")
 by (rule zenon_ex_choose_0 [of "?z_her", OF z_Heq])
 have z_Hcp: "?z_hcp"
 by (rule zenon_notimply_0 [OF z_Hes])
 have z_Heu: "(~?z_het)" (is "~(?z_hev|?z_hdw)")
 by (rule zenon_notimply_1 [OF z_Hes])
 have z_Hew: "((((u[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))])~=(((a_y1a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))]))" (is "?z_hex~=?z_hds")
 by (rule zenon_notor_0 [OF z_Heu])
 have z_Hdr: "(?z_hds~={})"
 by (rule zenon_notor_1 [OF z_Heu])
 have z_Hey: "?z_hem((CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={}))))))" (is "_=>?z_hez")
 by (rule zenon_all_0 [of "?z_hem" "(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))", OF z_Heh])
 show FALSE
 proof (rule zenon_imply [OF z_Hey])
  assume z_Hdg:"(~?z_hcp)"
  show FALSE
  by (rule notE [OF z_Hdg z_Hcp])
 next
  assume z_Hez:"?z_hez" (is "?z_hdh=>?z_hfa")
  show FALSE
  proof (rule zenon_imply [OF z_Hez])
   assume z_Hfb:"(~?z_hdh)" (is "~(?z_hdj&?z_hdk)")
   show FALSE
   proof (rule zenon_notand [OF z_Hfb])
    assume z_Hcy:"((((a_c1a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))])~={NONE})" (is "?z_hcz~=?z_hz")
    show FALSE
    by (rule zenon_L3_ [OF z_Hdo z_Hcp z_Hcy z_Hcc z_Hdr])
   next
    assume z_Hdx:"((((a_c2a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))])~={NONE})" (is "?z_hdc~=?z_hz")
    show FALSE
    by (rule zenon_L6_ [OF z_Hdo z_Hcp z_Hdx z_Hcc z_Hdr])
   qed
  next
   assume z_Hfa:"?z_hfa" (is "?z_hfc|_")
   show FALSE
   proof (rule zenon_or [OF z_Hfa])
    assume z_Hfc:"?z_hfc" (is "_=?z_hz")
    have z_Hdu: "?z_hdt((CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={}))))))" (is "_=>?z_hdv")
    by (rule zenon_all_0 [of "?z_hdt" "(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))", OF z_Hdo])
    show FALSE
    proof (rule zenon_imply [OF z_Hdu])
     assume z_Hdg:"(~?z_hcp)"
     show FALSE
     by (rule notE [OF z_Hdg z_Hcp])
    next
     assume z_Hdv:"?z_hdv" (is "?z_hdi=>_")
     show FALSE
     proof (rule zenon_imply [OF z_Hdv])
      assume z_Hdn:"(~?z_hdi)" (is "~(?z_hdl|?z_hdm)")
      have z_Hda: "((((a_c1a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))])~={})" (is "?z_hcz~=_")
      by (rule zenon_notor_0 [OF z_Hdn])
      have z_Hdb: "((((a_c2a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))])~={})" (is "?z_hdc~=_")
      by (rule zenon_notor_1 [OF z_Hdn])
      have z_Hde: "?z_hdd((CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={}))))))" (is "_=>?z_hdf")
      by (rule zenon_all_0 [of "?z_hdd" "(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))", OF z_Hcc])
      show FALSE
      proof (rule zenon_imply [OF z_Hde])
       assume z_Hdg:"(~?z_hcp)"
       show FALSE
       by (rule notE [OF z_Hdg z_Hcp])
      next
       assume z_Hdf:"?z_hdf"
       show FALSE
       proof (rule zenon_or [OF z_Hdf])
        assume z_Hdh:"?z_hdh" (is "?z_hdj&?z_hdk")
        have z_Hdj: "?z_hdj"
        by (rule zenon_and_0 [OF z_Hdh])
        have z_Hdk: "?z_hdk"
        by (rule zenon_and_1 [OF z_Hdh])
        have z_Hfd: "?z_heg((CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={}))))))" (is "_=>?z_hfe")
        by (rule zenon_all_0 [of "?z_heg" "(CHOOSE x:(~((x \\in a_E0a)=>(((((u[2])[1])[x])=(((a_y1a[2])[1])[x]))|((((a_y1a[2])[1])[x])={})))))", OF z_Hec])
        show FALSE
        proof (rule zenon_imply [OF z_Hfd])
         assume z_Hdg:"(~?z_hcp)"
         show FALSE
         by (rule notE [OF z_Hdg z_Hcp])
        next
         assume z_Hfe:"?z_hfe" (is "_=>?z_hff")
         show FALSE
         proof (rule zenon_imply [OF z_Hfe])
          assume z_Hfb:"(~?z_hdh)"
          show FALSE
          proof (rule zenon_notand [OF z_Hfb])
           assume z_Hcy:"(?z_hcz~=?z_hz)"
           show FALSE
           by (rule notE [OF z_Hcy z_Hdj])
          next
           assume z_Hdx:"(?z_hdc~=?z_hz)"
           show FALSE
           by (rule notE [OF z_Hdx z_Hdk])
          qed
         next
          assume z_Hff:"?z_hff"
          show FALSE
          proof (rule zenon_em [of "(?z_hds=?z_hds)"])
           assume z_Hfg:"(?z_hds=?z_hds)"
           show FALSE
           proof (rule notE [OF z_Hew])
            have z_Hfh: "(?z_hds=?z_hex)"
            proof (rule zenon_nnpp [of "(?z_hds=?z_hex)"])
             assume z_Hfi:"(?z_hds~=?z_hex)"
             show FALSE
             proof (rule notE [OF z_Hfi])
              have z_Hfj: "(?z_hz=?z_hex)"
              by (rule sym [OF z_Hff])
              have z_Hfh: "(?z_hds=?z_hex)"
              by (rule subst [where P="(\<lambda>zenon_Vyk. (?z_hds=zenon_Vyk))", OF z_Hfj], fact z_Hfc)
              thus "(?z_hds=?z_hex)" .
             qed
            qed
            have z_Hev: "?z_hev"
            by (rule subst [where P="(\<lambda>zenon_Vzk. (zenon_Vzk=?z_hds))", OF z_Hfh], fact z_Hfg)
            thus "?z_hev" .
           qed
          next
           assume z_Hfq:"(?z_hds~=?z_hds)"
           show FALSE
           by (rule zenon_noteq [OF z_Hfq])
          qed
         qed
        qed
       next
        assume z_Hdi:"?z_hdi"
        show FALSE
        proof (rule zenon_or [OF z_Hdi])
         assume z_Hdl:"?z_hdl"
         show FALSE
         by (rule notE [OF z_Hda z_Hdl])
        next
         assume z_Hdm:"?z_hdm"
         show FALSE
         by (rule notE [OF z_Hdb z_Hdm])
        qed
       qed
      qed
     next
      assume z_Hdw:"?z_hdw"
      show FALSE
      by (rule notE [OF z_Hdr z_Hdw])
     qed
    qed
   next
    assume z_Hdw:"?z_hdw"
    show FALSE
    by (rule notE [OF z_Hdr z_Hdw])
   qed
  qed
 qed
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 59"; *} qed
lemma ob'73:
(* usable definition IsFiniteSet suppressed *)
(* usable definition Cardinality suppressed *)
fixes U
fixes UU
fixes NONE
fixes a_E0a
fixes a_E1a
fixes ALL
fixes Undef
fixes GPol
(* usable definition Range suppressed *)
(* usable definition ## suppressed *)
(* usable definition substMap3Equality suppressed *)
(* usable definition matchLocks suppressed *)
(* usable definition compareClause suppressed *)
(* usable definition comparePol suppressed *)
(* usable definition GLB suppressed *)
(* usable definition LUB suppressed *)
(* usable definition LUB2 suppressed *)
(* usable definition ClausesSet suppressed *)
(* usable definition PoliciesSet suppressed *)
(* usable definition Ref suppressed *)
(* usable definition Trans suppressed *)
(* usable definition AntiSym suppressed *)
fixes a_p1a
assumes a_p1a_in : "(a_p1a \<in> (PoliciesSet))"
fixes a_p2a
assumes a_p2a_in : "(a_p2a \<in> (PoliciesSet))"
fixes l
assumes l_in : "(l \<in> (PoliciesSet))"
fixes y
assumes y_in : "(y \<in> (PoliciesSet))"
fixes a_y1a
assumes a_y1a_in : "(a_y1a \<in> (y))"
fixes a_c1a
assumes a_c1a_in : "(a_c1a \<in> (a_p1a))"
fixes a_c2a
assumes a_c2a_in : "(a_c2a \<in> (a_p2a))"
fixes u
fixes e
assumes e_in : "(e \<in> (a_E1a))"
assumes v'103: "((((substMap3Equality ((a_c1a), (a_c2a)))) \<Longrightarrow> ((((fapply ((fapply ((fapply ((u), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | ((((matchLocks ((u), (a_y1a), (e)))) \<subseteq> (fapply ((fapply ((fapply ((a_y1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))"
assumes v'104: "((((((substMap3Equality ((a_c2a), (a_c1a)))) \<and> ((~ ((substMap3Equality ((a_c1a), (a_c2a)))))))) \<Longrightarrow> ((((fapply ((fapply ((fapply ((u), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | ((((matchLocks ((u), (a_y1a), (e)))) \<subseteq> (fapply ((fapply ((fapply ((a_y1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))"
assumes v'105: "(((fapply ((fapply ((fapply ((u), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<noteq> ({(NONE)})))"
assumes v'106: "(((((fapply ((fapply ((fapply ((u), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) = ({})))"
assumes v'107: "(((u) \<noteq> (<<>>)))"
assumes v'108: "(((u) = (cond(((substMap3Equality ((a_c1a), (a_c2a)))), (<<(fapply ((a_c2a), ((Succ[0])))), (<<([ a_e0a \<in> (a_E0a)  \<mapsto> (((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (a_e0a))) \<inter> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (a_e0a)))))]), ([ a_e1a \<in> (a_E1a)  \<mapsto> (cond((((((NONE) \<in> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))) \<and> (((NONE) \<in> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))))), ({(NONE)}), ((((((matchLocks ((a_c1a), (a_c2a), (a_e1a)))) \<union> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))) \\ ({(NONE)})))))])>>)>>), (cond(((substMap3Equality ((a_c2a), (a_c1a)))), (<<(fapply ((a_c1a), ((Succ[0])))), (<<([ a_e0a \<in> (a_E0a)  \<mapsto> (((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (a_e0a))) \<inter> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (a_e0a)))))]), ([ a_e1a \<in> (a_E1a)  \<mapsto> (cond((((((NONE) \<in> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))) \<and> (((NONE) \<in> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))))), ({(NONE)}), ((((((matchLocks ((a_c2a), (a_c1a), (a_e1a)))) \<union> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))) \\ ({(NONE)})))))])>>)>>), (<<>>)))))))"
shows "((((fapply ((fapply ((fapply ((u), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | ((((matchLocks ((u), (a_y1a), (e)))) \<subseteq> (fapply ((fapply ((fapply ((a_y1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))"(is "PROP ?ob'73")
proof -
ML_command {* writeln "*** TLAPS ENTER 73"; *}
show "PROP ?ob'73"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_1d9e9a.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_1d9e9a.znn.out
;; obligation #73
$hyp "a_p1a_in" (TLA.in a_p1a PoliciesSet)
$hyp "a_p2a_in" (TLA.in a_p2a PoliciesSet)
$hyp "l_in" (TLA.in l PoliciesSet)
$hyp "y_in" (TLA.in y PoliciesSet)
$hyp "a_y1a_in" (TLA.in a_y1a y)
$hyp "a_c1a_in" (TLA.in a_c1a a_p1a)
$hyp "a_c2a_in" (TLA.in a_c2a a_p2a)
$hyp "e_in" (TLA.in e a_E1a)
$hyp "v'103" (=> (substMap3Equality a_c1a
a_c2a) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply u (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE)) (TLA.subseteq (matchLocks u a_y1a e)
(TLA.fapply (TLA.fapply (TLA.fapply a_y1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))
$hyp "v'104" (=> (/\ (substMap3Equality a_c2a a_c1a)
(-. (substMap3Equality a_c1a
a_c2a))) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply u (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE)) (TLA.subseteq (matchLocks u a_y1a e)
(TLA.fapply (TLA.fapply (TLA.fapply a_y1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))
$hyp "v'105" (-. (= (TLA.fapply (TLA.fapply (TLA.fapply u (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE)))
$hyp "v'106" (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply u (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU) TLA.emptyset)
$hyp "v'107" (-. (= u (TLA.tuple )))
$hyp "v'108" (= u (TLA.cond (substMap3Equality a_c1a
a_c2a) (TLA.tuple (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))
(TLA.tuple (TLA.Fcn a_E0a ((a_e0a) (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) a_e0a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) a_e0a))))
(TLA.Fcn a_E1a ((a_e1a) (TLA.cond (/\ (TLA.in NONE
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
(TLA.in NONE
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))) (TLA.set NONE) (TLA.setminus (TLA.cup (matchLocks a_c1a
a_c2a a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
(TLA.set NONE))))))) (TLA.cond (substMap3Equality a_c2a
a_c1a) (TLA.tuple (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.tuple (TLA.Fcn a_E0a ((a_e0a) (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) a_e0a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) a_e0a))))
(TLA.Fcn a_E1a ((a_e1a) (TLA.cond (/\ (TLA.in NONE
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
(TLA.in NONE
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))) (TLA.set NONE) (TLA.setminus (TLA.cup (matchLocks a_c2a
a_c1a a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
(TLA.set NONE))))))) (TLA.tuple ))))
$goal (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply u (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE)) (TLA.subseteq (matchLocks u a_y1a e)
(TLA.fapply (TLA.fapply (TLA.fapply a_y1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Hn:"(u=cond(substMap3Equality(a_c1a, a_c2a), <<(a_c2a[1]), <<Fcn(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a]) \\cap (((a_c2a[2])[1])[a_e0a])))), Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), {NONE}, ((matchLocks(a_c1a, a_c2a, a_e1a) \\cup (((a_c2a[2])[2])[a_e1a])) \\ {NONE}))))>>>>, cond(substMap3Equality(a_c2a, a_c1a), <<(a_c1a[1]), <<Fcn(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a]) \\cap (((a_c2a[2])[1])[a_e0a])))), Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), {NONE}, ((matchLocks(a_c2a, a_c1a, a_e1a) \\cup (((a_c1a[2])[2])[a_e1a])) \\ {NONE}))))>>>>, <<>>)))" (is "_=?z_hq")
 using v'108 by blast
 have z_Hm:"(u~=<<>>)" (is "_~=?z_hcm")
 using v'107 by blast
 have z_Hj:"((substMap3Equality(a_c2a, a_c1a)&(~substMap3Equality(a_c1a, a_c2a)))=>(((((u[2])[2])[e])={NONE})|(matchLocks(u, a_y1a, e) \\subseteq (((a_y1a[2])[2])[e]))))" (is "?z_hcn=>?z_hcp")
 using v'104 by blast
 have z_Hk:"((((u[2])[2])[e])~={NONE})" (is "?z_hcr~=?z_hbx")
 using v'105 by blast
 have z_Hi:"(substMap3Equality(a_c1a, a_c2a)=>?z_hcp)" (is "?z_hr=>_")
 using v'103 by blast
 assume z_Ho:"(~?z_hcp)" (is "~(?z_hcq|?z_hcv)")
 have z_Hdb: "(?z_hq~=?z_hcm)"
 by (rule subst [where P="(\<lambda>zenon_Vg. (zenon_Vg~=?z_hcm))", OF z_Hn z_Hm])
 have z_Hk: "(?z_hcr~=?z_hbx)"
 by (rule zenon_notor_0 [OF z_Ho])
 have z_Hdf: "(~?z_hcv)"
 by (rule zenon_notor_1 [OF z_Ho])
 show FALSE
 proof (rule zenon_imply [OF z_Hi])
  assume z_Hco:"(~?z_hr)"
  show FALSE
  proof (rule zenon_imply [OF z_Hj])
   assume z_Hdg:"(~?z_hcn)" (is "~(?z_hcc&?z_hco)")
   show FALSE
   proof (rule zenon_notand [OF z_Hdg])
    assume z_Hdh:"(~?z_hcc)"
    show FALSE
    proof (rule zenon_ifthenelse [of "(\<lambda>zenon_Vg. (zenon_Vg~=?z_hcm))" "?z_hr" "<<(a_c2a[1]), <<Fcn(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a]) \\cap (((a_c2a[2])[1])[a_e0a])))), Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), ?z_hbx, ((matchLocks(a_c1a, a_c2a, a_e1a) \\cup (((a_c2a[2])[2])[a_e1a])) \\ ?z_hbx))))>>>>" "cond(?z_hcc, <<(a_c1a[1]), <<Fcn(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a]) \\cap (((a_c2a[2])[1])[a_e0a])))), Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), ?z_hbx, ((matchLocks(a_c2a, a_c1a, a_e1a) \\cup (((a_c1a[2])[2])[a_e1a])) \\ ?z_hbx))))>>>>, ?z_hcm)", OF z_Hdb])
     assume z_Hr:"?z_hr"
     assume z_Hdi:"(<<(a_c2a[1]), <<Fcn(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a]) \\cap (((a_c2a[2])[1])[a_e0a])))), Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), ?z_hbx, ((matchLocks(a_c1a, a_c2a, a_e1a) \\cup (((a_c2a[2])[2])[a_e1a])) \\ ?z_hbx))))>>>>~=?z_hcm)" (is "?z_hu~=_")
     show FALSE
     by (rule notE [OF z_Hco z_Hr])
    next
     assume z_Hco:"?z_hco"
     assume z_Hdj:"(cond(?z_hcc, <<(a_c1a[1]), <<Fcn(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a]) \\cap (((a_c2a[2])[1])[a_e0a])))), Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), ?z_hbx, ((matchLocks(a_c2a, a_c1a, a_e1a) \\cup (((a_c1a[2])[2])[a_e1a])) \\ ?z_hbx))))>>>>, ?z_hcm)~=?z_hcm)" (is "?z_hcb~=_")
     show FALSE
     proof (rule zenon_ifthenelse [of "(\<lambda>zenon_Vg. (zenon_Vg~=?z_hcm))" "?z_hcc" "<<(a_c1a[1]), <<Fcn(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a]) \\cap (((a_c2a[2])[1])[a_e0a])))), Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), ?z_hbx, ((matchLocks(a_c2a, a_c1a, a_e1a) \\cup (((a_c1a[2])[2])[a_e1a])) \\ ?z_hbx))))>>>>" "?z_hcm", OF z_Hdj])
      assume z_Hcc:"?z_hcc"
      assume z_Hdk:"(<<(a_c1a[1]), <<Fcn(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a]) \\cap (((a_c2a[2])[1])[a_e0a])))), Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), ?z_hbx, ((matchLocks(a_c2a, a_c1a, a_e1a) \\cup (((a_c1a[2])[2])[a_e1a])) \\ ?z_hbx))))>>>>~=?z_hcm)" (is "?z_hcd~=_")
      show FALSE
      by (rule notE [OF z_Hdh z_Hcc])
     next
      assume z_Hdh:"(~?z_hcc)"
      assume z_Hdl:"(?z_hcm~=?z_hcm)"
      show FALSE
      by (rule zenon_noteq [OF z_Hdl])
     qed
    qed
   next
    assume z_Hdm:"(~?z_hco)"
    show FALSE
    by (rule notE [OF z_Hdm z_Hco])
   qed
  next
   assume z_Hcp:"?z_hcp"
   show FALSE
   proof (rule zenon_or [OF z_Hcp])
    assume z_Hcq:"?z_hcq"
    show FALSE
    by (rule notE [OF z_Hk z_Hcq])
   next
    assume z_Hcv:"?z_hcv"
    show FALSE
    by (rule notE [OF z_Hdf z_Hcv])
   qed
  qed
 next
  assume z_Hcp:"?z_hcp"
  show FALSE
  proof (rule zenon_or [OF z_Hcp])
   assume z_Hcq:"?z_hcq"
   show FALSE
   by (rule notE [OF z_Hk z_Hcq])
  next
   assume z_Hcv:"?z_hcv"
   show FALSE
   by (rule notE [OF z_Hdf z_Hcv])
  qed
 qed
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 73"; *} qed
lemma ob'85:
(* usable definition IsFiniteSet suppressed *)
(* usable definition Cardinality suppressed *)
fixes U
fixes UU
fixes NONE
fixes a_E0a
fixes a_E1a
fixes ALL
fixes Undef
fixes GPol
(* usable definition Range suppressed *)
(* usable definition ## suppressed *)
(* usable definition substMap3Equality suppressed *)
(* usable definition matchLocks suppressed *)
(* usable definition compareClause suppressed *)
(* usable definition comparePol suppressed *)
(* usable definition GLB suppressed *)
(* usable definition LUB suppressed *)
(* usable definition LUB2 suppressed *)
(* usable definition ClausesSet suppressed *)
(* usable definition PoliciesSet suppressed *)
(* usable definition Ref suppressed *)
(* usable definition Trans suppressed *)
(* usable definition AntiSym suppressed *)
fixes a_p1a
assumes a_p1a_in : "(a_p1a \<in> (PoliciesSet))"
fixes a_p2a
assumes a_p2a_in : "(a_p2a \<in> (PoliciesSet))"
fixes l
assumes l_in : "(l \<in> (PoliciesSet))"
fixes y
assumes y_in : "(y \<in> (PoliciesSet))"
fixes a_y1a
assumes a_y1a_in : "(a_y1a \<in> (y))"
fixes a_c1a
assumes a_c1a_in : "(a_c1a \<in> (a_p1a))"
fixes a_c2a
assumes a_c2a_in : "(a_c2a \<in> (a_p2a))"
fixes u
fixes e
assumes e_in : "(e \<in> (a_E1a))"
assumes v'106: "((substMap3Equality ((a_c1a), (a_c2a))))"
assumes v'107: "(((u) = (cond(((substMap3Equality ((a_c1a), (a_c2a)))), (<<(fapply ((a_c2a), ((Succ[0])))), (<<([ a_e0a \<in> (a_E0a)  \<mapsto> (((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (a_e0a))) \<inter> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (a_e0a)))))]), ([ a_e1a \<in> (a_E1a)  \<mapsto> (cond((((((NONE) \<in> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))) \<and> (((NONE) \<in> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))))), ({(NONE)}), ((((((matchLocks ((a_c1a), (a_c2a), (a_e1a)))) \<union> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))) \\ ({(NONE)})))))])>>)>>), (cond(((substMap3Equality ((a_c2a), (a_c1a)))), (<<(fapply ((a_c1a), ((Succ[0])))), (<<([ a_e0a \<in> (a_E0a)  \<mapsto> (((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (a_e0a))) \<inter> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (a_e0a)))))]), ([ a_e1a \<in> (a_E1a)  \<mapsto> (cond((((((NONE) \<in> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))) \<and> (((NONE) \<in> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))))), ({(NONE)}), ((((((matchLocks ((a_c2a), (a_c1a), (a_e1a)))) \<union> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))) \\ ({(NONE)})))))])>>)>>), (<<>>)))))))"
assumes v'108: "(((fapply ((fapply ((fapply ((u), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<noteq> ({(NONE)})))"
assumes v'109: "(((((fapply ((fapply ((fapply ((u), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) = ({})))"
shows "(((fapply ((fapply ((fapply ((u), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = (cond(((((((((((matchLocks ((a_c1a), (a_c2a), (e)))) \<union> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \\ ({(NONE)}))) \\ (UU))) = ({}))), ((((((matchLocks ((a_c1a), (a_c2a), (e)))) \<union> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \\ ({(NONE)}))), ((((((((matchLocks ((a_c1a), (a_c2a), (e)))) \<union> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \\ ({(NONE)}))) \\ (UU)))))))"(is "PROP ?ob'85")
proof -
ML_command {* writeln "*** TLAPS ENTER 85"; *}
show "PROP ?ob'85"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_bd372c.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_bd372c.znn.out
;; obligation #85
$hyp "a_p1a_in" (TLA.in a_p1a PoliciesSet)
$hyp "a_p2a_in" (TLA.in a_p2a PoliciesSet)
$hyp "l_in" (TLA.in l PoliciesSet)
$hyp "y_in" (TLA.in y PoliciesSet)
$hyp "a_y1a_in" (TLA.in a_y1a y)
$hyp "a_c1a_in" (TLA.in a_c1a a_p1a)
$hyp "a_c2a_in" (TLA.in a_c2a a_p2a)
$hyp "e_in" (TLA.in e a_E1a)
$hyp "v'106" (substMap3Equality a_c1a a_c2a)
$hyp "v'107" (= u (TLA.cond (substMap3Equality a_c1a
a_c2a) (TLA.tuple (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))
(TLA.tuple (TLA.Fcn a_E0a ((a_e0a) (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) a_e0a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) a_e0a))))
(TLA.Fcn a_E1a ((a_e1a) (TLA.cond (/\ (TLA.in NONE
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
(TLA.in NONE
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))) (TLA.set NONE) (TLA.setminus (TLA.cup (matchLocks a_c1a
a_c2a a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
(TLA.set NONE))))))) (TLA.cond (substMap3Equality a_c2a
a_c1a) (TLA.tuple (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.tuple (TLA.Fcn a_E0a ((a_e0a) (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) a_e0a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) a_e0a))))
(TLA.Fcn a_E1a ((a_e1a) (TLA.cond (/\ (TLA.in NONE
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
(TLA.in NONE
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))) (TLA.set NONE) (TLA.setminus (TLA.cup (matchLocks a_c2a
a_c1a a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
(TLA.set NONE))))))) (TLA.tuple ))))
$hyp "v'108" (-. (= (TLA.fapply (TLA.fapply (TLA.fapply u (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE)))
$hyp "v'109" (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply u (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)
$goal (= (TLA.fapply (TLA.fapply (TLA.fapply u (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.cond (= (TLA.setminus (TLA.setminus (TLA.cup (matchLocks a_c1a a_c2a e)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.set NONE)) UU) TLA.emptyset) (TLA.setminus (TLA.cup (matchLocks a_c1a
a_c2a e)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.set NONE)) (TLA.setminus (TLA.setminus (TLA.cup (matchLocks a_c1a a_c2a
e)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.set NONE))
UU)))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Hj:"(u=cond(substMap3Equality(a_c1a, a_c2a), <<(a_c2a[1]), <<Fcn(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a]) \\cap (((a_c2a[2])[1])[a_e0a])))), Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), {NONE}, ((matchLocks(a_c1a, a_c2a, a_e1a) \\cup (((a_c2a[2])[2])[a_e1a])) \\ {NONE}))))>>>>, cond(substMap3Equality(a_c2a, a_c1a), <<(a_c1a[1]), <<Fcn(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a]) \\cap (((a_c2a[2])[1])[a_e0a])))), Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), {NONE}, ((matchLocks(a_c2a, a_c1a, a_e1a) \\cup (((a_c1a[2])[2])[a_e1a])) \\ {NONE}))))>>>>, <<>>)))" (is "_=?z_ho")
 using v'107 by blast
 have z_Hk:"((((u[2])[2])[e])~={NONE})" (is "?z_hck~=?z_hbu")
 using v'108 by blast
 have z_Hl:"((?z_hck \\cap UU)={})" (is "?z_hco=_")
 using v'109 by blast
 have z_Hi:"substMap3Equality(a_c1a, a_c2a)" (is "?z_hi")
 using v'106 by blast
 have z_Hh:"(e \\in a_E1a)" (is "?z_hh")
 using e_in by blast
 assume z_Hm:"(?z_hck~=cond(((((matchLocks(a_c1a, a_c2a, e) \\cup (((a_c2a[2])[2])[e])) \\ ?z_hbu) \\ UU)={}), ((matchLocks(a_c1a, a_c2a, e) \\cup (((a_c2a[2])[2])[e])) \\ ?z_hbu), (((matchLocks(a_c1a, a_c2a, e) \\cup (((a_c2a[2])[2])[e])) \\ ?z_hbu) \\ UU)))" (is "_~=?z_hcr")
 have z_Hcy: "((((?z_ho[2])[2])[e])~=?z_hbu)" (is "?z_hcz~=_")
 by (rule subst [where P="(\<lambda>zenon_Vi. ((((zenon_Vi[2])[2])[e])~=?z_hbu))", OF z_Hj z_Hk])
 have z_Hdi: "((?z_hcz \\cap UU)={})" (is "?z_hdj=_")
 by (rule subst [where P="(\<lambda>zenon_Vg. (((((zenon_Vg[2])[2])[e]) \\cap UU)={}))", OF z_Hj z_Hl])
 have z_Hdr: "(\\A zenon_Vea:(~(zenon_Vea \\in ?z_hdj)))" (is "\\A x : ?z_hdv(x)")
 by (rule zenon_setequalempty_0 [of "?z_hdj", OF z_Hdi])
 have z_Hdw: "(?z_hcz~=?z_hcr)"
 by (rule subst [where P="(\<lambda>zenon_Vf. ((((zenon_Vf[2])[2])[e])~=?z_hcr))", OF z_Hj z_Hm])
 show FALSE
 proof (rule zenon_ifthenelse [of "(\<lambda>zenon_Vf. ((((zenon_Vf[2])[2])[e])~=?z_hcr))" "?z_hi" "<<(a_c2a[1]), <<Fcn(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a]) \\cap (((a_c2a[2])[1])[a_e0a])))), Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), ?z_hbu, ((matchLocks(a_c1a, a_c2a, a_e1a) \\cup (((a_c2a[2])[2])[a_e1a])) \\ ?z_hbu))))>>>>" "cond(substMap3Equality(a_c2a, a_c1a), <<(a_c1a[1]), <<Fcn(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a]) \\cap (((a_c2a[2])[1])[a_e0a])))), Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), ?z_hbu, ((matchLocks(a_c2a, a_c1a, a_e1a) \\cup (((a_c1a[2])[2])[a_e1a])) \\ ?z_hbu))))>>>>, <<>>)", OF z_Hdw])
  assume z_Hi:"?z_hi"
  assume z_Hed:"((((<<(a_c2a[1]), <<Fcn(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a]) \\cap (((a_c2a[2])[1])[a_e0a])))), Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), ?z_hbu, ((matchLocks(a_c1a, a_c2a, a_e1a) \\cup (((a_c2a[2])[2])[a_e1a])) \\ ?z_hbu))))>>>>[2])[2])[e])~=?z_hcr)" (is "?z_hee~=_")
  have z_Heh: "((<<(a_c2a[1]), <<Fcn(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a]) \\cap (((a_c2a[2])[1])[a_e0a])))), Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), ?z_hbu, ((matchLocks(a_c1a, a_c2a, a_e1a) \\cup (((a_c2a[2])[2])[a_e1a])) \\ ?z_hbu))))>>>>[2])=<<Fcn(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a]) \\cap (((a_c2a[2])[1])[a_e0a])))), Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), ?z_hbu, ((matchLocks(a_c1a, a_c2a, a_e1a) \\cup (((a_c2a[2])[2])[a_e1a])) \\ ?z_hbu))))>>)" (is "?z_heg=?z_hu")
  by auto
  have z_Hei: "(((?z_hu[2])[e])~=?z_hcr)" (is "?z_hej~=_")
  by (rule subst [where P="(\<lambda>zenon_Vf. (((zenon_Vf[2])[e])~=?z_hcr))", OF z_Heh z_Hed])
  have z_Heo: "((?z_hu[2])=Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), ?z_hbu, ((matchLocks(a_c1a, a_c2a, a_e1a) \\cup (((a_c2a[2])[2])[a_e1a])) \\ ?z_hbu)))))" (is "?z_hek=?z_hbh")
  by auto
  have z_Hep: "((?z_hbh[e])~=?z_hcr)" (is "?z_heq~=_")
  by (rule subst [where P="(\<lambda>zenon_Vf. ((zenon_Vf[e])~=?z_hcr))", OF z_Heo z_Hei])
  show FALSE
  proof (rule zenon_fapplyfcn [of "(\<lambda>zenon_Vf. (zenon_Vf~=?z_hcr))" "a_E1a" "(\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), ?z_hbu, ((matchLocks(a_c1a, a_c2a, a_e1a) \\cup (((a_c2a[2])[2])[a_e1a])) \\ ?z_hbu)))" "e", OF z_Hep])
   assume z_Hew:"(~?z_hh)"
   show FALSE
   by (rule notE [OF z_Hew z_Hh])
  next
   assume z_Hex:"(cond(((NONE \\in (((a_c1a[2])[2])[e]))&(NONE \\in (((a_c2a[2])[2])[e]))), ?z_hbu, ((matchLocks(a_c1a, a_c2a, e) \\cup (((a_c2a[2])[2])[e])) \\ ?z_hbu))~=?z_hcr)" (is "?z_hey~=_")
   show FALSE
   proof (rule zenon_ifthenelse [of "(\<lambda>zenon_Vf. (zenon_Vf~=?z_hcr))" "((NONE \\in (((a_c1a[2])[2])[e]))&(NONE \\in (((a_c2a[2])[2])[e])))" "?z_hbu" "((matchLocks(a_c1a, a_c2a, e) \\cup (((a_c2a[2])[2])[e])) \\ ?z_hbu)", OF z_Hex])
    assume z_Hez:"((NONE \\in (((a_c1a[2])[2])[e]))&(NONE \\in (((a_c2a[2])[2])[e])))" (is "?z_hfa&?z_hfc")
    assume z_Hfd:"(?z_hbu~=?z_hcr)"
    show FALSE
    proof (rule zenon_ifthenelse [of "(\<lambda>zenon_Vi. ((((zenon_Vi[2])[2])[e])~=?z_hbu))" "?z_hi" "<<(a_c2a[1]), ?z_hu>>" "cond(substMap3Equality(a_c2a, a_c1a), <<(a_c1a[1]), <<Fcn(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a]) \\cap (((a_c2a[2])[1])[a_e0a])))), Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), ?z_hbu, ((matchLocks(a_c2a, a_c1a, a_e1a) \\cup (((a_c1a[2])[2])[a_e1a])) \\ ?z_hbu))))>>>>, <<>>)", OF z_Hcy])
     assume z_Hi:"?z_hi"
     assume z_Hfe:"(?z_hee~=?z_hbu)"
     have z_Heh: "(?z_heg=?z_hu)"
     by auto
     have z_Hff: "(?z_hej~=?z_hbu)"
     by (rule subst [where P="(\<lambda>zenon_Vi. (((zenon_Vi[2])[e])~=?z_hbu))", OF z_Heh z_Hfe])
     have z_Heo: "(?z_hek=?z_hbh)"
     by auto
     have z_Hfj: "(?z_heq~=?z_hbu)"
     by (rule subst [where P="(\<lambda>zenon_Vi. ((zenon_Vi[e])~=?z_hbu))", OF z_Heo z_Hff])
     show FALSE
     proof (rule zenon_fapplyfcn [of "(\<lambda>zenon_Vi. (zenon_Vi~=?z_hbu))" "a_E1a" "(\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), ?z_hbu, ((matchLocks(a_c1a, a_c2a, a_e1a) \\cup (((a_c2a[2])[2])[a_e1a])) \\ ?z_hbu)))" "e", OF z_Hfj])
      assume z_Hew:"(~?z_hh)"
      show FALSE
      by (rule notE [OF z_Hew z_Hh])
     next
      assume z_Hfp:"(?z_hey~=?z_hbu)"
      show FALSE
      proof (rule zenon_ifthenelse [of "(\<lambda>zenon_Vi. (zenon_Vi~=?z_hbu))" "(?z_hfa&?z_hfc)" "?z_hbu" "((matchLocks(a_c1a, a_c2a, e) \\cup (((a_c2a[2])[2])[e])) \\ ?z_hbu)", OF z_Hfp])
       assume z_Hez:"(?z_hfa&?z_hfc)"
       assume z_Hfq:"(?z_hbu~=?z_hbu)"
       show FALSE
       by (rule zenon_noteq [OF z_Hfq])
      next
       assume z_Hfr:"(~(?z_hfa&?z_hfc))"
       assume z_Hfs:"(((matchLocks(a_c1a, a_c2a, e) \\cup (((a_c2a[2])[2])[e])) \\ ?z_hbu)~=?z_hbu)" (is "?z_hcu~=_")
       show FALSE
       by (rule notE [OF z_Hfr z_Hez])
      qed
     qed
    next
     assume z_Hft:"(~?z_hi)"
     assume z_Hfu:"((((cond(substMap3Equality(a_c2a, a_c1a), <<(a_c1a[1]), <<Fcn(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a]) \\cap (((a_c2a[2])[1])[a_e0a])))), Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), ?z_hbu, ((matchLocks(a_c2a, a_c1a, a_e1a) \\cup (((a_c1a[2])[2])[a_e1a])) \\ ?z_hbu))))>>>>, <<>>)[2])[2])[e])~=?z_hbu)" (is "?z_hfv~=_")
     show FALSE
     by (rule notE [OF z_Hft z_Hi])
    qed
   next
    assume z_Hfr:"(~((NONE \\in (((a_c1a[2])[2])[e]))&(NONE \\in (((a_c2a[2])[2])[e]))))" (is "~(?z_hfa&?z_hfc)")
    assume z_Hfy:"(((matchLocks(a_c1a, a_c2a, e) \\cup (((a_c2a[2])[2])[e])) \\ ?z_hbu)~=?z_hcr)" (is "?z_hcu~=_")
    show FALSE
    proof (rule zenon_ifthenelse [of "(\<lambda>zenon_Vxa. (?z_hcu~=zenon_Vxa))" "((?z_hcu \\ UU)={})" "?z_hcu" "(?z_hcu \\ UU)", OF z_Hfy])
     assume z_Hcs:"((?z_hcu \\ UU)={})" (is "?z_hct=_")
     assume z_Hgc:"(?z_hcu~=?z_hcu)"
     show FALSE
     by (rule zenon_noteq [OF z_Hgc])
    next
     assume z_Hgd:"((?z_hcu \\ UU)~={})" (is "?z_hct~=_")
     assume z_Hge:"(?z_hcu~=?z_hct)"
     have z_Hgf: "(~(\\A zenon_Vya:((zenon_Vya \\in ?z_hcu)<=>(zenon_Vya \\in ?z_hcr))))" (is "~(\\A x : ?z_hgl(x))")
     by (rule zenon_notsetequal_0 [of "?z_hcu" "?z_hcr", OF z_Hfy])
     have z_Hgm: "(\\E zenon_Vya:(~((zenon_Vya \\in ?z_hcu)<=>(zenon_Vya \\in ?z_hcr))))" (is "\\E x : ?z_hgo(x)")
     by (rule zenon_notallex_0 [of "?z_hgl", OF z_Hgf])
     have z_Hgp: "?z_hgo((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hcu)<=>(zenon_Vya \\in ?z_hcr)))))" (is "~(?z_hgr<=>?z_hgs)")
     by (rule zenon_ex_choose_0 [of "?z_hgo", OF z_Hgm])
     show FALSE
     proof (rule zenon_notequiv [OF z_Hgp])
      assume z_Hgt:"(~?z_hgr)"
      assume z_Hgs:"?z_hgs"
      show FALSE
      proof (rule zenon_ifthenelse [of "(\<lambda>zenon_Vvj. ((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hcu)<=>(zenon_Vya \\in ?z_hcr)))) \\in zenon_Vvj))" "(?z_hct={})" "?z_hcu" "?z_hct", OF z_Hgs])
       assume z_Hcs:"(?z_hct={})"
       assume z_Hgr:"?z_hgr"
       show FALSE
       by (rule notE [OF z_Hgd z_Hcs])
      next
       assume z_Hgd:"(?z_hct~={})"
       assume z_Hgx:"((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hcu)<=>(zenon_Vya \\in ?z_hcr)))) \\in ?z_hct)" (is "?z_hgx")
       have z_Hgr: "?z_hgr"
       by (rule zenon_in_setminus_0 [of "(CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hcu)<=>(zenon_Vya \\in ?z_hcr))))" "?z_hcu" "UU", OF z_Hgx])
       show FALSE
       by (rule notE [OF z_Hgt z_Hgr])
      qed
     next
      assume z_Hgr:"?z_hgr"
      assume z_Hgy:"(~?z_hgs)"
      show FALSE
      proof (rule zenon_ifthenelse [of "(\<lambda>zenon_Vtj. (~((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hcu)<=>(zenon_Vya \\in ?z_hcr)))) \\in zenon_Vtj)))" "(?z_hct={})" "?z_hcu" "?z_hct", OF z_Hgy])
       assume z_Hcs:"(?z_hct={})"
       assume z_Hgt:"(~?z_hgr)"
       show FALSE
       by (rule notE [OF z_Hgd z_Hcs])
      next
       assume z_Hgd:"(?z_hct~={})"
       assume z_Hhd:"(~((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hcu)<=>(zenon_Vya \\in ?z_hcr)))) \\in ?z_hct))" (is "~?z_hgx")
       show FALSE
       proof (rule zenon_notin_setminus [of "(CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hcu)<=>(zenon_Vya \\in ?z_hcr))))" "?z_hcu" "UU", OF z_Hhd])
        assume z_Hgt:"(~?z_hgr)"
        show FALSE
        by (rule notE [OF z_Hgt z_Hgr])
       next
        assume z_Hhe:"((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hcu)<=>(zenon_Vya \\in ?z_hcr)))) \\in UU)" (is "?z_hhe")
        have z_Hhf: "?z_hdv((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hcu)<=>(zenon_Vya \\in ?z_hcr)))))" (is "~?z_hhg")
        by (rule zenon_all_0 [of "?z_hdv" "(CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hcu)<=>(zenon_Vya \\in ?z_hcr))))", OF z_Hdr])
        show FALSE
        proof (rule zenon_notin_cap [of "(CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hcu)<=>(zenon_Vya \\in ?z_hcr))))" "?z_hcz" "UU", OF z_Hhf])
         assume z_Hhh:"(~((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hcu)<=>(zenon_Vya \\in ?z_hcr)))) \\in ?z_hcz))" (is "~?z_hhi")
         show FALSE
         proof (rule zenon_ifthenelse [of "(\<lambda>zenon_Vnl. (~((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hcu)<=>(zenon_Vya \\in ?z_hcr)))) \\in (((zenon_Vnl[2])[2])[e]))))" "?z_hi" "<<(a_c2a[1]), ?z_hu>>" "cond(substMap3Equality(a_c2a, a_c1a), <<(a_c1a[1]), <<Fcn(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a]) \\cap (((a_c2a[2])[1])[a_e0a])))), Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), ?z_hbu, ((matchLocks(a_c2a, a_c1a, a_e1a) \\cup (((a_c1a[2])[2])[a_e1a])) \\ ?z_hbu))))>>>>, <<>>)", OF z_Hhh])
          assume z_Hi:"?z_hi"
          assume z_Hhq:"(~((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hcu)<=>(zenon_Vya \\in ?z_hcr)))) \\in ?z_hee))" (is "~?z_hhr")
          have z_Heh: "(?z_heg=?z_hu)"
          by auto
          have z_Hhs: "(~((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hcu)<=>(zenon_Vya \\in ?z_hcr)))) \\in ?z_hej))" (is "~?z_hht")
          by (rule subst [where P="(\<lambda>zenon_Vnl. (~((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hcu)<=>(zenon_Vya \\in ?z_hcr)))) \\in ((zenon_Vnl[2])[e]))))", OF z_Heh z_Hhq])
          have z_Heo: "(?z_hek=?z_hbh)"
          by auto
          have z_Hhy: "(~((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hcu)<=>(zenon_Vya \\in ?z_hcr)))) \\in ?z_heq))" (is "~?z_hhz")
          by (rule subst [where P="(\<lambda>zenon_Vnl. (~((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hcu)<=>(zenon_Vya \\in ?z_hcr)))) \\in (zenon_Vnl[e]))))", OF z_Heo z_Hhs])
          show FALSE
          proof (rule zenon_fapplyfcn [of "(\<lambda>zenon_Vtj. (~((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hcu)<=>(zenon_Vya \\in ?z_hcr)))) \\in zenon_Vtj)))" "a_E1a" "(\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), ?z_hbu, ((matchLocks(a_c1a, a_c2a, a_e1a) \\cup (((a_c2a[2])[2])[a_e1a])) \\ ?z_hbu)))" "e", OF z_Hhy])
           assume z_Hew:"(~?z_hh)"
           show FALSE
           by (rule notE [OF z_Hew z_Hh])
          next
           assume z_Hie:"(~((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hcu)<=>(zenon_Vya \\in ?z_hcr)))) \\in ?z_hey))" (is "~?z_hif")
           show FALSE
           proof (rule zenon_ifthenelse [of "(\<lambda>zenon_Vtj. (~((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hcu)<=>(zenon_Vya \\in ?z_hcr)))) \\in zenon_Vtj)))" "(?z_hfa&?z_hfc)" "?z_hbu" "?z_hcu", OF z_Hie])
            assume z_Hez:"(?z_hfa&?z_hfc)"
            assume z_Hig:"(~((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hcu)<=>(zenon_Vya \\in ?z_hcr)))) \\in ?z_hbu))" (is "~?z_hih")
            show FALSE
            by (rule notE [OF z_Hfr z_Hez])
           next
            assume z_Hfr:"(~(?z_hfa&?z_hfc))"
            assume z_Hgt:"(~?z_hgr)"
            show FALSE
            by (rule notE [OF z_Hgt z_Hgr])
           qed
          qed
         next
          assume z_Hft:"(~?z_hi)"
          assume z_Hii:"(~((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hcu)<=>(zenon_Vya \\in ?z_hcr)))) \\in (((cond(substMap3Equality(a_c2a, a_c1a), <<(a_c1a[1]), <<Fcn(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a]) \\cap (((a_c2a[2])[1])[a_e0a])))), Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), ?z_hbu, ((matchLocks(a_c2a, a_c1a, a_e1a) \\cup (((a_c1a[2])[2])[a_e1a])) \\ ?z_hbu))))>>>>, <<>>)[2])[2])[e])))" (is "~?z_hij")
          show FALSE
          by (rule notE [OF z_Hft z_Hi])
         qed
        next
         assume z_Hik:"(~?z_hhe)"
         show FALSE
         by (rule notE [OF z_Hik z_Hhe])
        qed
       qed
      qed
     qed
    qed
   qed
  qed
 next
  assume z_Hft:"(~?z_hi)"
  assume z_Hil:"((((cond(substMap3Equality(a_c2a, a_c1a), <<(a_c1a[1]), <<Fcn(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a]) \\cap (((a_c2a[2])[1])[a_e0a])))), Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), ?z_hbu, ((matchLocks(a_c2a, a_c1a, a_e1a) \\cup (((a_c1a[2])[2])[a_e1a])) \\ ?z_hbu))))>>>>, <<>>)[2])[2])[e])~=?z_hcr)" (is "?z_hfv~=_")
  show FALSE
  by (rule notE [OF z_Hft z_Hi])
 qed
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 85"; *} qed
end
