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

lemma ob'84:
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
(* usable definition GLB suppressed *)
(* usable definition unionCl suppressed *)
(* usable definition LUB suppressed *)
(* usable definition LUB2 suppressed *)
(* usable definition ClausesSet suppressed *)
(* usable definition PoliciesSet suppressed *)
(* usable definition Ref suppressed *)
fixes pol
assumes pol_in : "(pol \<in> (PoliciesSet))"
assumes v'33: "(((((pol) = ({}))) \<Longrightarrow> (\<forall> a_c2a \<in> (pol) : (\<exists> a_c1a \<in> (pol) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))))))"
assumes v'34: "(((((pol) \<noteq> ({}))) \<Longrightarrow> (\<forall> a_c2a \<in> (pol) : (\<exists> a_c1a \<in> (pol) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))))))"
shows "(\<forall> a_c2a \<in> (pol) : (\<exists> a_c1a \<in> (pol) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))))"(is "PROP ?ob'84")
proof -
ML_command {* writeln "*** TLAPS ENTER 84"; *}
show "PROP ?ob'84"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_397425.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_397425.znn.out
;; obligation #84
$hyp "pol_in" (TLA.in pol PoliciesSet)
$hyp "v'33" (=> (= pol
TLA.emptyset) (TLA.bAll pol ((a_c2a) (TLA.bEx pol ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)))))))))))
$hyp "v'34" (=> (-. (= pol
TLA.emptyset)) (TLA.bAll pol ((a_c2a) (TLA.bEx pol ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)))))))))))
$goal (TLA.bAll pol ((a_c2a) (TLA.bEx pol ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))))))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Hb:"((pol={})=>bAll(pol, (\<lambda>a_c2a. bEx(pol, (\<lambda>a_c1a. ((((a_c1a[1]) \\in UU)|((a_c1a[1])=(a_c2a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((a_c2a[2])[1])[k]))|((((a_c2a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a[2])[2])[e])={NONE})|(cond((((((a_c1a[2])[2])[e]) \\cap UU)~={}), (((((a_c1a[2])[2])[e]) \\ UU) \\cup {(a_c2a[1])}), (((a_c1a[2])[2])[e])) \\subseteq (((a_c2a[2])[2])[e]))))))))))))" (is "?z_he=>?z_hh")
 using v'33 by blast
 have z_Hc:"((pol~={})=>?z_hh)" (is "?z_hcd=>_")
 using v'34 by blast
 assume z_Hd:"(~?z_hh)"
 show FALSE
 proof (rule zenon_imply [OF z_Hb])
  assume z_Hcd:"?z_hcd"
  show FALSE
  proof (rule zenon_imply [OF z_Hc])
   assume z_Hce:"(~?z_hcd)"
   show FALSE
   by (rule notE [OF z_Hce z_Hcd])
  next
   assume z_Hh:"?z_hh"
   show FALSE
   by (rule notE [OF z_Hd z_Hh])
  qed
 next
  assume z_Hh:"?z_hh"
  show FALSE
  by (rule notE [OF z_Hd z_Hh])
 qed
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 84"; *} qed
lemma ob'87:
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
(* usable definition GLB suppressed *)
(* usable definition unionCl suppressed *)
(* usable definition LUB suppressed *)
(* usable definition LUB2 suppressed *)
(* usable definition ClausesSet suppressed *)
(* usable definition PoliciesSet suppressed *)
(* usable definition Ref suppressed *)
assumes v'29: "((\<And> pol :: c. pol \<in> (PoliciesSet) \<Longrightarrow> (\<forall> a_c2a \<in> (pol) : (\<exists> a_c1a \<in> (pol) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))))))"
shows "(\<forall> p \<in> (PoliciesSet) : (\<forall> a_c2a \<in> (p) : (\<exists> a_c1a \<in> (p) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))))))"(is "PROP ?ob'87")
proof -
ML_command {* writeln "*** TLAPS ENTER 87"; *}
show "PROP ?ob'87"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_e529ed.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_e529ed.znn.out
;; obligation #87
$hyp "v'29" (TLA.bAll PoliciesSet ((pol) (TLA.bAll pol ((a_c2a) (TLA.bEx pol ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))))))))
$goal (TLA.bAll PoliciesSet ((p) (TLA.bAll p ((a_c2a) (TLA.bEx p ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))))))))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Ha:"bAll(PoliciesSet, (\<lambda>pol. bAll(pol, (\<lambda>a_c2a. bEx(pol, (\<lambda>a_c1a. ((((a_c1a[1]) \\in UU)|((a_c1a[1])=(a_c2a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((a_c2a[2])[1])[k]))|((((a_c2a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a[2])[2])[e])={NONE})|(cond((((((a_c1a[2])[2])[e]) \\cap UU)~={}), (((((a_c1a[2])[2])[e]) \\ UU) \\cup {(a_c2a[1])}), (((a_c1a[2])[2])[e])) \\subseteq (((a_c2a[2])[2])[e])))))))))))))" (is "?z_ha")
 using v'29 by blast
 assume z_Hb:"(~?z_ha)"
 show FALSE
 by (rule notE [OF z_Hb z_Ha])
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 87"; *} qed
lemma ob'99:
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
(* usable definition GLB suppressed *)
(* usable definition unionCl suppressed *)
(* usable definition LUB suppressed *)
(* usable definition LUB2 suppressed *)
(* usable definition ClausesSet suppressed *)
(* usable definition PoliciesSet suppressed *)
(* usable definition Ref suppressed *)
fixes pol
assumes pol_in : "(pol \<in> (PoliciesSet))"
assumes v'36: "((\<And> a_c1a :: c. a_c1a \<in> (pol) \<Longrightarrow> (\<exists> a_c1a_1 \<in> (pol) : ((((((fapply ((a_c1a_1), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a_1), ((Succ[0])))) = (fapply ((a_c1a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c1a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))))))"
shows "(\<forall> a_c2a \<in> (pol) : (\<exists> a_c1a \<in> (pol) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))))"(is "PROP ?ob'99")
proof -
ML_command {* writeln "*** TLAPS ENTER 99"; *}
show "PROP ?ob'99"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_2d62d2.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_2d62d2.znn.out
;; obligation #99
$hyp "pol_in" (TLA.in pol PoliciesSet)
$hyp "v'36" (TLA.bAll pol ((a_c1a) (TLA.bEx pol ((a_c1a_1) (/\ (\/ (TLA.in (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))))))
$goal (TLA.bAll pol ((a_c2a) (TLA.bEx pol ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))))))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Hb:"bAll(pol, (\<lambda>a_c1a. bEx(pol, (\<lambda>a_c1a_1. ((((a_c1a_1[1]) \\in UU)|((a_c1a_1[1])=(a_c1a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a_1[2])[1])[k])=(((a_c1a[2])[1])[k]))|((((a_c1a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a_1[2])[2])[e])={NONE})|(cond((((((a_c1a_1[2])[2])[e]) \\cap UU)~={}), (((((a_c1a_1[2])[2])[e]) \\ UU) \\cup {(a_c1a[1])}), (((a_c1a_1[2])[2])[e])) \\subseteq (((a_c1a[2])[2])[e])))))))))))" (is "?z_hb")
 using v'36 by blast
 assume z_Hc:"(~?z_hb)"
 show FALSE
 by (rule notE [OF z_Hc z_Hb])
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 99"; *} qed
lemma ob'190:
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
(* usable definition GLB suppressed *)
(* usable definition unionCl suppressed *)
(* usable definition LUB suppressed *)
(* usable definition LUB2 suppressed *)
(* usable definition ClausesSet suppressed *)
(* usable definition Ref suppressed *)
(* usable definition Trans suppressed *)
fixes a_p1a
assumes a_p1a_in : "(a_p1a \<in> (((subsetOf(((SUBSET (ClausesSet))), %p. (\<forall> a_c1a \<in> (p) : ((~ (\<exists> a_c2a \<in> (p) : ((((a_c1a) \<noteq> (a_c2a))) & ((((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))) \<or> ((((((fapply ((a_c2a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c2a), ((Succ[0])))) = (fapply ((a_c1a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c1a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))))))))))) \<union> ({({})}))))"
fixes a_p2a
assumes a_p2a_in : "(a_p2a \<in> (((subsetOf(((SUBSET (ClausesSet))), %p. (\<forall> a_c1a \<in> (p) : ((~ (\<exists> a_c2a \<in> (p) : ((((a_c1a) \<noteq> (a_c2a))) & ((((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))) \<or> ((((((fapply ((a_c2a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c2a), ((Succ[0])))) = (fapply ((a_c1a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c1a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))))))))))) \<union> ({({})}))))"
fixes a_p3a
assumes a_p3a_in : "(a_p3a \<in> (((subsetOf(((SUBSET (ClausesSet))), %p. (\<forall> a_c1a \<in> (p) : ((~ (\<exists> a_c2a \<in> (p) : ((((a_c1a) \<noteq> (a_c2a))) & ((((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))) \<or> ((((((fapply ((a_c2a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c2a), ((Succ[0])))) = (fapply ((a_c1a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c1a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))))))))))) \<union> ({({})}))))"
fixes a_c3a
assumes a_c3a_in : "(a_c3a \<in> (a_p3a))"
fixes a_c2a
assumes a_c2a_in : "(a_c2a \<in> (a_p2a))"
fixes a_c1a
assumes a_c1a_in : "(a_c1a \<in> (a_p1a))"
fixes e
assumes e_in : "(e \<in> (a_E1a))"
shows "(((a_c2a) \<in> (ClausesSet)))"(is "PROP ?ob'190")
proof -
ML_command {* writeln "*** TLAPS ENTER 190"; *}
show "PROP ?ob'190"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_09440d.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_09440d.znn.out
;; obligation #190
$hyp "a_p1a_in" (TLA.in a_p1a (TLA.cup (TLA.subsetOf (TLA.SUBSET ClausesSet) ((p) (TLA.bAll p ((a_c1a) (-. (TLA.bEx p ((a_c2a) (/\ (-. (= a_c1a
a_c2a)) (\/ (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0)) UU)
(= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))
(/\ (\/ (TLA.in (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)) UU)
(= (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)))))))))))))))
(TLA.set TLA.emptyset)))
$hyp "a_p2a_in" (TLA.in a_p2a (TLA.cup (TLA.subsetOf (TLA.SUBSET ClausesSet) ((p) (TLA.bAll p ((a_c1a) (-. (TLA.bEx p ((a_c2a) (/\ (-. (= a_c1a
a_c2a)) (\/ (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0)) UU)
(= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))
(/\ (\/ (TLA.in (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)) UU)
(= (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)))))))))))))))
(TLA.set TLA.emptyset)))
$hyp "a_p3a_in" (TLA.in a_p3a (TLA.cup (TLA.subsetOf (TLA.SUBSET ClausesSet) ((p) (TLA.bAll p ((a_c1a) (-. (TLA.bEx p ((a_c2a) (/\ (-. (= a_c1a
a_c2a)) (\/ (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0)) UU)
(= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))
(/\ (\/ (TLA.in (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)) UU)
(= (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)))))))))))))))
(TLA.set TLA.emptyset)))
$hyp "a_c3a_in" (TLA.in a_c3a a_p3a)
$hyp "a_c2a_in" (TLA.in a_c2a a_p2a)
$hyp "a_c1a_in" (TLA.in a_c1a a_p1a)
$hyp "e_in" (TLA.in e a_E1a)
$goal (TLA.in a_c2a
ClausesSet)
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Hb:"(a_p2a \\in (subsetOf(SUBSET(ClausesSet), (\<lambda>p. bAll(p, (\<lambda>a_c1a. (~bEx(p, (\<lambda>a_c2a. ((a_c1a~=a_c2a)&(((((a_c1a[1]) \\in UU)|((a_c1a[1])=(a_c2a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((a_c2a[2])[1])[k]))|((((a_c2a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a[2])[2])[e])={NONE})|(cond((((((a_c1a[2])[2])[e]) \\cap UU)~={}), (((((a_c1a[2])[2])[e]) \\ UU) \\cup {(a_c2a[1])}), (((a_c1a[2])[2])[e])) \\subseteq (((a_c2a[2])[2])[e])))))))|((((a_c2a[1]) \\in UU)|((a_c2a[1])=(a_c1a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c2a[2])[1])[k])=(((a_c1a[2])[1])[k]))|((((a_c1a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c2a[2])[2])[e])={NONE})|(cond((((((a_c2a[2])[2])[e]) \\cap UU)~={}), (((((a_c2a[2])[2])[e]) \\ UU) \\cup {(a_c1a[1])}), (((a_c2a[2])[2])[e])) \\subseteq (((a_c1a[2])[2])[e])))))))))))))))) \\cup {{}}))" (is "?z_hb")
 using a_p2a_in by blast
 have z_He:"(a_c2a \\in a_p2a)" (is "?z_he")
 using a_c2a_in by blast
 assume z_Hh:"(~(a_c2a \\in ClausesSet))" (is "~?z_hdm")
 show FALSE
 proof (rule zenon_in_cup [of "a_p2a" "subsetOf(SUBSET(ClausesSet), (\<lambda>p. bAll(p, (\<lambda>a_c1a. (~bEx(p, (\<lambda>a_c2a. ((a_c1a~=a_c2a)&(((((a_c1a[1]) \\in UU)|((a_c1a[1])=(a_c2a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((a_c2a[2])[1])[k]))|((((a_c2a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a[2])[2])[e])={NONE})|(cond((((((a_c1a[2])[2])[e]) \\cap UU)~={}), (((((a_c1a[2])[2])[e]) \\ UU) \\cup {(a_c2a[1])}), (((a_c1a[2])[2])[e])) \\subseteq (((a_c2a[2])[2])[e])))))))|((((a_c2a[1]) \\in UU)|((a_c2a[1])=(a_c1a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c2a[2])[1])[k])=(((a_c1a[2])[1])[k]))|((((a_c1a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c2a[2])[2])[e])={NONE})|(cond((((((a_c2a[2])[2])[e]) \\cap UU)~={}), (((((a_c2a[2])[2])[e]) \\ UU) \\cup {(a_c1a[1])}), (((a_c2a[2])[2])[e])) \\subseteq (((a_c1a[2])[2])[e]))))))))))))))))" "{{}}", OF z_Hb])
  assume z_Hdn:"(a_p2a \\in subsetOf(SUBSET(ClausesSet), (\<lambda>p. bAll(p, (\<lambda>a_c1a. (~bEx(p, (\<lambda>a_c2a. ((a_c1a~=a_c2a)&(((((a_c1a[1]) \\in UU)|((a_c1a[1])=(a_c2a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((a_c2a[2])[1])[k]))|((((a_c2a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a[2])[2])[e])={NONE})|(cond((((((a_c1a[2])[2])[e]) \\cap UU)~={}), (((((a_c1a[2])[2])[e]) \\ UU) \\cup {(a_c2a[1])}), (((a_c1a[2])[2])[e])) \\subseteq (((a_c2a[2])[2])[e])))))))|((((a_c2a[1]) \\in UU)|((a_c2a[1])=(a_c1a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c2a[2])[1])[k])=(((a_c1a[2])[1])[k]))|((((a_c1a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c2a[2])[2])[e])={NONE})|(cond((((((a_c2a[2])[2])[e]) \\cap UU)~={}), (((((a_c2a[2])[2])[e]) \\ UU) \\cup {(a_c1a[1])}), (((a_c2a[2])[2])[e])) \\subseteq (((a_c1a[2])[2])[e])))))))))))))))))" (is "?z_hdn")
  have z_Hdo: "(a_p2a \\in SUBSET(ClausesSet))" (is "?z_hdo")
  by (rule zenon_in_subsetof_0 [of "a_p2a" "SUBSET(ClausesSet)" "(\<lambda>p. bAll(p, (\<lambda>a_c1a. (~bEx(p, (\<lambda>a_c2a. ((a_c1a~=a_c2a)&(((((a_c1a[1]) \\in UU)|((a_c1a[1])=(a_c2a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((a_c2a[2])[1])[k]))|((((a_c2a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a[2])[2])[e])={NONE})|(cond((((((a_c1a[2])[2])[e]) \\cap UU)~={}), (((((a_c1a[2])[2])[e]) \\ UU) \\cup {(a_c2a[1])}), (((a_c1a[2])[2])[e])) \\subseteq (((a_c2a[2])[2])[e])))))))|((((a_c2a[1]) \\in UU)|((a_c2a[1])=(a_c1a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c2a[2])[1])[k])=(((a_c1a[2])[1])[k]))|((((a_c1a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c2a[2])[2])[e])={NONE})|(cond((((((a_c2a[2])[2])[e]) \\cap UU)~={}), (((((a_c2a[2])[2])[e]) \\ UU) \\cup {(a_c1a[1])}), (((a_c2a[2])[2])[e])) \\subseteq (((a_c1a[2])[2])[e])))))))))))))))", OF z_Hdn])
  have z_Hdp: "(a_p2a \\subseteq ClausesSet)" (is "?z_hdp")
  by (rule zenon_in_SUBSET_0 [of "a_p2a" "ClausesSet", OF z_Hdo])
  have z_Hdq_z_Hdp: "bAll(a_p2a, (\<lambda>x. (x \\in ClausesSet))) == ?z_hdp" (is "?z_hdq == _")
  by (unfold subset_def)
  have z_Hdq: "?z_hdq"
  by (unfold z_Hdq_z_Hdp, fact z_Hdp)
  have z_Hdu_z_Hdq: "(\\A x:((x \\in a_p2a)=>(x \\in ClausesSet))) == ?z_hdq" (is "?z_hdu == _")
  by (unfold bAll_def)
  have z_Hdu: "?z_hdu" (is "\\A x : ?z_hdx(x)")
  by (unfold z_Hdu_z_Hdq, fact z_Hdq)
  have z_Hdy: "?z_hdx(a_c2a)"
  by (rule zenon_all_0 [of "?z_hdx" "a_c2a", OF z_Hdu])
  show FALSE
  proof (rule zenon_imply [OF z_Hdy])
   assume z_Hdz:"(~?z_he)"
   show FALSE
   by (rule notE [OF z_Hdz z_He])
  next
   assume z_Hdm:"?z_hdm"
   show FALSE
   by (rule notE [OF z_Hh z_Hdm])
  qed
 next
  assume z_Hea:"(a_p2a \\in {{}})" (is "?z_hea")
  show FALSE
  proof (rule zenon_in_addElt [of "a_p2a" "{}" "{}", OF z_Hea])
   assume z_Hec:"(a_p2a={})"
   have z_Hed: "(\\A zenon_Vca:(~(zenon_Vca \\in a_p2a)))" (is "\\A x : ?z_heh(x)")
   by (rule zenon_setequalempty_0 [of "a_p2a", OF z_Hec])
   have z_Hdz: "?z_heh(a_c2a)"
   by (rule zenon_all_0 [of "?z_heh" "a_c2a", OF z_Hed])
   show FALSE
   by (rule notE [OF z_Hdz z_He])
  next
   assume z_Hei:"(a_p2a \\in {})" (is "?z_hei")
   show FALSE
   by (rule zenon_in_emptyset [of "a_p2a", OF z_Hei])
  qed
 qed
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 190"; *} qed
lemma ob'146:
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
(* usable definition GLB suppressed *)
(* usable definition unionCl suppressed *)
(* usable definition LUB suppressed *)
(* usable definition LUB2 suppressed *)
(* usable definition ClausesSet suppressed *)
(* usable definition PoliciesSet suppressed *)
(* usable definition Ref suppressed *)
(* usable definition Trans suppressed *)
assumes v'31: "((\<And> a_p1a :: c. a_p1a \<in> (PoliciesSet) \<Longrightarrow> (\<And> a_p2a :: c. a_p2a \<in> (PoliciesSet) \<Longrightarrow> (\<And> a_p3a :: c. a_p3a \<in> (PoliciesSet) \<Longrightarrow> (((((\<forall> a_c2a \<in> (a_p2a) : (\<exists> a_c1a \<in> (a_p1a) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))))) \<and> (\<forall> a_c2a \<in> (a_p3a) : (\<exists> a_c1a \<in> (a_p2a) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))))))) \<Rightarrow> (\<forall> a_c2a \<in> (a_p3a) : (\<exists> a_c1a \<in> (a_p1a) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))))))))))"
shows "(\<forall> a_p1a \<in> (PoliciesSet) : (\<forall> a_p2a \<in> (PoliciesSet) : (\<forall> a_p3a \<in> (PoliciesSet) : (((((\<forall> a_c2a \<in> (a_p2a) : (\<exists> a_c1a \<in> (a_p1a) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))))) \<and> (\<forall> a_c2a \<in> (a_p3a) : (\<exists> a_c1a \<in> (a_p2a) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))))))) \<Rightarrow> (\<forall> a_c2a \<in> (a_p3a) : (\<exists> a_c1a \<in> (a_p1a) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))))))))))"(is "PROP ?ob'146")
proof -
ML_command {* writeln "*** TLAPS ENTER 146"; *}
show "PROP ?ob'146"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_b0eab3.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_b0eab3.znn.out
;; obligation #146
$hyp "v'31" (TLA.bAll PoliciesSet ((a_p1a) (TLA.bAll PoliciesSet ((a_p2a) (TLA.bAll PoliciesSet ((a_p3a) (=> (/\ (TLA.bAll a_p2a ((a_c2a) (TLA.bEx a_p1a ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))))))
(TLA.bAll a_p3a ((a_c2a) (TLA.bEx a_p2a ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)))))))))))
(TLA.bAll a_p3a ((a_c2a) (TLA.bEx a_p1a ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)))))))))))))))))
$goal (TLA.bAll PoliciesSet ((a_p1a) (TLA.bAll PoliciesSet ((a_p2a) (TLA.bAll PoliciesSet ((a_p3a) (=> (/\ (TLA.bAll a_p2a ((a_c2a) (TLA.bEx a_p1a ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))))))
(TLA.bAll a_p3a ((a_c2a) (TLA.bEx a_p2a ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)))))))))))
(TLA.bAll a_p3a ((a_c2a) (TLA.bEx a_p1a ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)))))))))))))))))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Ha:"bAll(PoliciesSet, (\<lambda>a_p1a. bAll(PoliciesSet, (\<lambda>a_p2a. bAll(PoliciesSet, (\<lambda>a_p3a. ((bAll(a_p2a, (\<lambda>a_c2a. bEx(a_p1a, (\<lambda>a_c1a. ((((a_c1a[1]) \\in UU)|((a_c1a[1])=(a_c2a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((a_c2a[2])[1])[k]))|((((a_c2a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a[2])[2])[e])={NONE})|(cond((((((a_c1a[2])[2])[e]) \\cap UU)~={}), (((((a_c1a[2])[2])[e]) \\ UU) \\cup {(a_c2a[1])}), (((a_c1a[2])[2])[e])) \\subseteq (((a_c2a[2])[2])[e])))))))))))&bAll(a_p3a, (\<lambda>a_c2a. bEx(a_p2a, (\<lambda>a_c1a. ((((a_c1a[1]) \\in UU)|((a_c1a[1])=(a_c2a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((a_c2a[2])[1])[k]))|((((a_c2a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a[2])[2])[e])={NONE})|(cond((((((a_c1a[2])[2])[e]) \\cap UU)~={}), (((((a_c1a[2])[2])[e]) \\ UU) \\cup {(a_c2a[1])}), (((a_c1a[2])[2])[e])) \\subseteq (((a_c2a[2])[2])[e]))))))))))))=>bAll(a_p3a, (\<lambda>a_c2a. bEx(a_p1a, (\<lambda>a_c1a. ((((a_c1a[1]) \\in UU)|((a_c1a[1])=(a_c2a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((a_c2a[2])[1])[k]))|((((a_c2a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a[2])[2])[e])={NONE})|(cond((((((a_c1a[2])[2])[e]) \\cap UU)~={}), (((((a_c1a[2])[2])[e]) \\ UU) \\cup {(a_c2a[1])}), (((a_c1a[2])[2])[e])) \\subseteq (((a_c2a[2])[2])[e]))))))))))))))))))" (is "?z_ha")
 using v'31 by blast
 assume z_Hb:"(~?z_ha)"
 show FALSE
 by (rule notE [OF z_Hb z_Ha])
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 146"; *} qed
lemma ob'148:
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
(* usable definition GLB suppressed *)
(* usable definition unionCl suppressed *)
(* usable definition LUB suppressed *)
(* usable definition LUB2 suppressed *)
(* usable definition ClausesSet suppressed *)
(* usable definition PoliciesSet suppressed *)
(* usable definition Ref suppressed *)
(* usable definition Trans suppressed *)
fixes a_p1a
assumes a_p1a_in : "(a_p1a \<in> (PoliciesSet))"
fixes a_p2a
assumes a_p2a_in : "(a_p2a \<in> (PoliciesSet))"
fixes a_p3a
assumes a_p3a_in : "(a_p3a \<in> (PoliciesSet))"
assumes v'36: "((((\<forall> a_c2a \<in> (a_p2a) : (\<exists> a_c1a \<in> (a_p1a) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))))) & (\<forall> a_c2a \<in> (a_p3a) : (\<exists> a_c1a \<in> (a_p2a) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))))) \<Longrightarrow> (\<forall> a_c2a \<in> (a_p3a) : (\<exists> a_c1a \<in> (a_p1a) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))))))"
shows "(((((\<forall> a_c2a \<in> (a_p2a) : (\<exists> a_c1a \<in> (a_p1a) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))))) \<and> (\<forall> a_c2a \<in> (a_p3a) : (\<exists> a_c1a \<in> (a_p2a) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))))))) \<Rightarrow> (\<forall> a_c2a \<in> (a_p3a) : (\<exists> a_c1a \<in> (a_p1a) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))))))"(is "PROP ?ob'148")
proof -
ML_command {* writeln "*** TLAPS ENTER 148"; *}
show "PROP ?ob'148"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_49e038.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_49e038.znn.out
;; obligation #148
$hyp "a_p1a_in" (TLA.in a_p1a PoliciesSet)
$hyp "a_p2a_in" (TLA.in a_p2a PoliciesSet)
$hyp "a_p3a_in" (TLA.in a_p3a PoliciesSet)
$hyp "v'36" (=> (/\ (TLA.bAll a_p2a ((a_c2a) (TLA.bEx a_p1a ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))))))
(TLA.bAll a_p3a ((a_c2a) (TLA.bEx a_p2a ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))))))) (TLA.bAll a_p3a ((a_c2a) (TLA.bEx a_p1a ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)))))))))))
$goal (=> (/\ (TLA.bAll a_p2a ((a_c2a) (TLA.bEx a_p1a ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))))))
(TLA.bAll a_p3a ((a_c2a) (TLA.bEx a_p2a ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)))))))))))
(TLA.bAll a_p3a ((a_c2a) (TLA.bEx a_p1a ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)))))))))))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Hd:"((bAll(a_p2a, (\<lambda>a_c2a. bEx(a_p1a, (\<lambda>a_c1a. ((((a_c1a[1]) \\in UU)|((a_c1a[1])=(a_c2a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((a_c2a[2])[1])[k]))|((((a_c2a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a[2])[2])[e])={NONE})|(cond((((((a_c1a[2])[2])[e]) \\cap UU)~={}), (((((a_c1a[2])[2])[e]) \\ UU) \\cup {(a_c2a[1])}), (((a_c1a[2])[2])[e])) \\subseteq (((a_c2a[2])[2])[e])))))))))))&bAll(a_p3a, (\<lambda>a_c2a. bEx(a_p2a, (\<lambda>a_c1a. ((((a_c1a[1]) \\in UU)|((a_c1a[1])=(a_c2a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((a_c2a[2])[1])[k]))|((((a_c2a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a[2])[2])[e])={NONE})|(cond((((((a_c1a[2])[2])[e]) \\cap UU)~={}), (((((a_c1a[2])[2])[e]) \\ UU) \\cup {(a_c2a[1])}), (((a_c1a[2])[2])[e])) \\subseteq (((a_c2a[2])[2])[e]))))))))))))=>bAll(a_p3a, (\<lambda>a_c2a. bEx(a_p1a, (\<lambda>a_c1a. ((((a_c1a[1]) \\in UU)|((a_c1a[1])=(a_c2a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((a_c2a[2])[1])[k]))|((((a_c2a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a[2])[2])[e])={NONE})|(cond((((((a_c1a[2])[2])[e]) \\cap UU)~={}), (((((a_c1a[2])[2])[e]) \\ UU) \\cup {(a_c2a[1])}), (((a_c1a[2])[2])[e])) \\subseteq (((a_c2a[2])[2])[e]))))))))))))" (is "?z_hf=>?z_hcj")
 using v'36 by blast
 assume z_He:"(~(?z_hf=>?z_hcj))"
 show FALSE
 by (rule notE [OF z_He z_Hd])
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 148"; *} qed
lemma ob'158:
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
(* usable definition GLB suppressed *)
(* usable definition unionCl suppressed *)
(* usable definition LUB suppressed *)
(* usable definition LUB2 suppressed *)
(* usable definition ClausesSet suppressed *)
(* usable definition PoliciesSet suppressed *)
(* usable definition Ref suppressed *)
(* usable definition Trans suppressed *)
fixes a_p1a
assumes a_p1a_in : "(a_p1a \<in> (PoliciesSet))"
fixes a_p2a
assumes a_p2a_in : "(a_p2a \<in> (PoliciesSet))"
fixes a_p3a
assumes a_p3a_in : "(a_p3a \<in> (PoliciesSet))"
fixes a_c3a
assumes a_c3a_in : "(a_c3a \<in> (a_p3a))"
fixes a_c2a
assumes a_c2a_in : "(a_c2a \<in> (a_p2a))"
assumes v'50: "((\<forall> a_c2a_1 \<in> (a_p2a) : (\<exists> a_c1a \<in> (a_p1a) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a_1), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a_1), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))))) & (\<forall> a_c2a_1 \<in> (a_p3a) : (\<exists> a_c1a \<in> (a_p2a) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a_1), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a_1), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))))))"
shows "(\<exists> a_c1a \<in> (a_p1a) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))))"(is "PROP ?ob'158")
proof -
ML_command {* writeln "*** TLAPS ENTER 158"; *}
show "PROP ?ob'158"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_ce2ae5.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_ce2ae5.znn.out
;; obligation #158
$hyp "a_p1a_in" (TLA.in a_p1a PoliciesSet)
$hyp "a_p2a_in" (TLA.in a_p2a PoliciesSet)
$hyp "a_p3a_in" (TLA.in a_p3a PoliciesSet)
$hyp "a_c3a_in" (TLA.in a_c3a a_p3a)
$hyp "a_c2a_in" (TLA.in a_c2a a_p2a)
$hyp "v'50" (/\ (TLA.bAll a_p2a ((a_c2a_1) (TLA.bEx a_p1a ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))))))
(TLA.bAll a_p3a ((a_c2a_1) (TLA.bEx a_p2a ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)))))))))))
$goal (TLA.bEx a_p1a ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Hf:"(bAll(a_p2a, (\<lambda>a_c2a_1. bEx(a_p1a, (\<lambda>a_c1a. ((((a_c1a[1]) \\in UU)|((a_c1a[1])=(a_c2a_1[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((a_c2a_1[2])[1])[k]))|((((a_c2a_1[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a[2])[2])[e])={NONE})|(cond((((((a_c1a[2])[2])[e]) \\cap UU)~={}), (((((a_c1a[2])[2])[e]) \\ UU) \\cup {(a_c2a_1[1])}), (((a_c1a[2])[2])[e])) \\subseteq (((a_c2a_1[2])[2])[e])))))))))))&bAll(a_p3a, (\<lambda>a_c2a_1. bEx(a_p2a, (\<lambda>a_c1a. ((((a_c1a[1]) \\in UU)|((a_c1a[1])=(a_c2a_1[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((a_c2a_1[2])[1])[k]))|((((a_c2a_1[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a[2])[2])[e])={NONE})|(cond((((((a_c1a[2])[2])[e]) \\cap UU)~={}), (((((a_c1a[2])[2])[e]) \\ UU) \\cup {(a_c2a_1[1])}), (((a_c1a[2])[2])[e])) \\subseteq (((a_c2a_1[2])[2])[e]))))))))))))" (is "?z_hh&?z_hcg")
 using v'50 by blast
 have z_He:"(a_c2a \\in a_p2a)" (is "?z_he")
 using a_c2a_in by blast
 assume z_Hg:"(~bEx(a_p1a, (\<lambda>a_c1a. ((((a_c1a[1]) \\in UU)|((a_c1a[1])=(a_c2a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((a_c2a[2])[1])[k]))|((((a_c2a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a[2])[2])[e])={NONE})|(cond((((((a_c1a[2])[2])[e]) \\cap UU)~={}), (((((a_c1a[2])[2])[e]) \\ UU) \\cup {(a_c2a[1])}), (((a_c1a[2])[2])[e])) \\subseteq (((a_c2a[2])[2])[e]))))))))))" (is "~?z_hcl")
 have z_Hh: "?z_hh"
 by (rule zenon_and_0 [OF z_Hf])
 have z_Hdj_z_Hh: "(\\A x:((x \\in a_p2a)=>bEx(a_p1a, (\<lambda>a_c1a. ((((a_c1a[1]) \\in UU)|((a_c1a[1])=(x[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((x[2])[1])[k]))|((((x[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a[2])[2])[e])={NONE})|(cond((((((a_c1a[2])[2])[e]) \\cap UU)~={}), (((((a_c1a[2])[2])[e]) \\ UU) \\cup {(x[1])}), (((a_c1a[2])[2])[e])) \\subseteq (((x[2])[2])[e]))))))))))) == ?z_hh" (is "?z_hdj == _")
 by (unfold bAll_def)
 have z_Hdj: "?z_hdj" (is "\\A x : ?z_hel(x)")
 by (unfold z_Hdj_z_Hh, fact z_Hh)
 have z_Hem: "?z_hel(a_c2a)"
 by (rule zenon_all_0 [of "?z_hel" "a_c2a", OF z_Hdj])
 show FALSE
 proof (rule zenon_imply [OF z_Hem])
  assume z_Hen:"(~?z_he)"
  show FALSE
  by (rule notE [OF z_Hen z_He])
 next
  assume z_Hcl:"?z_hcl"
  show FALSE
  by (rule notE [OF z_Hg z_Hcl])
 qed
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 158"; *} qed
lemma ob'228:
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
(* usable definition GLB suppressed *)
(* usable definition unionCl suppressed *)
(* usable definition LUB suppressed *)
(* usable definition LUB2 suppressed *)
(* usable definition ClausesSet suppressed *)
(* usable definition PoliciesSet suppressed *)
(* usable definition Ref suppressed *)
(* usable definition Trans suppressed *)
(* usable definition AntiSym suppressed *)
assumes v'33: "((\<And> a_p1a :: c. a_p1a \<in> (PoliciesSet) \<Longrightarrow> (\<And> a_p2a :: c. a_p2a \<in> (PoliciesSet) \<Longrightarrow> (((((\<forall> a_c2a \<in> (a_p2a) : (\<exists> a_c1a \<in> (a_p1a) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))))) \<and> (\<forall> a_c2a \<in> (a_p1a) : (\<exists> a_c1a \<in> (a_p2a) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))))))) \<Rightarrow> (((a_p1a) = (a_p2a))))))))"
shows "(\<forall> a_p1a \<in> (PoliciesSet) : (\<forall> a_p2a \<in> (PoliciesSet) : (((((\<forall> a_c2a \<in> (a_p2a) : (\<exists> a_c1a \<in> (a_p1a) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))))) \<and> (\<forall> a_c2a \<in> (a_p1a) : (\<exists> a_c1a \<in> (a_p2a) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))))))) \<Rightarrow> (((a_p1a) = (a_p2a)))))))"(is "PROP ?ob'228")
proof -
ML_command {* writeln "*** TLAPS ENTER 228"; *}
show "PROP ?ob'228"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_3b5e28.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_3b5e28.znn.out
;; obligation #228
$hyp "v'33" (TLA.bAll PoliciesSet ((a_p1a) (TLA.bAll PoliciesSet ((a_p2a) (=> (/\ (TLA.bAll a_p2a ((a_c2a) (TLA.bEx a_p1a ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))))))
(TLA.bAll a_p1a ((a_c2a) (TLA.bEx a_p2a ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)))))))))))
(= a_p1a
a_p2a))))))
$goal (TLA.bAll PoliciesSet ((a_p1a) (TLA.bAll PoliciesSet ((a_p2a) (=> (/\ (TLA.bAll a_p2a ((a_c2a) (TLA.bEx a_p1a ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))))))
(TLA.bAll a_p1a ((a_c2a) (TLA.bEx a_p2a ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)))))))))))
(= a_p1a
a_p2a))))))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Ha:"bAll(PoliciesSet, (\<lambda>a_p1a. bAll(PoliciesSet, (\<lambda>a_p2a. ((bAll(a_p2a, (\<lambda>a_c2a. bEx(a_p1a, (\<lambda>a_c1a. ((((a_c1a[1]) \\in UU)|((a_c1a[1])=(a_c2a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((a_c2a[2])[1])[k]))|((((a_c2a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a[2])[2])[e])={NONE})|(cond((((((a_c1a[2])[2])[e]) \\cap UU)~={}), (((((a_c1a[2])[2])[e]) \\ UU) \\cup {(a_c2a[1])}), (((a_c1a[2])[2])[e])) \\subseteq (((a_c2a[2])[2])[e])))))))))))&bAll(a_p1a, (\<lambda>a_c2a. bEx(a_p2a, (\<lambda>a_c1a. ((((a_c1a[1]) \\in UU)|((a_c1a[1])=(a_c2a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((a_c2a[2])[1])[k]))|((((a_c2a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a[2])[2])[e])={NONE})|(cond((((((a_c1a[2])[2])[e]) \\cap UU)~={}), (((((a_c1a[2])[2])[e]) \\ UU) \\cup {(a_c2a[1])}), (((a_c1a[2])[2])[e])) \\subseteq (((a_c2a[2])[2])[e]))))))))))))=>(a_p1a=a_p2a))))))" (is "?z_ha")
 using v'33 by blast
 assume z_Hb:"(~?z_ha)"
 show FALSE
 by (rule notE [OF z_Hb z_Ha])
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 228"; *} qed
lemma ob'230:
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
assumes v'37: "((((((\<forall> a_c2a \<in> (a_p2a) : (\<exists> a_c1a \<in> (a_p1a) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))))) \<and> (\<forall> a_c2a \<in> (a_p1a) : (\<exists> a_c1a \<in> (a_p2a) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))))))) \<Longrightarrow> (((a_p1a) = (a_p2a)))))"
shows "(((((\<forall> a_c2a \<in> (a_p2a) : (\<exists> a_c1a \<in> (a_p1a) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))))) \<and> (\<forall> a_c2a \<in> (a_p1a) : (\<exists> a_c1a \<in> (a_p2a) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))))))) \<Rightarrow> (((a_p1a) = (a_p2a)))))"(is "PROP ?ob'230")
proof -
ML_command {* writeln "*** TLAPS ENTER 230"; *}
show "PROP ?ob'230"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_154f2e.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_154f2e.znn.out
;; obligation #230
$hyp "a_p1a_in" (TLA.in a_p1a PoliciesSet)
$hyp "a_p2a_in" (TLA.in a_p2a PoliciesSet)
$hyp "v'37" (=> (/\ (/\ (TLA.bAll a_p2a ((a_c2a) (TLA.bEx a_p1a ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))))))
(TLA.bAll a_p1a ((a_c2a) (TLA.bEx a_p2a ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)))))))))))) (= a_p1a
a_p2a))
$goal (=> (/\ (TLA.bAll a_p2a ((a_c2a) (TLA.bEx a_p1a ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))))))
(TLA.bAll a_p1a ((a_c2a) (TLA.bEx a_p2a ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)))))))))))
(= a_p1a
a_p2a))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Hc:"((bAll(a_p2a, (\<lambda>a_c2a. bEx(a_p1a, (\<lambda>a_c1a. ((((a_c1a[1]) \\in UU)|((a_c1a[1])=(a_c2a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((a_c2a[2])[1])[k]))|((((a_c2a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a[2])[2])[e])={NONE})|(cond((((((a_c1a[2])[2])[e]) \\cap UU)~={}), (((((a_c1a[2])[2])[e]) \\ UU) \\cup {(a_c2a[1])}), (((a_c1a[2])[2])[e])) \\subseteq (((a_c2a[2])[2])[e])))))))))))&bAll(a_p1a, (\<lambda>a_c2a. bEx(a_p2a, (\<lambda>a_c1a. ((((a_c1a[1]) \\in UU)|((a_c1a[1])=(a_c2a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((a_c2a[2])[1])[k]))|((((a_c2a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a[2])[2])[e])={NONE})|(cond((((((a_c1a[2])[2])[e]) \\cap UU)~={}), (((((a_c1a[2])[2])[e]) \\ UU) \\cup {(a_c2a[1])}), (((a_c1a[2])[2])[e])) \\subseteq (((a_c2a[2])[2])[e]))))))))))))=>(a_p1a=a_p2a))" (is "?z_he=>?z_hch")
 using v'37 by blast
 assume z_Hd:"(~(?z_he=>?z_hch))"
 show FALSE
 by (rule notE [OF z_Hd z_Hc])
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 230"; *} qed
lemma ob'241:
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
fixes a_c2a
assumes a_c2a_in : "(a_c2a \<in> (a_p2a))"
assumes v'48: "(((\<forall> a_c2a_1 \<in> (a_p2a) : (\<exists> a_c1a \<in> (a_p1a) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a_1), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a_1), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))))) \<and> (\<forall> a_c2a_1 \<in> (a_p1a) : (\<exists> a_c1a \<in> (a_p2a) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a_1), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a_1), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))))))"
shows "(\<exists> a_c1a \<in> (a_p1a) : ((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))))"(is "PROP ?ob'241")
proof -
ML_command {* writeln "*** TLAPS ENTER 241"; *}
show "PROP ?ob'241"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_fa5ea6.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_fa5ea6.znn.out
;; obligation #241
$hyp "a_p1a_in" (TLA.in a_p1a PoliciesSet)
$hyp "a_p2a_in" (TLA.in a_p2a PoliciesSet)
$hyp "a_c2a_in" (TLA.in a_c2a a_p2a)
$hyp "v'48" (/\ (TLA.bAll a_p2a ((a_c2a_1) (TLA.bEx a_p1a ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))))))
(TLA.bAll a_p1a ((a_c2a_1) (TLA.bEx a_p2a ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)))))))))))
$goal (TLA.bEx a_p1a ((a_c1a) (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Hd:"(bAll(a_p2a, (\<lambda>a_c2a_1. bEx(a_p1a, (\<lambda>a_c1a. ((((a_c1a[1]) \\in UU)|((a_c1a[1])=(a_c2a_1[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((a_c2a_1[2])[1])[k]))|((((a_c2a_1[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a[2])[2])[e])={NONE})|(cond((((((a_c1a[2])[2])[e]) \\cap UU)~={}), (((((a_c1a[2])[2])[e]) \\ UU) \\cup {(a_c2a_1[1])}), (((a_c1a[2])[2])[e])) \\subseteq (((a_c2a_1[2])[2])[e])))))))))))&bAll(a_p1a, (\<lambda>a_c2a_1. bEx(a_p2a, (\<lambda>a_c1a. ((((a_c1a[1]) \\in UU)|((a_c1a[1])=(a_c2a_1[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((a_c2a_1[2])[1])[k]))|((((a_c2a_1[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a[2])[2])[e])={NONE})|(cond((((((a_c1a[2])[2])[e]) \\cap UU)~={}), (((((a_c1a[2])[2])[e]) \\ UU) \\cup {(a_c2a_1[1])}), (((a_c1a[2])[2])[e])) \\subseteq (((a_c2a_1[2])[2])[e]))))))))))))" (is "?z_hf&?z_hce")
 using v'48 by blast
 have z_Hc:"(a_c2a \\in a_p2a)" (is "?z_hc")
 using a_c2a_in by blast
 assume z_He:"(~bEx(a_p1a, (\<lambda>a_c1a. ((((a_c1a[1]) \\in UU)|((a_c1a[1])=(a_c2a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((a_c2a[2])[1])[k]))|((((a_c2a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a[2])[2])[e])={NONE})|(cond((((((a_c1a[2])[2])[e]) \\cap UU)~={}), (((((a_c1a[2])[2])[e]) \\ UU) \\cup {(a_c2a[1])}), (((a_c1a[2])[2])[e])) \\subseteq (((a_c2a[2])[2])[e]))))))))))" (is "~?z_hci")
 have z_Hf: "?z_hf"
 by (rule zenon_and_0 [OF z_Hd])
 have z_Hdg_z_Hf: "(\\A x:((x \\in a_p2a)=>bEx(a_p1a, (\<lambda>a_c1a. ((((a_c1a[1]) \\in UU)|((a_c1a[1])=(x[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((x[2])[1])[k]))|((((x[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a[2])[2])[e])={NONE})|(cond((((((a_c1a[2])[2])[e]) \\cap UU)~={}), (((((a_c1a[2])[2])[e]) \\ UU) \\cup {(x[1])}), (((a_c1a[2])[2])[e])) \\subseteq (((x[2])[2])[e]))))))))))) == ?z_hf" (is "?z_hdg == _")
 by (unfold bAll_def)
 have z_Hdg: "?z_hdg" (is "\\A x : ?z_hei(x)")
 by (unfold z_Hdg_z_Hf, fact z_Hf)
 have z_Hej: "?z_hei(a_c2a)"
 by (rule zenon_all_0 [of "?z_hei" "a_c2a", OF z_Hdg])
 show FALSE
 proof (rule zenon_imply [OF z_Hej])
  assume z_Hek:"(~?z_hc)"
  show FALSE
  by (rule notE [OF z_Hek z_Hc])
 next
  assume z_Hci:"?z_hci"
  show FALSE
  by (rule notE [OF z_He z_Hci])
 qed
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 241"; *} qed
lemma ob'243:
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
fixes a_c2a
assumes a_c2a_in : "(a_c2a \<in> (a_p2a))"
fixes a_c1a
assumes a_c1a_in : "(a_c1a \<in> (a_p1a))"
assumes v'53: "(((\<forall> a_c2a_1 \<in> (a_p2a) : (\<exists> a_c1a_1 \<in> (a_p1a) : ((((((fapply ((a_c1a_1), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a_1), ((Succ[0])))) = (fapply ((a_c2a_1), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a_1), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))))) \<and> (\<forall> a_c2a_1 \<in> (a_p1a) : (\<exists> a_c1a_1 \<in> (a_p2a) : ((((((fapply ((a_c1a_1), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a_1), ((Succ[0])))) = (fapply ((a_c2a_1), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a_1), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))))))"
shows "(\<exists> a_c3a \<in> (a_p2a) : (((((((fapply ((a_c3a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c3a), ((Succ[0])))) = (fapply ((a_c1a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c3a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c3a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c3a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c3a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c1a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c3a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))))"(is "PROP ?ob'243")
proof -
ML_command {* writeln "*** TLAPS ENTER 243"; *}
show "PROP ?ob'243"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_3730ee.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_3730ee.znn.out
;; obligation #243
$hyp "a_p1a_in" (TLA.in a_p1a PoliciesSet)
$hyp "a_p2a_in" (TLA.in a_p2a PoliciesSet)
$hyp "a_c2a_in" (TLA.in a_c2a a_p2a)
$hyp "a_c1a_in" (TLA.in a_c1a a_p1a)
$hyp "v'53" (/\ (TLA.bAll a_p2a ((a_c2a_1) (TLA.bEx a_p1a ((a_c1a_1) (/\ (\/ (TLA.in (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))))))
(TLA.bAll a_p1a ((a_c2a_1) (TLA.bEx a_p2a ((a_c1a_1) (/\ (\/ (TLA.in (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)))))))))))
$goal (TLA.bEx a_p2a ((a_c3a) (/\ (/\ (\/ (TLA.in (TLA.fapply a_c3a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c3a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c3a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c3a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c3a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c3a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c3a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)))))))))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_He:"(bAll(a_p2a, (\<lambda>a_c2a_1. bEx(a_p1a, (\<lambda>a_c1a_1. ((((a_c1a_1[1]) \\in UU)|((a_c1a_1[1])=(a_c2a_1[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a_1[2])[1])[k])=(((a_c2a_1[2])[1])[k]))|((((a_c2a_1[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a_1[2])[2])[e])={NONE})|(cond((((((a_c1a_1[2])[2])[e]) \\cap UU)~={}), (((((a_c1a_1[2])[2])[e]) \\ UU) \\cup {(a_c2a_1[1])}), (((a_c1a_1[2])[2])[e])) \\subseteq (((a_c2a_1[2])[2])[e])))))))))))&bAll(a_p1a, (\<lambda>a_c2a_1. bEx(a_p2a, (\<lambda>a_c1a_1. ((((a_c1a_1[1]) \\in UU)|((a_c1a_1[1])=(a_c2a_1[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a_1[2])[1])[k])=(((a_c2a_1[2])[1])[k]))|((((a_c2a_1[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a_1[2])[2])[e])={NONE})|(cond((((((a_c1a_1[2])[2])[e]) \\cap UU)~={}), (((((a_c1a_1[2])[2])[e]) \\ UU) \\cup {(a_c2a_1[1])}), (((a_c1a_1[2])[2])[e])) \\subseteq (((a_c2a_1[2])[2])[e]))))))))))))" (is "?z_hg&?z_hcf")
 using v'53 by blast
 have z_Hd:"(a_c1a \\in a_p1a)" (is "?z_hd")
 using a_c1a_in by blast
 assume z_Hf:"(~bEx(a_p2a, (\<lambda>a_c3a. ((((a_c3a[1]) \\in UU)|((a_c3a[1])=(a_c1a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c3a[2])[1])[k])=(((a_c1a[2])[1])[k]))|((((a_c1a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c3a[2])[2])[e])={NONE})|(cond((((((a_c3a[2])[2])[e]) \\cap UU)~={}), (((((a_c3a[2])[2])[e]) \\ UU) \\cup {(a_c1a[1])}), (((a_c3a[2])[2])[e])) \\subseteq (((a_c1a[2])[2])[e]))))))))))" (is "~?z_hcj")
 have z_Hcf: "?z_hcf"
 by (rule zenon_and_1 [OF z_He])
 have z_Hdt_z_Hcf: "(\\A x:((x \\in a_p1a)=>bEx(a_p2a, (\<lambda>a_c1a_1. ((((a_c1a_1[1]) \\in UU)|((a_c1a_1[1])=(x[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a_1[2])[1])[k])=(((x[2])[1])[k]))|((((x[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a_1[2])[2])[e])={NONE})|(cond((((((a_c1a_1[2])[2])[e]) \\cap UU)~={}), (((((a_c1a_1[2])[2])[e]) \\ UU) \\cup {(x[1])}), (((a_c1a_1[2])[2])[e])) \\subseteq (((x[2])[2])[e]))))))))))) == ?z_hcf" (is "?z_hdt == _")
 by (unfold bAll_def)
 have z_Hdt: "?z_hdt" (is "\\A x : ?z_hev(x)")
 by (unfold z_Hdt_z_Hcf, fact z_Hcf)
 have z_Hew: "?z_hev(a_c1a)"
 by (rule zenon_all_0 [of "?z_hev" "a_c1a", OF z_Hdt])
 show FALSE
 proof (rule zenon_imply [OF z_Hew])
  assume z_Hex:"(~?z_hd)"
  show FALSE
  by (rule notE [OF z_Hex z_Hd])
 next
  assume z_Hcj:"?z_hcj"
  show FALSE
  by (rule notE [OF z_Hf z_Hcj])
 qed
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 243"; *} qed
lemma ob'387:
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
fixes a_c2a
assumes a_c2a_in : "(a_c2a \<in> (a_p2a))"
fixes a_c1a
assumes a_c1a_in : "(a_c1a \<in> (a_p1a))"
fixes a_c3a
assumes a_c3a_in : "(a_c3a \<in> (a_p2a))"
assumes v'63: "((((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))"
assumes v'64: "((((((fapply ((a_c3a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c3a), ((Succ[0])))) = (fapply ((a_c1a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c3a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c3a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c3a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c3a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c1a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c3a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))"
assumes v'65: "(((a_c3a) = (a_c2a)))"
shows "(\<forall> a_e0a \<in> (a_E0a) : (((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (a_e0a))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (a_e0a))))))"(is "PROP ?ob'387")
proof -
ML_command {* writeln "*** TLAPS ENTER 387"; *}
show "PROP ?ob'387"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_1d8a48.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_1d8a48.znn.out
;; obligation #387
$hyp "a_p1a_in" (TLA.in a_p1a PoliciesSet)
$hyp "a_p2a_in" (TLA.in a_p2a PoliciesSet)
$hyp "a_c2a_in" (TLA.in a_c2a a_p2a)
$hyp "a_c1a_in" (TLA.in a_c1a a_p1a)
$hyp "a_c3a_in" (TLA.in a_c3a a_p2a)
$hyp "v'63" (/\ (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0)) UU)
(= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))
$hyp "v'64" (/\ (\/ (TLA.in (TLA.fapply a_c3a (TLA.fapply TLA.Succ 0)) UU)
(= (TLA.fapply a_c3a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c3a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c3a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c3a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c3a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c3a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))
$hyp "v'65" (= a_c3a
a_c2a)
$goal (TLA.bAll a_E0a ((a_e0a) (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) a_e0a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) a_e0a))))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Hf:"((((a_c1a[1]) \\in UU)|((a_c1a[1])=(a_c2a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((a_c2a[2])[1])[k]))|((((a_c2a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a[2])[2])[e])={NONE})|(cond((((((a_c1a[2])[2])[e]) \\cap UU)~={}), (((((a_c1a[2])[2])[e]) \\ UU) \\cup {(a_c2a[1])}), (((a_c1a[2])[2])[e])) \\subseteq (((a_c2a[2])[2])[e])))))))" (is "?z_hj&?z_hs")
 using v'63 by blast
 have z_Hh:"(a_c3a=a_c2a)"
 using v'65 by blast
 have z_Hg:"((((a_c3a[1]) \\in UU)|((a_c3a[1])=(a_c1a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c3a[2])[1])[k])=(((a_c1a[2])[1])[k]))|((((a_c1a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c3a[2])[2])[e])={NONE})|(cond((((((a_c3a[2])[2])[e]) \\cap UU)~={}), (((((a_c3a[2])[2])[e]) \\ UU) \\cup {(a_c1a[1])}), (((a_c3a[2])[2])[e])) \\subseteq (((a_c1a[2])[2])[e])))))))" (is "?z_hcc&?z_hcg")
 using v'64 by blast
 have zenon_L1_: "(a_c3a=a_c2a) ==> ((((a_c3a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>((((a_c1a[2])[1])[x])=(((a_c2a[2])[1])[x])))))])=(((a_c1a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>((((a_c1a[2])[1])[x])=(((a_c2a[2])[1])[x])))))])) ==> ((((a_c1a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>((((a_c1a[2])[1])[x])=(((a_c2a[2])[1])[x])))))])~=(((a_c2a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>((((a_c1a[2])[1])[x])=(((a_c2a[2])[1])[x])))))])) ==> FALSE" (is "?z_hh ==> ?z_hdc ==> ?z_hdn ==> FALSE")
 proof -
  assume z_Hh:"?z_hh"
  assume z_Hdc:"?z_hdc" (is "?z_hdd=?z_hdm")
  assume z_Hdn:"?z_hdn" (is "_~=?z_hdo")
  have z_Hdp: "(?z_hdo=?z_hdm)"
  by (rule subst [where P="(\<lambda>zenon_Veta. ((((zenon_Veta[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>((((a_c1a[2])[1])[x])=(((a_c2a[2])[1])[x])))))])=?z_hdm))", OF z_Hh z_Hdc])
  show FALSE
  by (rule zenon_eqsym [OF z_Hdp z_Hdn])
 qed
 assume z_Hi:"(~bAll(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a])=(((a_c2a[2])[1])[a_e0a])))))" (is "~?z_hdw")
 have z_Hs: "?z_hs" (is "?z_ht&?z_hbi")
 by (rule zenon_and_1 [OF z_Hf])
 have z_Ht: "?z_ht"
 by (rule zenon_and_0 [OF z_Hs])
 have z_Hec_z_Ht: "(\\A x:((x \\in a_E0a)=>(((((a_c1a[2])[1])[x])=(((a_c2a[2])[1])[x]))|((((a_c2a[2])[1])[x])={})))) == ?z_ht" (is "?z_hec == _")
 by (unfold bAll_def)
 have z_Hec: "?z_hec" (is "\\A x : ?z_heg(x)")
 by (unfold z_Hec_z_Ht, fact z_Ht)
 have z_Hcg: "?z_hcg" (is "?z_hch&?z_hcp")
 by (rule zenon_and_1 [OF z_Hg])
 have z_Hch: "?z_hch"
 by (rule zenon_and_0 [OF z_Hcg])
 have z_Heh_z_Hch: "(\\A x:((x \\in a_E0a)=>(((((a_c3a[2])[1])[x])=(((a_c1a[2])[1])[x]))|((((a_c1a[2])[1])[x])={})))) == ?z_hch" (is "?z_heh == _")
 by (unfold bAll_def)
 have z_Heh: "?z_heh" (is "\\A x : ?z_hen(x)")
 by (unfold z_Heh_z_Hch, fact z_Hch)
 have z_Heo_z_Hi: "(~(\\A x:((x \\in a_E0a)=>((((a_c1a[2])[1])[x])=(((a_c2a[2])[1])[x]))))) == (~?z_hdw)" (is "?z_heo == ?z_hi")
 by (unfold bAll_def)
 have z_Heo: "?z_heo" (is "~(\\A x : ?z_heq(x))")
 by (unfold z_Heo_z_Hi, fact z_Hi)
 have z_Her: "(\\E x:(~((x \\in a_E0a)=>((((a_c1a[2])[1])[x])=(((a_c2a[2])[1])[x])))))" (is "\\E x : ?z_hes(x)")
 by (rule zenon_notallex_0 [of "?z_heq", OF z_Heo])
 have z_Het: "?z_hes((CHOOSE x:(~((x \\in a_E0a)=>((((a_c1a[2])[1])[x])=(((a_c2a[2])[1])[x]))))))" (is "~(?z_heu=>?z_hev)")
 by (rule zenon_ex_choose_0 [of "?z_hes", OF z_Her])
 have z_Heu: "?z_heu"
 by (rule zenon_notimply_0 [OF z_Het])
 have z_Hdn: "((((a_c1a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>((((a_c1a[2])[1])[x])=(((a_c2a[2])[1])[x])))))])~=(((a_c2a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>((((a_c1a[2])[1])[x])=(((a_c2a[2])[1])[x])))))]))" (is "?z_hdm~=?z_hdo")
 by (rule zenon_notimply_1 [OF z_Het])
 have z_Hew: "?z_hen((CHOOSE x:(~((x \\in a_E0a)=>((((a_c1a[2])[1])[x])=(((a_c2a[2])[1])[x]))))))" (is "_=>?z_hex")
 by (rule zenon_all_0 [of "?z_hen" "(CHOOSE x:(~((x \\in a_E0a)=>((((a_c1a[2])[1])[x])=(((a_c2a[2])[1])[x])))))", OF z_Heh])
 show FALSE
 proof (rule zenon_imply [OF z_Hew])
  assume z_Hey:"(~?z_heu)"
  show FALSE
  by (rule notE [OF z_Hey z_Heu])
 next
  assume z_Hex:"?z_hex" (is "?z_hdc|?z_hez")
  show FALSE
  proof (rule zenon_or [OF z_Hex])
   assume z_Hdc:"?z_hdc" (is "?z_hdd=_")
   show FALSE
   by (rule zenon_L1_ [OF z_Hh z_Hdc z_Hdn])
  next
   assume z_Hez:"?z_hez"
   have z_Hfa: "?z_heg((CHOOSE x:(~((x \\in a_E0a)=>((((a_c1a[2])[1])[x])=(((a_c2a[2])[1])[x]))))))" (is "_=>?z_hfb")
   by (rule zenon_all_0 [of "?z_heg" "(CHOOSE x:(~((x \\in a_E0a)=>((((a_c1a[2])[1])[x])=(((a_c2a[2])[1])[x])))))", OF z_Hec])
   show FALSE
   proof (rule zenon_imply [OF z_Hfa])
    assume z_Hey:"(~?z_heu)"
    show FALSE
    by (rule notE [OF z_Hey z_Heu])
   next
    assume z_Hfb:"?z_hfb" (is "_|?z_hfc")
    show FALSE
    proof (rule zenon_or [OF z_Hfb])
     assume z_Hev:"?z_hev"
     show FALSE
     by (rule notE [OF z_Hdn z_Hev])
    next
     assume z_Hfc:"?z_hfc"
     show FALSE
     proof (rule notE [OF z_Hdn])
      have z_Hfd: "({}=?z_hdo)"
      by (rule sym [OF z_Hfc])
      have z_Hev: "?z_hev"
      by (rule subst [where P="(\<lambda>zenon_Vhta. (?z_hdm=zenon_Vhta))", OF z_Hfd], fact z_Hez)
      thus "?z_hev" .
     qed
    qed
   qed
  qed
 qed
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 387"; *} qed
lemma ob'425:
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
fixes a_c2a
assumes a_c2a_in : "(a_c2a \<in> (a_p2a))"
fixes a_c1a
assumes a_c1a_in : "(a_c1a \<in> (a_p1a))"
fixes a_c3a
assumes a_c3a_in : "(a_c3a \<in> (a_p2a))"
fixes a_e1a
assumes a_e1a_in : "(a_e1a \<in> (a_E1a))"
assumes v'76: "(((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))) \<subseteq> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a)))))"
assumes v'77: "(((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a)))))"
shows "(((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a)))))"(is "PROP ?ob'425")
proof -
ML_command {* writeln "*** TLAPS ENTER 425"; *}
show "PROP ?ob'425"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_52647a.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_52647a.znn.out
;; obligation #425
$hyp "a_p1a_in" (TLA.in a_p1a PoliciesSet)
$hyp "a_p2a_in" (TLA.in a_p2a PoliciesSet)
$hyp "a_c2a_in" (TLA.in a_c2a a_p2a)
$hyp "a_c1a_in" (TLA.in a_c1a a_p1a)
$hyp "a_c3a_in" (TLA.in a_c3a a_p2a)
$hyp "a_e1a_in" (TLA.in a_e1a a_E1a)
$hyp "v'76" (TLA.subseteq (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
$hyp "v'77" (TLA.subseteq (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
$goal (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Hh:"((((a_c2a[2])[2])[a_e1a]) \\subseteq (((a_c1a[2])[2])[a_e1a]))" (is "?z_hh")
 using v'76 by blast
 have z_Hi:"((((a_c1a[2])[2])[a_e1a]) \\subseteq (((a_c2a[2])[2])[a_e1a]))" (is "?z_hi")
 using v'77 by blast
 have zenon_L1_: "(~(\\A zenon_Vba:((zenon_Vba \\in (((a_c1a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c2a[2])[2])[a_e1a]))))) ==> (\\A x:((x \\in (((a_c1a[2])[2])[a_e1a]))=>(x \\in (((a_c2a[2])[2])[a_e1a])))) ==> (\\A x:((x \\in (((a_c2a[2])[2])[a_e1a]))=>(x \\in (((a_c1a[2])[2])[a_e1a])))) ==> FALSE" (is "?z_hu ==> ?z_ha ==> ?z_hbe ==> FALSE")
 proof -
  assume z_Hu:"?z_hu" (is "~(\\A x : ?z_hbg(x))")
  assume z_Ha:"?z_ha" (is "\\A x : ?z_hbh(x)")
  assume z_Hbe:"?z_hbe" (is "\\A x : ?z_hbi(x)")
  have z_Hbj: "(\\E zenon_Vba:(~((zenon_Vba \\in (((a_c1a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c2a[2])[2])[a_e1a])))))" (is "\\E x : ?z_hbl(x)")
  by (rule zenon_notallex_0 [of "?z_hbg", OF z_Hu])
  have z_Hbm: "?z_hbl((CHOOSE zenon_Vba:(~((zenon_Vba \\in (((a_c1a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c2a[2])[2])[a_e1a]))))))" (is "~(?z_hbo<=>?z_hbp)")
  by (rule zenon_ex_choose_0 [of "?z_hbl", OF z_Hbj])
  show FALSE
  proof (rule zenon_notequiv [OF z_Hbm])
   assume z_Hbq:"(~?z_hbo)"
   assume z_Hbp:"?z_hbp"
   have z_Hbr: "?z_hbi((CHOOSE zenon_Vba:(~((zenon_Vba \\in (((a_c1a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c2a[2])[2])[a_e1a]))))))"
   by (rule zenon_all_0 [of "?z_hbi" "(CHOOSE zenon_Vba:(~((zenon_Vba \\in (((a_c1a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c2a[2])[2])[a_e1a])))))", OF z_Hbe])
   show FALSE
   proof (rule zenon_imply [OF z_Hbr])
    assume z_Hbs:"(~?z_hbp)"
    show FALSE
    by (rule notE [OF z_Hbs z_Hbp])
   next
    assume z_Hbo:"?z_hbo"
    show FALSE
    by (rule notE [OF z_Hbq z_Hbo])
   qed
  next
   assume z_Hbo:"?z_hbo"
   assume z_Hbs:"(~?z_hbp)"
   have z_Hbt: "?z_hbh((CHOOSE zenon_Vba:(~((zenon_Vba \\in (((a_c1a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c2a[2])[2])[a_e1a]))))))"
   by (rule zenon_all_0 [of "?z_hbh" "(CHOOSE zenon_Vba:(~((zenon_Vba \\in (((a_c1a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c2a[2])[2])[a_e1a])))))", OF z_Ha])
   show FALSE
   proof (rule zenon_imply [OF z_Hbt])
    assume z_Hbq:"(~?z_hbo)"
    show FALSE
    by (rule notE [OF z_Hbq z_Hbo])
   next
    assume z_Hbp:"?z_hbp"
    show FALSE
    by (rule notE [OF z_Hbs z_Hbp])
   qed
  qed
 qed
 assume z_Hj:"((((a_c1a[2])[2])[a_e1a])~=(((a_c2a[2])[2])[a_e1a]))" (is "?z_hq~=?z_hk")
 have z_Hbu_z_Hh: "bAll(?z_hk, (\<lambda>x. (x \\in ?z_hq))) == ?z_hh" (is "?z_hbu == _")
 by (unfold subset_def)
 have z_Hbu: "?z_hbu"
 by (unfold z_Hbu_z_Hh, fact z_Hh)
 have z_Hbe_z_Hbu: "(\\A x:((x \\in ?z_hk)=>(x \\in ?z_hq))) == ?z_hbu" (is "?z_hbe == _")
 by (unfold bAll_def)
 have z_Hbe: "?z_hbe" (is "\\A x : ?z_hbi(x)")
 by (unfold z_Hbe_z_Hbu, fact z_Hbu)
 have z_Hbw_z_Hi: "bAll(?z_hq, (\<lambda>x. (x \\in ?z_hk))) == ?z_hi" (is "?z_hbw == _")
 by (unfold subset_def)
 have z_Hbw: "?z_hbw"
 by (unfold z_Hbw_z_Hi, fact z_Hi)
 have z_Ha_z_Hbw: "(\\A x:((x \\in ?z_hq)=>(x \\in ?z_hk))) == ?z_hbw" (is "?z_ha == _")
 by (unfold bAll_def)
 have z_Ha: "?z_ha" (is "\\A x : ?z_hbh(x)")
 by (unfold z_Ha_z_Hbw, fact z_Hbw)
 have z_Hu: "(~(\\A zenon_Vba:((zenon_Vba \\in ?z_hq)<=>(zenon_Vba \\in ?z_hk))))" (is "~(\\A x : ?z_hbg(x))")
 by (rule zenon_notsetequal_0 [of "?z_hq" "?z_hk", OF z_Hj])
 show FALSE
 by (rule zenon_L1_ [OF z_Hu z_Ha z_Hbe])
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 425"; *} qed
lemma ob'437:
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
fixes a_c2a
assumes a_c2a_in : "(a_c2a \<in> (a_p2a))"
fixes a_c1a
assumes a_c1a_in : "(a_c1a \<in> (a_p1a))"
fixes a_c3a
assumes a_c3a_in : "(a_c3a \<in> (a_p2a))"
fixes a_e1a
assumes a_e1a_in : "(a_e1a \<in> (a_E1a))"
assumes v'81: "(((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))) \<subseteq> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a)))))"
assumes v'82: "(((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a)))))"
shows "(((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a)))))"(is "PROP ?ob'437")
proof -
ML_command {* writeln "*** TLAPS ENTER 437"; *}
show "PROP ?ob'437"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_e5eb80.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_e5eb80.znn.out
;; obligation #437
$hyp "a_p1a_in" (TLA.in a_p1a PoliciesSet)
$hyp "a_p2a_in" (TLA.in a_p2a PoliciesSet)
$hyp "a_c2a_in" (TLA.in a_c2a a_p2a)
$hyp "a_c1a_in" (TLA.in a_c1a a_p1a)
$hyp "a_c3a_in" (TLA.in a_c3a a_p2a)
$hyp "a_e1a_in" (TLA.in a_e1a a_E1a)
$hyp "v'81" (TLA.subseteq (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
$hyp "v'82" (TLA.subseteq (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
$goal (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Hh:"((((a_c2a[2])[2])[a_e1a]) \\subseteq (((a_c1a[2])[2])[a_e1a]))" (is "?z_hh")
 using v'81 by blast
 have z_Hi:"((((a_c1a[2])[2])[a_e1a]) \\subseteq (((a_c2a[2])[2])[a_e1a]))" (is "?z_hi")
 using v'82 by blast
 have zenon_L1_: "(~(\\A zenon_Vba:((zenon_Vba \\in (((a_c1a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c2a[2])[2])[a_e1a]))))) ==> (\\A x:((x \\in (((a_c1a[2])[2])[a_e1a]))=>(x \\in (((a_c2a[2])[2])[a_e1a])))) ==> (\\A x:((x \\in (((a_c2a[2])[2])[a_e1a]))=>(x \\in (((a_c1a[2])[2])[a_e1a])))) ==> FALSE" (is "?z_hu ==> ?z_ha ==> ?z_hbe ==> FALSE")
 proof -
  assume z_Hu:"?z_hu" (is "~(\\A x : ?z_hbg(x))")
  assume z_Ha:"?z_ha" (is "\\A x : ?z_hbh(x)")
  assume z_Hbe:"?z_hbe" (is "\\A x : ?z_hbi(x)")
  have z_Hbj: "(\\E zenon_Vba:(~((zenon_Vba \\in (((a_c1a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c2a[2])[2])[a_e1a])))))" (is "\\E x : ?z_hbl(x)")
  by (rule zenon_notallex_0 [of "?z_hbg", OF z_Hu])
  have z_Hbm: "?z_hbl((CHOOSE zenon_Vba:(~((zenon_Vba \\in (((a_c1a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c2a[2])[2])[a_e1a]))))))" (is "~(?z_hbo<=>?z_hbp)")
  by (rule zenon_ex_choose_0 [of "?z_hbl", OF z_Hbj])
  show FALSE
  proof (rule zenon_notequiv [OF z_Hbm])
   assume z_Hbq:"(~?z_hbo)"
   assume z_Hbp:"?z_hbp"
   have z_Hbr: "?z_hbi((CHOOSE zenon_Vba:(~((zenon_Vba \\in (((a_c1a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c2a[2])[2])[a_e1a]))))))"
   by (rule zenon_all_0 [of "?z_hbi" "(CHOOSE zenon_Vba:(~((zenon_Vba \\in (((a_c1a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c2a[2])[2])[a_e1a])))))", OF z_Hbe])
   show FALSE
   proof (rule zenon_imply [OF z_Hbr])
    assume z_Hbs:"(~?z_hbp)"
    show FALSE
    by (rule notE [OF z_Hbs z_Hbp])
   next
    assume z_Hbo:"?z_hbo"
    show FALSE
    by (rule notE [OF z_Hbq z_Hbo])
   qed
  next
   assume z_Hbo:"?z_hbo"
   assume z_Hbs:"(~?z_hbp)"
   have z_Hbt: "?z_hbh((CHOOSE zenon_Vba:(~((zenon_Vba \\in (((a_c1a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c2a[2])[2])[a_e1a]))))))"
   by (rule zenon_all_0 [of "?z_hbh" "(CHOOSE zenon_Vba:(~((zenon_Vba \\in (((a_c1a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c2a[2])[2])[a_e1a])))))", OF z_Ha])
   show FALSE
   proof (rule zenon_imply [OF z_Hbt])
    assume z_Hbq:"(~?z_hbo)"
    show FALSE
    by (rule notE [OF z_Hbq z_Hbo])
   next
    assume z_Hbp:"?z_hbp"
    show FALSE
    by (rule notE [OF z_Hbs z_Hbp])
   qed
  qed
 qed
 assume z_Hj:"((((a_c1a[2])[2])[a_e1a])~=(((a_c2a[2])[2])[a_e1a]))" (is "?z_hq~=?z_hk")
 have z_Hbu_z_Hh: "bAll(?z_hk, (\<lambda>x. (x \\in ?z_hq))) == ?z_hh" (is "?z_hbu == _")
 by (unfold subset_def)
 have z_Hbu: "?z_hbu"
 by (unfold z_Hbu_z_Hh, fact z_Hh)
 have z_Hbe_z_Hbu: "(\\A x:((x \\in ?z_hk)=>(x \\in ?z_hq))) == ?z_hbu" (is "?z_hbe == _")
 by (unfold bAll_def)
 have z_Hbe: "?z_hbe" (is "\\A x : ?z_hbi(x)")
 by (unfold z_Hbe_z_Hbu, fact z_Hbu)
 have z_Hbw_z_Hi: "bAll(?z_hq, (\<lambda>x. (x \\in ?z_hk))) == ?z_hi" (is "?z_hbw == _")
 by (unfold subset_def)
 have z_Hbw: "?z_hbw"
 by (unfold z_Hbw_z_Hi, fact z_Hi)
 have z_Ha_z_Hbw: "(\\A x:((x \\in ?z_hq)=>(x \\in ?z_hk))) == ?z_hbw" (is "?z_ha == _")
 by (unfold bAll_def)
 have z_Ha: "?z_ha" (is "\\A x : ?z_hbh(x)")
 by (unfold z_Ha_z_Hbw, fact z_Hbw)
 have z_Hu: "(~(\\A zenon_Vba:((zenon_Vba \\in ?z_hq)<=>(zenon_Vba \\in ?z_hk))))" (is "~(\\A x : ?z_hbg(x))")
 by (rule zenon_notsetequal_0 [of "?z_hq" "?z_hk", OF z_Hj])
 show FALSE
 by (rule zenon_L1_ [OF z_Hu z_Ha z_Hbe])
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 437"; *} qed
lemma ob'462:
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
fixes a_c2a
assumes a_c2a_in : "(a_c2a \<in> (a_p2a))"
fixes a_c1a
assumes a_c1a_in : "(a_c1a \<in> (a_p1a))"
fixes a_c3a
assumes a_c3a_in : "(a_c3a \<in> (a_p2a))"
fixes a_e1a
assumes a_e1a_in : "(a_e1a \<in> (a_E1a))"
assumes v'80: "(((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))) \<subseteq> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a)))))"
assumes v'81: "(((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a)))))"
assumes v'82: "(((NONE) \<notin> (UU)))"
assumes v'83: "(((UU) = ({(''x'')})))"
shows "(((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a)))))"(is "PROP ?ob'462")
proof -
ML_command {* writeln "*** TLAPS ENTER 462"; *}
show "PROP ?ob'462"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_61bbe8.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_61bbe8.znn.out
;; obligation #462
$hyp "a_p1a_in" (TLA.in a_p1a PoliciesSet)
$hyp "a_p2a_in" (TLA.in a_p2a PoliciesSet)
$hyp "a_c2a_in" (TLA.in a_c2a a_p2a)
$hyp "a_c1a_in" (TLA.in a_c1a a_p1a)
$hyp "a_c3a_in" (TLA.in a_c3a a_p2a)
$hyp "a_e1a_in" (TLA.in a_e1a a_E1a)
$hyp "v'80" (TLA.subseteq (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
$hyp "v'81" (TLA.subseteq (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
$hyp "v'82" (-. (TLA.in NONE UU))
$hyp "v'83" (= UU
(TLA.set "x"))
$goal (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Hh:"((((a_c2a[2])[2])[a_e1a]) \\subseteq (((a_c1a[2])[2])[a_e1a]))" (is "?z_hh")
 using v'80 by blast
 have z_Hi:"((((a_c1a[2])[2])[a_e1a]) \\subseteq (((a_c2a[2])[2])[a_e1a]))" (is "?z_hi")
 using v'81 by blast
 have zenon_L1_: "(~(\\A zenon_Vda:((zenon_Vda \\in (((a_c1a[2])[2])[a_e1a]))<=>(zenon_Vda \\in (((a_c2a[2])[2])[a_e1a]))))) ==> (\\A x:((x \\in (((a_c1a[2])[2])[a_e1a]))=>(x \\in (((a_c2a[2])[2])[a_e1a])))) ==> (\\A x:((x \\in (((a_c2a[2])[2])[a_e1a]))=>(x \\in (((a_c1a[2])[2])[a_e1a])))) ==> FALSE" (is "?z_hw ==> ?z_ha ==> ?z_hbg ==> FALSE")
 proof -
  assume z_Hw:"?z_hw" (is "~(\\A x : ?z_hbi(x))")
  assume z_Ha:"?z_ha" (is "\\A x : ?z_hbj(x)")
  assume z_Hbg:"?z_hbg" (is "\\A x : ?z_hbk(x)")
  have z_Hbl: "(\\E zenon_Vda:(~((zenon_Vda \\in (((a_c1a[2])[2])[a_e1a]))<=>(zenon_Vda \\in (((a_c2a[2])[2])[a_e1a])))))" (is "\\E x : ?z_hbn(x)")
  by (rule zenon_notallex_0 [of "?z_hbi", OF z_Hw])
  have z_Hbo: "?z_hbn((CHOOSE zenon_Vda:(~((zenon_Vda \\in (((a_c1a[2])[2])[a_e1a]))<=>(zenon_Vda \\in (((a_c2a[2])[2])[a_e1a]))))))" (is "~(?z_hbq<=>?z_hbr)")
  by (rule zenon_ex_choose_0 [of "?z_hbn", OF z_Hbl])
  show FALSE
  proof (rule zenon_notequiv [OF z_Hbo])
   assume z_Hbs:"(~?z_hbq)"
   assume z_Hbr:"?z_hbr"
   have z_Hbt: "?z_hbk((CHOOSE zenon_Vda:(~((zenon_Vda \\in (((a_c1a[2])[2])[a_e1a]))<=>(zenon_Vda \\in (((a_c2a[2])[2])[a_e1a]))))))"
   by (rule zenon_all_0 [of "?z_hbk" "(CHOOSE zenon_Vda:(~((zenon_Vda \\in (((a_c1a[2])[2])[a_e1a]))<=>(zenon_Vda \\in (((a_c2a[2])[2])[a_e1a])))))", OF z_Hbg])
   show FALSE
   proof (rule zenon_imply [OF z_Hbt])
    assume z_Hbu:"(~?z_hbr)"
    show FALSE
    by (rule notE [OF z_Hbu z_Hbr])
   next
    assume z_Hbq:"?z_hbq"
    show FALSE
    by (rule notE [OF z_Hbs z_Hbq])
   qed
  next
   assume z_Hbq:"?z_hbq"
   assume z_Hbu:"(~?z_hbr)"
   have z_Hbv: "?z_hbj((CHOOSE zenon_Vda:(~((zenon_Vda \\in (((a_c1a[2])[2])[a_e1a]))<=>(zenon_Vda \\in (((a_c2a[2])[2])[a_e1a]))))))"
   by (rule zenon_all_0 [of "?z_hbj" "(CHOOSE zenon_Vda:(~((zenon_Vda \\in (((a_c1a[2])[2])[a_e1a]))<=>(zenon_Vda \\in (((a_c2a[2])[2])[a_e1a])))))", OF z_Ha])
   show FALSE
   proof (rule zenon_imply [OF z_Hbv])
    assume z_Hbs:"(~?z_hbq)"
    show FALSE
    by (rule notE [OF z_Hbs z_Hbq])
   next
    assume z_Hbr:"?z_hbr"
    show FALSE
    by (rule notE [OF z_Hbu z_Hbr])
   qed
  qed
 qed
 assume z_Hl:"((((a_c1a[2])[2])[a_e1a])~=(((a_c2a[2])[2])[a_e1a]))" (is "?z_hs~=?z_hm")
 have z_Hbw_z_Hh: "bAll(?z_hm, (\<lambda>x. (x \\in ?z_hs))) == ?z_hh" (is "?z_hbw == _")
 by (unfold subset_def)
 have z_Hbw: "?z_hbw"
 by (unfold z_Hbw_z_Hh, fact z_Hh)
 have z_Hbg_z_Hbw: "(\\A x:((x \\in ?z_hm)=>(x \\in ?z_hs))) == ?z_hbw" (is "?z_hbg == _")
 by (unfold bAll_def)
 have z_Hbg: "?z_hbg" (is "\\A x : ?z_hbk(x)")
 by (unfold z_Hbg_z_Hbw, fact z_Hbw)
 have z_Hby_z_Hi: "bAll(?z_hs, (\<lambda>x. (x \\in ?z_hm))) == ?z_hi" (is "?z_hby == _")
 by (unfold subset_def)
 have z_Hby: "?z_hby"
 by (unfold z_Hby_z_Hi, fact z_Hi)
 have z_Ha_z_Hby: "(\\A x:((x \\in ?z_hs)=>(x \\in ?z_hm))) == ?z_hby" (is "?z_ha == _")
 by (unfold bAll_def)
 have z_Ha: "?z_ha" (is "\\A x : ?z_hbj(x)")
 by (unfold z_Ha_z_Hby, fact z_Hby)
 have z_Hw: "(~(\\A zenon_Vda:((zenon_Vda \\in ?z_hs)<=>(zenon_Vda \\in ?z_hm))))" (is "~(\\A x : ?z_hbi(x))")
 by (rule zenon_notsetequal_0 [of "?z_hs" "?z_hm", OF z_Hl])
 show FALSE
 by (rule zenon_L1_ [OF z_Hw z_Ha z_Hbg])
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 462"; *} qed
lemma ob'515:
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
fixes a_c1a
assumes a_c1a_in : "(a_c1a \<in> (a_p1a))"
assumes v'49: "(((\<forall> a_c2a \<in> (a_p2a) : (\<exists> a_c1a_1 \<in> (a_p1a) : ((((((fapply ((a_c1a_1), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a_1), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))))) \<and> (\<forall> a_c2a \<in> (a_p1a) : (\<exists> a_c1a_1 \<in> (a_p2a) : ((((((fapply ((a_c1a_1), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a_1), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))))))"
shows "(\<exists> a_c2a \<in> (a_p2a) : ((((((fapply ((a_c2a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c2a), ((Succ[0])))) = (fapply ((a_c1a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c1a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))))"(is "PROP ?ob'515")
proof -
ML_command {* writeln "*** TLAPS ENTER 515"; *}
show "PROP ?ob'515"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_4b948b.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_4b948b.znn.out
;; obligation #515
$hyp "a_p1a_in" (TLA.in a_p1a PoliciesSet)
$hyp "a_p2a_in" (TLA.in a_p2a PoliciesSet)
$hyp "a_c1a_in" (TLA.in a_c1a a_p1a)
$hyp "v'49" (/\ (TLA.bAll a_p2a ((a_c2a) (TLA.bEx a_p1a ((a_c1a_1) (/\ (\/ (TLA.in (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))))))
(TLA.bAll a_p1a ((a_c2a) (TLA.bEx a_p2a ((a_c1a_1) (/\ (\/ (TLA.in (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)))))))))))
$goal (TLA.bEx a_p2a ((a_c2a) (/\ (\/ (TLA.in (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Hd:"(bAll(a_p2a, (\<lambda>a_c2a. bEx(a_p1a, (\<lambda>a_c1a_1. ((((a_c1a_1[1]) \\in UU)|((a_c1a_1[1])=(a_c2a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a_1[2])[1])[k])=(((a_c2a[2])[1])[k]))|((((a_c2a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a_1[2])[2])[e])={NONE})|(cond((((((a_c1a_1[2])[2])[e]) \\cap UU)~={}), (((((a_c1a_1[2])[2])[e]) \\ UU) \\cup {(a_c2a[1])}), (((a_c1a_1[2])[2])[e])) \\subseteq (((a_c2a[2])[2])[e])))))))))))&bAll(a_p1a, (\<lambda>a_c2a. bEx(a_p2a, (\<lambda>a_c1a_1. ((((a_c1a_1[1]) \\in UU)|((a_c1a_1[1])=(a_c2a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a_1[2])[1])[k])=(((a_c2a[2])[1])[k]))|((((a_c2a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a_1[2])[2])[e])={NONE})|(cond((((((a_c1a_1[2])[2])[e]) \\cap UU)~={}), (((((a_c1a_1[2])[2])[e]) \\ UU) \\cup {(a_c2a[1])}), (((a_c1a_1[2])[2])[e])) \\subseteq (((a_c2a[2])[2])[e]))))))))))))" (is "?z_hf&?z_hce")
 using v'49 by blast
 have z_Hc:"(a_c1a \\in a_p1a)" (is "?z_hc")
 using a_c1a_in by blast
 assume z_He:"(~bEx(a_p2a, (\<lambda>a_c2a. ((((a_c2a[1]) \\in UU)|((a_c2a[1])=(a_c1a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c2a[2])[1])[k])=(((a_c1a[2])[1])[k]))|((((a_c1a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c2a[2])[2])[e])={NONE})|(cond((((((a_c2a[2])[2])[e]) \\cap UU)~={}), (((((a_c2a[2])[2])[e]) \\ UU) \\cup {(a_c1a[1])}), (((a_c2a[2])[2])[e])) \\subseteq (((a_c1a[2])[2])[e]))))))))))" (is "~?z_hci")
 have z_Hce: "?z_hce"
 by (rule zenon_and_1 [OF z_Hd])
 have z_Hdl_z_Hce: "(\\A x:((x \\in a_p1a)=>bEx(a_p2a, (\<lambda>a_c1a_1. ((((a_c1a_1[1]) \\in UU)|((a_c1a_1[1])=(x[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a_1[2])[1])[k])=(((x[2])[1])[k]))|((((x[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a_1[2])[2])[e])={NONE})|(cond((((((a_c1a_1[2])[2])[e]) \\cap UU)~={}), (((((a_c1a_1[2])[2])[e]) \\ UU) \\cup {(x[1])}), (((a_c1a_1[2])[2])[e])) \\subseteq (((x[2])[2])[e]))))))))))) == ?z_hce" (is "?z_hdl == _")
 by (unfold bAll_def)
 have z_Hdl: "?z_hdl" (is "\\A x : ?z_hen(x)")
 by (unfold z_Hdl_z_Hce, fact z_Hce)
 have z_Heo: "?z_hen(a_c1a)"
 by (rule zenon_all_0 [of "?z_hen" "a_c1a", OF z_Hdl])
 show FALSE
 proof (rule zenon_imply [OF z_Heo])
  assume z_Hep:"(~?z_hc)"
  show FALSE
  by (rule notE [OF z_Hep z_Hc])
 next
  assume z_Hci:"?z_hci"
  show FALSE
  by (rule notE [OF z_He z_Hci])
 qed
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 515"; *} qed
lemma ob'517:
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
fixes a_c1a
assumes a_c1a_in : "(a_c1a \<in> (a_p1a))"
fixes a_c2a
assumes a_c2a_in : "(a_c2a \<in> (a_p2a))"
assumes v'54: "(((\<forall> a_c2a_1 \<in> (a_p2a) : (\<exists> a_c1a_1 \<in> (a_p1a) : ((((((fapply ((a_c1a_1), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a_1), ((Succ[0])))) = (fapply ((a_c2a_1), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a_1), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e)))))))))) \<and> (\<forall> a_c2a_1 \<in> (a_p1a) : (\<exists> a_c1a_1 \<in> (a_p2a) : ((((((fapply ((a_c1a_1), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a_1), ((Succ[0])))) = (fapply ((a_c2a_1), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a_1), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))))))"
shows "(\<exists> a_c3a \<in> (a_p1a) : (((((((fapply ((a_c3a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c3a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c3a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c3a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c3a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c3a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c3a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))))"(is "PROP ?ob'517")
proof -
ML_command {* writeln "*** TLAPS ENTER 517"; *}
show "PROP ?ob'517"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_93526e.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_93526e.znn.out
;; obligation #517
$hyp "a_p1a_in" (TLA.in a_p1a PoliciesSet)
$hyp "a_p2a_in" (TLA.in a_p2a PoliciesSet)
$hyp "a_c1a_in" (TLA.in a_c1a a_p1a)
$hyp "a_c2a_in" (TLA.in a_c2a a_p2a)
$hyp "v'54" (/\ (TLA.bAll a_p2a ((a_c2a_1) (TLA.bEx a_p1a ((a_c1a_1) (/\ (\/ (TLA.in (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))))))
(TLA.bAll a_p1a ((a_c2a_1) (TLA.bEx a_p2a ((a_c1a_1) (/\ (\/ (TLA.in (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)))))))))))
$goal (TLA.bEx a_p1a ((a_c3a) (/\ (/\ (\/ (TLA.in (TLA.fapply a_c3a (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c3a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c3a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c3a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c3a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c3a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c3a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)))))))))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_He:"(bAll(a_p2a, (\<lambda>a_c2a_1. bEx(a_p1a, (\<lambda>a_c1a_1. ((((a_c1a_1[1]) \\in UU)|((a_c1a_1[1])=(a_c2a_1[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a_1[2])[1])[k])=(((a_c2a_1[2])[1])[k]))|((((a_c2a_1[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a_1[2])[2])[e])={NONE})|(cond((((((a_c1a_1[2])[2])[e]) \\cap UU)~={}), (((((a_c1a_1[2])[2])[e]) \\ UU) \\cup {(a_c2a_1[1])}), (((a_c1a_1[2])[2])[e])) \\subseteq (((a_c2a_1[2])[2])[e])))))))))))&bAll(a_p1a, (\<lambda>a_c2a_1. bEx(a_p2a, (\<lambda>a_c1a_1. ((((a_c1a_1[1]) \\in UU)|((a_c1a_1[1])=(a_c2a_1[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a_1[2])[1])[k])=(((a_c2a_1[2])[1])[k]))|((((a_c2a_1[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a_1[2])[2])[e])={NONE})|(cond((((((a_c1a_1[2])[2])[e]) \\cap UU)~={}), (((((a_c1a_1[2])[2])[e]) \\ UU) \\cup {(a_c2a_1[1])}), (((a_c1a_1[2])[2])[e])) \\subseteq (((a_c2a_1[2])[2])[e]))))))))))))" (is "?z_hg&?z_hcf")
 using v'54 by blast
 have z_Hd:"(a_c2a \\in a_p2a)" (is "?z_hd")
 using a_c2a_in by blast
 assume z_Hf:"(~bEx(a_p1a, (\<lambda>a_c3a. ((((a_c3a[1]) \\in UU)|((a_c3a[1])=(a_c2a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c3a[2])[1])[k])=(((a_c2a[2])[1])[k]))|((((a_c2a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c3a[2])[2])[e])={NONE})|(cond((((((a_c3a[2])[2])[e]) \\cap UU)~={}), (((((a_c3a[2])[2])[e]) \\ UU) \\cup {(a_c2a[1])}), (((a_c3a[2])[2])[e])) \\subseteq (((a_c2a[2])[2])[e]))))))))))" (is "~?z_hcj")
 have z_Hg: "?z_hg"
 by (rule zenon_and_0 [OF z_He])
 have z_Hdt_z_Hg: "(\\A x:((x \\in a_p2a)=>bEx(a_p1a, (\<lambda>a_c1a_1. ((((a_c1a_1[1]) \\in UU)|((a_c1a_1[1])=(x[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a_1[2])[1])[k])=(((x[2])[1])[k]))|((((x[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a_1[2])[2])[e])={NONE})|(cond((((((a_c1a_1[2])[2])[e]) \\cap UU)~={}), (((((a_c1a_1[2])[2])[e]) \\ UU) \\cup {(x[1])}), (((a_c1a_1[2])[2])[e])) \\subseteq (((x[2])[2])[e]))))))))))) == ?z_hg" (is "?z_hdt == _")
 by (unfold bAll_def)
 have z_Hdt: "?z_hdt" (is "\\A x : ?z_hev(x)")
 by (unfold z_Hdt_z_Hg, fact z_Hg)
 have z_Hew: "?z_hev(a_c2a)"
 by (rule zenon_all_0 [of "?z_hev" "a_c2a", OF z_Hdt])
 show FALSE
 proof (rule zenon_imply [OF z_Hew])
  assume z_Hex:"(~?z_hd)"
  show FALSE
  by (rule notE [OF z_Hex z_Hd])
 next
  assume z_Hcj:"?z_hcj"
  show FALSE
  by (rule notE [OF z_Hf z_Hcj])
 qed
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 517"; *} qed
lemma ob'572:
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
fixes a_c1a
assumes a_c1a_in : "(a_c1a \<in> (a_p1a))"
fixes a_c2a
assumes a_c2a_in : "(a_c2a \<in> (a_p2a))"
fixes a_c3a
assumes a_c3a_in : "(a_c3a \<in> (a_p1a))"
fixes e
assumes e_in : "(e \<in> (a_E1a))"
assumes v'80: "(((a_c3a) \<in> (ClausesSet)))"
assumes v'81: "(\<forall> a_ca \<in> (ClausesSet) : (((fapply ((fapply ((a_ca), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))) \<in> ([(a_E1a) \<rightarrow> ((((((SUBSET (((U) \<union> (UU))))) \\ ({({})}))) \<union> ({({(NONE)})})))]))))"
shows "(((fapply ((fapply ((fapply ((a_c3a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<noteq> ({})))"(is "PROP ?ob'572")
proof -
ML_command {* writeln "*** TLAPS ENTER 572"; *}
show "PROP ?ob'572"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_1c57a2.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_1c57a2.znn.out
;; obligation #572
$hyp "a_p1a_in" (TLA.in a_p1a PoliciesSet)
$hyp "a_p2a_in" (TLA.in a_p2a PoliciesSet)
$hyp "a_c1a_in" (TLA.in a_c1a a_p1a)
$hyp "a_c2a_in" (TLA.in a_c2a a_p2a)
$hyp "a_c3a_in" (TLA.in a_c3a a_p1a)
$hyp "e_in" (TLA.in e a_E1a)
$hyp "v'80" (TLA.in a_c3a
ClausesSet)
$hyp "v'81" (TLA.bAll ClausesSet ((a_ca) (TLA.in (TLA.fapply (TLA.fapply a_ca (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0)))
(TLA.FuncSet a_E1a (TLA.cup (TLA.setminus (TLA.SUBSET (TLA.cup U UU))
(TLA.set TLA.emptyset))
(TLA.set (TLA.set NONE)))))))
$goal (-. (= (TLA.fapply (TLA.fapply (TLA.fapply a_c3a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
TLA.emptyset))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Hf:"(e \\in a_E1a)" (is "?z_hf")
 using e_in by blast
 have z_Hg:"(a_c3a \\in ClausesSet)" (is "?z_hg")
 using v'80 by blast
 have z_Hh:"bAll(ClausesSet, (\<lambda>a_ca. (((a_ca[2])[2]) \\in FuncSet(a_E1a, ((SUBSET((U \\cup UU)) \\ {{}}) \\cup {{NONE}})))))" (is "?z_hh")
 using v'81 by blast
 have zenon_L1_: "((((a_c3a[2])[2])[e]) \\in (SUBSET((U \\cup UU)) \\ {{}})) ==> ((((a_c3a[2])[2])[e])={}) ==> FALSE" (is "?z_hbf ==> ?z_hbj ==> FALSE")
 proof -
  assume z_Hbf:"?z_hbf"
  assume z_Hbj:"?z_hbj" (is "?z_hbg=_")
  have z_Hbk: "(~(?z_hbg \\in {{}}))" (is "~?z_hbl")
  by (rule zenon_in_setminus_1 [of "?z_hbg" "SUBSET((U \\cup UU))" "{{}}", OF z_Hbf])
  have z_Hbm: "(?z_hbg~={})"
  by (rule zenon_notin_addElt_0 [of "?z_hbg" "{}" "{}", OF z_Hbk])
  show FALSE
  by (rule notE [OF z_Hbm z_Hbj])
 qed
 have zenon_L2_: "(~(NONE \\in {NONE})) ==> FALSE" (is "?z_hbo ==> FALSE")
 proof -
  assume z_Hbo:"?z_hbo" (is "~?z_hbp")
  have z_Hbq: "(NONE~=NONE)"
  by (rule zenon_notin_addElt_0 [of "NONE" "NONE" "{}", OF z_Hbo])
  show FALSE
  by (rule zenon_noteq [OF z_Hbq])
 qed
 assume z_Hi:"(~((((a_c3a[2])[2])[e])~={}))" (is "~~?z_hbj")
 have z_Hbj: "?z_hbj" (is "?z_hbg=_")
 by (rule zenon_notnot_0 [OF z_Hi])
 have z_Hbr: "(((a_c3a[2])[2]) \\in FuncSet(a_E1a, ((SUBSET((U \\cup UU)) \\ {{}}) \\cup {{NONE}})))" (is "?z_hbr")
 by (rule zenon_all_in_0 [of "ClausesSet" "(\<lambda>a_ca. (((a_ca[2])[2]) \\in FuncSet(a_E1a, ((SUBSET((U \\cup UU)) \\ {{}}) \\cup {{NONE}}))))", OF z_Hh z_Hg])
 have z_Hbs: "(\\A zenon_Vna:((zenon_Vna \\in a_E1a)=>((((a_c3a[2])[2])[zenon_Vna]) \\in ((SUBSET((U \\cup UU)) \\ {{}}) \\cup {{NONE}}))))" (is "\\A x : ?z_hby(x)")
 by (rule zenon_in_funcset_2 [of "((a_c3a[2])[2])" "a_E1a" "((SUBSET((U \\cup UU)) \\ {{}}) \\cup {{NONE}})", OF z_Hbr])
 have z_Hbz: "?z_hby(e)" (is "_=>?z_hca")
 by (rule zenon_all_0 [of "?z_hby" "e", OF z_Hbs])
 show FALSE
 proof (rule zenon_imply [OF z_Hbz])
  assume z_Hcb:"(~?z_hf)"
  show FALSE
  by (rule notE [OF z_Hcb z_Hf])
 next
  assume z_Hca:"?z_hca"
  show FALSE
  proof (rule zenon_in_cup [of "?z_hbg" "(SUBSET((U \\cup UU)) \\ {{}})" "{{NONE}}", OF z_Hca])
   assume z_Hbf:"(?z_hbg \\in (SUBSET((U \\cup UU)) \\ {{}}))" (is "?z_hbf")
   show FALSE
   by (rule zenon_L1_ [OF z_Hbf z_Hbj])
  next
   assume z_Hcc:"(?z_hbg \\in {{NONE}})" (is "?z_hcc")
   show FALSE
   proof (rule zenon_in_addElt [of "?z_hbg" "{NONE}" "{}", OF z_Hcc])
    assume z_Hcd:"(?z_hbg={NONE})" (is "_=?z_hbd")
    have z_Hce: "(\\A zenon_Vhob:((zenon_Vhob \\in ?z_hbg)<=>(zenon_Vhob \\in ?z_hbd)))" (is "\\A x : ?z_hcj(x)")
    by (rule zenon_setequal_0 [of "?z_hbg" "?z_hbd", OF z_Hcd])
    have z_Hck: "?z_hcj(NONE)" (is "?z_hcl<=>?z_hbp")
    by (rule zenon_all_0 [of "?z_hcj" "NONE", OF z_Hce])
    show FALSE
    proof (rule zenon_equiv [OF z_Hck])
     assume z_Hcm:"(~?z_hcl)"
     assume z_Hbo:"(~?z_hbp)"
     show FALSE
     by (rule zenon_L2_ [OF z_Hbo])
    next
     assume z_Hcl:"?z_hcl"
     assume z_Hbp:"?z_hbp"
     have z_Hcn: "(NONE \\in {})" (is "?z_hcn")
     by (rule subst [where P="(\<lambda>zenon_Vnjf. (NONE \\in zenon_Vnjf))", OF z_Hbj z_Hcl])
     show FALSE
     by (rule zenon_in_emptyset [of "NONE", OF z_Hcn])
    qed
   next
    assume z_Hcr:"(?z_hbg \\in {})" (is "?z_hcr")
    show FALSE
    by (rule zenon_in_emptyset [of "?z_hbg", OF z_Hcr])
   qed
  qed
 qed
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 572"; *} qed
lemma ob'661:
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
fixes a_c1a
assumes a_c1a_in : "(a_c1a \<in> (a_p1a))"
fixes a_c2a
assumes a_c2a_in : "(a_c2a \<in> (a_p2a))"
fixes a_c3a
assumes a_c3a_in : "(a_c3a \<in> (a_p1a))"
assumes v'64: "((((((fapply ((a_c2a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c2a), ((Succ[0])))) = (fapply ((a_c1a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c1a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))"
assumes v'65: "((((((fapply ((a_c3a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c3a), ((Succ[0])))) = (fapply ((a_c2a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c3a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c3a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | (((cond((((((fapply ((fapply ((fapply ((a_c3a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \<inter> (UU))) \<noteq> ({}))), (((((fapply ((fapply ((fapply ((a_c3a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) \\ (UU))) \<union> ({(fapply ((a_c2a), ((Succ[0]))))}))), (fapply ((fapply ((fapply ((a_c3a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))"
assumes v'66: "(((a_c3a) = (a_c1a)))"
shows "(\<forall> a_e0a \<in> (a_E0a) : (((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (a_e0a))) = (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (a_e0a))))))"(is "PROP ?ob'661")
proof -
ML_command {* writeln "*** TLAPS ENTER 661"; *}
show "PROP ?ob'661"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_ede407.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_ede407.znn.out
;; obligation #661
$hyp "a_p1a_in" (TLA.in a_p1a PoliciesSet)
$hyp "a_p2a_in" (TLA.in a_p2a PoliciesSet)
$hyp "a_c1a_in" (TLA.in a_c1a a_p1a)
$hyp "a_c2a_in" (TLA.in a_c2a a_p2a)
$hyp "a_c3a_in" (TLA.in a_c3a a_p1a)
$hyp "v'64" (/\ (\/ (TLA.in (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)) UU)
(= (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))
$hyp "v'65" (/\ (\/ (TLA.in (TLA.fapply a_c3a (TLA.fapply TLA.Succ 0)) UU)
(= (TLA.fapply a_c3a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c3a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c3a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE))
(TLA.subseteq (TLA.cond (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c3a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
TLA.emptyset)) (TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c3a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
UU)
(TLA.set (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)))) (TLA.fapply (TLA.fapply (TLA.fapply a_c3a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))
$hyp "v'66" (= a_c3a
a_c1a)
$goal (TLA.bAll a_E0a ((a_e0a) (= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) a_e0a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) a_e0a))))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Hf:"((((a_c2a[1]) \\in UU)|((a_c2a[1])=(a_c1a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c2a[2])[1])[k])=(((a_c1a[2])[1])[k]))|((((a_c1a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c2a[2])[2])[e])={NONE})|(cond((((((a_c2a[2])[2])[e]) \\cap UU)~={}), (((((a_c2a[2])[2])[e]) \\ UU) \\cup {(a_c1a[1])}), (((a_c2a[2])[2])[e])) \\subseteq (((a_c1a[2])[2])[e])))))))" (is "?z_hj&?z_hs")
 using v'64 by blast
 have z_Hh:"(a_c3a=a_c1a)"
 using v'66 by blast
 have z_Hg:"((((a_c3a[1]) \\in UU)|((a_c3a[1])=(a_c2a[1])))&(bAll(a_E0a, (\<lambda>k. (((((a_c3a[2])[1])[k])=(((a_c2a[2])[1])[k]))|((((a_c2a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c3a[2])[2])[e])={NONE})|(cond((((((a_c3a[2])[2])[e]) \\cap UU)~={}), (((((a_c3a[2])[2])[e]) \\ UU) \\cup {(a_c2a[1])}), (((a_c3a[2])[2])[e])) \\subseteq (((a_c2a[2])[2])[e])))))))" (is "?z_hcc&?z_hcg")
 using v'65 by blast
 have zenon_L1_: "(a_c3a=a_c1a) ==> ((((a_c3a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>((((a_c2a[2])[1])[x])=(((a_c1a[2])[1])[x])))))])=(((a_c2a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>((((a_c2a[2])[1])[x])=(((a_c1a[2])[1])[x])))))])) ==> ((((a_c2a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>((((a_c2a[2])[1])[x])=(((a_c1a[2])[1])[x])))))])~=(((a_c1a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>((((a_c2a[2])[1])[x])=(((a_c1a[2])[1])[x])))))])) ==> FALSE" (is "?z_hh ==> ?z_hdc ==> ?z_hdn ==> FALSE")
 proof -
  assume z_Hh:"?z_hh"
  assume z_Hdc:"?z_hdc" (is "?z_hdd=?z_hdm")
  assume z_Hdn:"?z_hdn" (is "_~=?z_hdo")
  have z_Hdp: "(?z_hdo=?z_hdm)"
  by (rule subst [where P="(\<lambda>zenon_Veta. ((((zenon_Veta[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>((((a_c2a[2])[1])[x])=(((a_c1a[2])[1])[x])))))])=?z_hdm))", OF z_Hh z_Hdc])
  show FALSE
  by (rule zenon_eqsym [OF z_Hdp z_Hdn])
 qed
 assume z_Hi:"(~bAll(a_E0a, (\<lambda>a_e0a. ((((a_c2a[2])[1])[a_e0a])=(((a_c1a[2])[1])[a_e0a])))))" (is "~?z_hdw")
 have z_Hs: "?z_hs" (is "?z_ht&?z_hbi")
 by (rule zenon_and_1 [OF z_Hf])
 have z_Ht: "?z_ht"
 by (rule zenon_and_0 [OF z_Hs])
 have z_Hec_z_Ht: "(\\A x:((x \\in a_E0a)=>(((((a_c2a[2])[1])[x])=(((a_c1a[2])[1])[x]))|((((a_c1a[2])[1])[x])={})))) == ?z_ht" (is "?z_hec == _")
 by (unfold bAll_def)
 have z_Hec: "?z_hec" (is "\\A x : ?z_heg(x)")
 by (unfold z_Hec_z_Ht, fact z_Ht)
 have z_Hcg: "?z_hcg" (is "?z_hch&?z_hcp")
 by (rule zenon_and_1 [OF z_Hg])
 have z_Hch: "?z_hch"
 by (rule zenon_and_0 [OF z_Hcg])
 have z_Heh_z_Hch: "(\\A x:((x \\in a_E0a)=>(((((a_c3a[2])[1])[x])=(((a_c2a[2])[1])[x]))|((((a_c2a[2])[1])[x])={})))) == ?z_hch" (is "?z_heh == _")
 by (unfold bAll_def)
 have z_Heh: "?z_heh" (is "\\A x : ?z_hen(x)")
 by (unfold z_Heh_z_Hch, fact z_Hch)
 have z_Heo_z_Hi: "(~(\\A x:((x \\in a_E0a)=>((((a_c2a[2])[1])[x])=(((a_c1a[2])[1])[x]))))) == (~?z_hdw)" (is "?z_heo == ?z_hi")
 by (unfold bAll_def)
 have z_Heo: "?z_heo" (is "~(\\A x : ?z_heq(x))")
 by (unfold z_Heo_z_Hi, fact z_Hi)
 have z_Her: "(\\E x:(~((x \\in a_E0a)=>((((a_c2a[2])[1])[x])=(((a_c1a[2])[1])[x])))))" (is "\\E x : ?z_hes(x)")
 by (rule zenon_notallex_0 [of "?z_heq", OF z_Heo])
 have z_Het: "?z_hes((CHOOSE x:(~((x \\in a_E0a)=>((((a_c2a[2])[1])[x])=(((a_c1a[2])[1])[x]))))))" (is "~(?z_heu=>?z_hev)")
 by (rule zenon_ex_choose_0 [of "?z_hes", OF z_Her])
 have z_Heu: "?z_heu"
 by (rule zenon_notimply_0 [OF z_Het])
 have z_Hdn: "((((a_c2a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>((((a_c2a[2])[1])[x])=(((a_c1a[2])[1])[x])))))])~=(((a_c1a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>((((a_c2a[2])[1])[x])=(((a_c1a[2])[1])[x])))))]))" (is "?z_hdm~=?z_hdo")
 by (rule zenon_notimply_1 [OF z_Het])
 have z_Hew: "?z_hen((CHOOSE x:(~((x \\in a_E0a)=>((((a_c2a[2])[1])[x])=(((a_c1a[2])[1])[x]))))))" (is "_=>?z_hex")
 by (rule zenon_all_0 [of "?z_hen" "(CHOOSE x:(~((x \\in a_E0a)=>((((a_c2a[2])[1])[x])=(((a_c1a[2])[1])[x])))))", OF z_Heh])
 show FALSE
 proof (rule zenon_imply [OF z_Hew])
  assume z_Hey:"(~?z_heu)"
  show FALSE
  by (rule notE [OF z_Hey z_Heu])
 next
  assume z_Hex:"?z_hex" (is "?z_hdc|?z_hez")
  show FALSE
  proof (rule zenon_or [OF z_Hex])
   assume z_Hdc:"?z_hdc" (is "?z_hdd=_")
   show FALSE
   by (rule zenon_L1_ [OF z_Hh z_Hdc z_Hdn])
  next
   assume z_Hez:"?z_hez"
   have z_Hfa: "?z_heg((CHOOSE x:(~((x \\in a_E0a)=>((((a_c2a[2])[1])[x])=(((a_c1a[2])[1])[x]))))))" (is "_=>?z_hfb")
   by (rule zenon_all_0 [of "?z_heg" "(CHOOSE x:(~((x \\in a_E0a)=>((((a_c2a[2])[1])[x])=(((a_c1a[2])[1])[x])))))", OF z_Hec])
   show FALSE
   proof (rule zenon_imply [OF z_Hfa])
    assume z_Hey:"(~?z_heu)"
    show FALSE
    by (rule notE [OF z_Hey z_Heu])
   next
    assume z_Hfb:"?z_hfb" (is "_|?z_hfc")
    show FALSE
    proof (rule zenon_or [OF z_Hfb])
     assume z_Hev:"?z_hev"
     show FALSE
     by (rule notE [OF z_Hdn z_Hev])
    next
     assume z_Hfc:"?z_hfc"
     show FALSE
     proof (rule notE [OF z_Hdn])
      have z_Hfd: "({}=?z_hdo)"
      by (rule sym [OF z_Hfc])
      have z_Hev: "?z_hev"
      by (rule subst [where P="(\<lambda>zenon_Vhta. (?z_hdm=zenon_Vhta))", OF z_Hfd], fact z_Hez)
      thus "?z_hev" .
     qed
    qed
   qed
  qed
 qed
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 661"; *} qed
lemma ob'712:
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
fixes a_c1a
assumes a_c1a_in : "(a_c1a \<in> (a_p1a))"
fixes a_c2a
assumes a_c2a_in : "(a_c2a \<in> (a_p2a))"
fixes a_c3a
assumes a_c3a_in : "(a_c3a \<in> (a_p1a))"
fixes a_e1a
assumes a_e1a_in : "(a_e1a \<in> (a_E1a))"
assumes v'82: "(((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a)))))"
assumes v'83: "(((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))) \<subseteq> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a)))))"
shows "(((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))) = (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a)))))"(is "PROP ?ob'712")
proof -
ML_command {* writeln "*** TLAPS ENTER 712"; *}
show "PROP ?ob'712"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_ae90aa.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_ae90aa.znn.out
;; obligation #712
$hyp "a_p1a_in" (TLA.in a_p1a PoliciesSet)
$hyp "a_p2a_in" (TLA.in a_p2a PoliciesSet)
$hyp "a_c1a_in" (TLA.in a_c1a a_p1a)
$hyp "a_c2a_in" (TLA.in a_c2a a_p2a)
$hyp "a_c3a_in" (TLA.in a_c3a a_p1a)
$hyp "a_e1a_in" (TLA.in a_e1a a_E1a)
$hyp "v'82" (TLA.subseteq (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
$hyp "v'83" (TLA.subseteq (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
$goal (= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Hh:"((((a_c1a[2])[2])[a_e1a]) \\subseteq (((a_c2a[2])[2])[a_e1a]))" (is "?z_hh")
 using v'82 by blast
 have z_Hi:"((((a_c2a[2])[2])[a_e1a]) \\subseteq (((a_c1a[2])[2])[a_e1a]))" (is "?z_hi")
 using v'83 by blast
 have zenon_L1_: "(~(\\A zenon_Vba:((zenon_Vba \\in (((a_c2a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c1a[2])[2])[a_e1a]))))) ==> (\\A x:((x \\in (((a_c2a[2])[2])[a_e1a]))=>(x \\in (((a_c1a[2])[2])[a_e1a])))) ==> (\\A x:((x \\in (((a_c1a[2])[2])[a_e1a]))=>(x \\in (((a_c2a[2])[2])[a_e1a])))) ==> FALSE" (is "?z_hu ==> ?z_ha ==> ?z_hbe ==> FALSE")
 proof -
  assume z_Hu:"?z_hu" (is "~(\\A x : ?z_hbg(x))")
  assume z_Ha:"?z_ha" (is "\\A x : ?z_hbh(x)")
  assume z_Hbe:"?z_hbe" (is "\\A x : ?z_hbi(x)")
  have z_Hbj: "(\\E zenon_Vba:(~((zenon_Vba \\in (((a_c2a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c1a[2])[2])[a_e1a])))))" (is "\\E x : ?z_hbl(x)")
  by (rule zenon_notallex_0 [of "?z_hbg", OF z_Hu])
  have z_Hbm: "?z_hbl((CHOOSE zenon_Vba:(~((zenon_Vba \\in (((a_c2a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c1a[2])[2])[a_e1a]))))))" (is "~(?z_hbo<=>?z_hbp)")
  by (rule zenon_ex_choose_0 [of "?z_hbl", OF z_Hbj])
  show FALSE
  proof (rule zenon_notequiv [OF z_Hbm])
   assume z_Hbq:"(~?z_hbo)"
   assume z_Hbp:"?z_hbp"
   have z_Hbr: "?z_hbi((CHOOSE zenon_Vba:(~((zenon_Vba \\in (((a_c2a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c1a[2])[2])[a_e1a]))))))"
   by (rule zenon_all_0 [of "?z_hbi" "(CHOOSE zenon_Vba:(~((zenon_Vba \\in (((a_c2a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c1a[2])[2])[a_e1a])))))", OF z_Hbe])
   show FALSE
   proof (rule zenon_imply [OF z_Hbr])
    assume z_Hbs:"(~?z_hbp)"
    show FALSE
    by (rule notE [OF z_Hbs z_Hbp])
   next
    assume z_Hbo:"?z_hbo"
    show FALSE
    by (rule notE [OF z_Hbq z_Hbo])
   qed
  next
   assume z_Hbo:"?z_hbo"
   assume z_Hbs:"(~?z_hbp)"
   have z_Hbt: "?z_hbh((CHOOSE zenon_Vba:(~((zenon_Vba \\in (((a_c2a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c1a[2])[2])[a_e1a]))))))"
   by (rule zenon_all_0 [of "?z_hbh" "(CHOOSE zenon_Vba:(~((zenon_Vba \\in (((a_c2a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c1a[2])[2])[a_e1a])))))", OF z_Ha])
   show FALSE
   proof (rule zenon_imply [OF z_Hbt])
    assume z_Hbq:"(~?z_hbo)"
    show FALSE
    by (rule notE [OF z_Hbq z_Hbo])
   next
    assume z_Hbp:"?z_hbp"
    show FALSE
    by (rule notE [OF z_Hbs z_Hbp])
   qed
  qed
 qed
 assume z_Hj:"((((a_c2a[2])[2])[a_e1a])~=(((a_c1a[2])[2])[a_e1a]))" (is "?z_hq~=?z_hk")
 have z_Hbu_z_Hh: "bAll(?z_hk, (\<lambda>x. (x \\in ?z_hq))) == ?z_hh" (is "?z_hbu == _")
 by (unfold subset_def)
 have z_Hbu: "?z_hbu"
 by (unfold z_Hbu_z_Hh, fact z_Hh)
 have z_Hbe_z_Hbu: "(\\A x:((x \\in ?z_hk)=>(x \\in ?z_hq))) == ?z_hbu" (is "?z_hbe == _")
 by (unfold bAll_def)
 have z_Hbe: "?z_hbe" (is "\\A x : ?z_hbi(x)")
 by (unfold z_Hbe_z_Hbu, fact z_Hbu)
 have z_Hbw_z_Hi: "bAll(?z_hq, (\<lambda>x. (x \\in ?z_hk))) == ?z_hi" (is "?z_hbw == _")
 by (unfold subset_def)
 have z_Hbw: "?z_hbw"
 by (unfold z_Hbw_z_Hi, fact z_Hi)
 have z_Ha_z_Hbw: "(\\A x:((x \\in ?z_hq)=>(x \\in ?z_hk))) == ?z_hbw" (is "?z_ha == _")
 by (unfold bAll_def)
 have z_Ha: "?z_ha" (is "\\A x : ?z_hbh(x)")
 by (unfold z_Ha_z_Hbw, fact z_Hbw)
 have z_Hu: "(~(\\A zenon_Vba:((zenon_Vba \\in ?z_hq)<=>(zenon_Vba \\in ?z_hk))))" (is "~(\\A x : ?z_hbg(x))")
 by (rule zenon_notsetequal_0 [of "?z_hq" "?z_hk", OF z_Hj])
 show FALSE
 by (rule zenon_L1_ [OF z_Hu z_Ha z_Hbe])
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 712"; *} qed
lemma ob'724:
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
fixes a_c1a
assumes a_c1a_in : "(a_c1a \<in> (a_p1a))"
fixes a_c2a
assumes a_c2a_in : "(a_c2a \<in> (a_p2a))"
fixes a_c3a
assumes a_c3a_in : "(a_c3a \<in> (a_p1a))"
fixes a_e1a
assumes a_e1a_in : "(a_e1a \<in> (a_E1a))"
assumes v'87: "(((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))) \<subseteq> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a)))))"
assumes v'88: "(((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))) \<subseteq> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a)))))"
shows "(((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))) = (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a)))))"(is "PROP ?ob'724")
proof -
ML_command {* writeln "*** TLAPS ENTER 724"; *}
show "PROP ?ob'724"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_ab9dc0.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_ab9dc0.znn.out
;; obligation #724
$hyp "a_p1a_in" (TLA.in a_p1a PoliciesSet)
$hyp "a_p2a_in" (TLA.in a_p2a PoliciesSet)
$hyp "a_c1a_in" (TLA.in a_c1a a_p1a)
$hyp "a_c2a_in" (TLA.in a_c2a a_p2a)
$hyp "a_c3a_in" (TLA.in a_c3a a_p1a)
$hyp "a_e1a_in" (TLA.in a_e1a a_E1a)
$hyp "v'87" (TLA.subseteq (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
$hyp "v'88" (TLA.subseteq (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
$goal (= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Hh:"((((a_c1a[2])[2])[a_e1a]) \\subseteq (((a_c2a[2])[2])[a_e1a]))" (is "?z_hh")
 using v'87 by blast
 have z_Hi:"((((a_c2a[2])[2])[a_e1a]) \\subseteq (((a_c1a[2])[2])[a_e1a]))" (is "?z_hi")
 using v'88 by blast
 have zenon_L1_: "(~(\\A zenon_Vba:((zenon_Vba \\in (((a_c2a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c1a[2])[2])[a_e1a]))))) ==> (\\A x:((x \\in (((a_c2a[2])[2])[a_e1a]))=>(x \\in (((a_c1a[2])[2])[a_e1a])))) ==> (\\A x:((x \\in (((a_c1a[2])[2])[a_e1a]))=>(x \\in (((a_c2a[2])[2])[a_e1a])))) ==> FALSE" (is "?z_hu ==> ?z_ha ==> ?z_hbe ==> FALSE")
 proof -
  assume z_Hu:"?z_hu" (is "~(\\A x : ?z_hbg(x))")
  assume z_Ha:"?z_ha" (is "\\A x : ?z_hbh(x)")
  assume z_Hbe:"?z_hbe" (is "\\A x : ?z_hbi(x)")
  have z_Hbj: "(\\E zenon_Vba:(~((zenon_Vba \\in (((a_c2a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c1a[2])[2])[a_e1a])))))" (is "\\E x : ?z_hbl(x)")
  by (rule zenon_notallex_0 [of "?z_hbg", OF z_Hu])
  have z_Hbm: "?z_hbl((CHOOSE zenon_Vba:(~((zenon_Vba \\in (((a_c2a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c1a[2])[2])[a_e1a]))))))" (is "~(?z_hbo<=>?z_hbp)")
  by (rule zenon_ex_choose_0 [of "?z_hbl", OF z_Hbj])
  show FALSE
  proof (rule zenon_notequiv [OF z_Hbm])
   assume z_Hbq:"(~?z_hbo)"
   assume z_Hbp:"?z_hbp"
   have z_Hbr: "?z_hbi((CHOOSE zenon_Vba:(~((zenon_Vba \\in (((a_c2a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c1a[2])[2])[a_e1a]))))))"
   by (rule zenon_all_0 [of "?z_hbi" "(CHOOSE zenon_Vba:(~((zenon_Vba \\in (((a_c2a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c1a[2])[2])[a_e1a])))))", OF z_Hbe])
   show FALSE
   proof (rule zenon_imply [OF z_Hbr])
    assume z_Hbs:"(~?z_hbp)"
    show FALSE
    by (rule notE [OF z_Hbs z_Hbp])
   next
    assume z_Hbo:"?z_hbo"
    show FALSE
    by (rule notE [OF z_Hbq z_Hbo])
   qed
  next
   assume z_Hbo:"?z_hbo"
   assume z_Hbs:"(~?z_hbp)"
   have z_Hbt: "?z_hbh((CHOOSE zenon_Vba:(~((zenon_Vba \\in (((a_c2a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c1a[2])[2])[a_e1a]))))))"
   by (rule zenon_all_0 [of "?z_hbh" "(CHOOSE zenon_Vba:(~((zenon_Vba \\in (((a_c2a[2])[2])[a_e1a]))<=>(zenon_Vba \\in (((a_c1a[2])[2])[a_e1a])))))", OF z_Ha])
   show FALSE
   proof (rule zenon_imply [OF z_Hbt])
    assume z_Hbq:"(~?z_hbo)"
    show FALSE
    by (rule notE [OF z_Hbq z_Hbo])
   next
    assume z_Hbp:"?z_hbp"
    show FALSE
    by (rule notE [OF z_Hbs z_Hbp])
   qed
  qed
 qed
 assume z_Hj:"((((a_c2a[2])[2])[a_e1a])~=(((a_c1a[2])[2])[a_e1a]))" (is "?z_hq~=?z_hk")
 have z_Hbu_z_Hh: "bAll(?z_hk, (\<lambda>x. (x \\in ?z_hq))) == ?z_hh" (is "?z_hbu == _")
 by (unfold subset_def)
 have z_Hbu: "?z_hbu"
 by (unfold z_Hbu_z_Hh, fact z_Hh)
 have z_Hbe_z_Hbu: "(\\A x:((x \\in ?z_hk)=>(x \\in ?z_hq))) == ?z_hbu" (is "?z_hbe == _")
 by (unfold bAll_def)
 have z_Hbe: "?z_hbe" (is "\\A x : ?z_hbi(x)")
 by (unfold z_Hbe_z_Hbu, fact z_Hbu)
 have z_Hbw_z_Hi: "bAll(?z_hq, (\<lambda>x. (x \\in ?z_hk))) == ?z_hi" (is "?z_hbw == _")
 by (unfold subset_def)
 have z_Hbw: "?z_hbw"
 by (unfold z_Hbw_z_Hi, fact z_Hi)
 have z_Ha_z_Hbw: "(\\A x:((x \\in ?z_hq)=>(x \\in ?z_hk))) == ?z_hbw" (is "?z_ha == _")
 by (unfold bAll_def)
 have z_Ha: "?z_ha" (is "\\A x : ?z_hbh(x)")
 by (unfold z_Ha_z_Hbw, fact z_Hbw)
 have z_Hu: "(~(\\A zenon_Vba:((zenon_Vba \\in ?z_hq)<=>(zenon_Vba \\in ?z_hk))))" (is "~(\\A x : ?z_hbg(x))")
 by (rule zenon_notsetequal_0 [of "?z_hq" "?z_hk", OF z_Hj])
 show FALSE
 by (rule zenon_L1_ [OF z_Hu z_Ha z_Hbe])
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 724"; *} qed
lemma ob'694:
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
fixes a_c1a
assumes a_c1a_in : "(a_c1a \<in> (a_p1a))"
fixes a_c2a
assumes a_c2a_in : "(a_c2a \<in> (a_p2a))"
fixes a_c3a
assumes a_c3a_in : "(a_c3a \<in> (a_p1a))"
fixes a_e1a
assumes a_e1a_in : "(a_e1a \<in> (a_E1a))"
assumes v'74: "(((((((a_c2a) \<in> (ClausesSet))) \<and> (((a_c1a) \<in> (ClausesSet))))) \<and> (((a_c3a) \<in> (ClausesSet)))))"
assumes v'75: "(\<forall> a_ca \<in> (ClausesSet) : (((fapply ((fapply ((a_ca), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))) \<in> ([(a_E1a) \<rightarrow> ((((((SUBSET (((U) \<union> (UU))))) \\ ({({})}))) \<union> ({({(NONE)})})))]))))"
shows "(((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))) \<noteq> ({})))"(is "PROP ?ob'694")
proof -
ML_command {* writeln "*** TLAPS ENTER 694"; *}
show "PROP ?ob'694"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_b12ee7.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_b12ee7.znn.out
;; obligation #694
$hyp "a_p1a_in" (TLA.in a_p1a PoliciesSet)
$hyp "a_p2a_in" (TLA.in a_p2a PoliciesSet)
$hyp "a_c1a_in" (TLA.in a_c1a a_p1a)
$hyp "a_c2a_in" (TLA.in a_c2a a_p2a)
$hyp "a_c3a_in" (TLA.in a_c3a a_p1a)
$hyp "a_e1a_in" (TLA.in a_e1a a_E1a)
$hyp "v'74" (/\ (/\ (TLA.in a_c2a ClausesSet) (TLA.in a_c1a ClausesSet))
(TLA.in a_c3a
ClausesSet))
$hyp "v'75" (TLA.bAll ClausesSet ((a_ca) (TLA.in (TLA.fapply (TLA.fapply a_ca (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0)))
(TLA.FuncSet a_E1a (TLA.cup (TLA.setminus (TLA.SUBSET (TLA.cup U UU))
(TLA.set TLA.emptyset))
(TLA.set (TLA.set NONE)))))))
$goal (-. (= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a)
TLA.emptyset))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Hg:"(((a_c2a \\in ClausesSet)&(a_c1a \\in ClausesSet))&(a_c3a \\in ClausesSet))" (is "?z_hj&?z_hp")
 using v'74 by blast
 have z_Hf:"(a_e1a \\in a_E1a)" (is "?z_hf")
 using a_e1a_in by blast
 have z_Hh:"bAll(ClausesSet, (\<lambda>a_ca. (((a_ca[2])[2]) \\in FuncSet(a_E1a, ((SUBSET((U \\cup UU)) \\ {{}}) \\cup {{NONE}})))))" (is "?z_hh")
 using v'75 by blast
 have zenon_L1_: "((((a_c2a[2])[2])[a_e1a]) \\in (SUBSET((U \\cup UU)) \\ {{}})) ==> ((((a_c2a[2])[2])[a_e1a])={}) ==> FALSE" (is "?z_hbl ==> ?z_hbp ==> FALSE")
 proof -
  assume z_Hbl:"?z_hbl"
  assume z_Hbp:"?z_hbp" (is "?z_hbm=_")
  have z_Hbq: "(~(?z_hbm \\in {{}}))" (is "~?z_hbr")
  by (rule zenon_in_setminus_1 [of "?z_hbm" "SUBSET((U \\cup UU))" "{{}}", OF z_Hbl])
  have z_Hbs: "(?z_hbm~={})"
  by (rule zenon_notin_addElt_0 [of "?z_hbm" "{}" "{}", OF z_Hbq])
  show FALSE
  by (rule notE [OF z_Hbs z_Hbp])
 qed
 have zenon_L2_: "(~(NONE \\in {NONE})) ==> FALSE" (is "?z_hbu ==> FALSE")
 proof -
  assume z_Hbu:"?z_hbu" (is "~?z_hbv")
  have z_Hbw: "(NONE~=NONE)"
  by (rule zenon_notin_addElt_0 [of "NONE" "NONE" "{}", OF z_Hbu])
  show FALSE
  by (rule zenon_noteq [OF z_Hbw])
 qed
 assume z_Hi:"(~((((a_c2a[2])[2])[a_e1a])~={}))" (is "~~?z_hbp")
 have z_Hj: "?z_hj" (is "?z_hk&?z_hn")
 by (rule zenon_and_0 [OF z_Hg])
 have z_Hk: "?z_hk"
 by (rule zenon_and_0 [OF z_Hj])
 have z_Hbp: "?z_hbp" (is "?z_hbm=_")
 by (rule zenon_notnot_0 [OF z_Hi])
 have z_Hbx: "(((a_c2a[2])[2]) \\in FuncSet(a_E1a, ((SUBSET((U \\cup UU)) \\ {{}}) \\cup {{NONE}})))" (is "?z_hbx")
 by (rule zenon_all_in_0 [of "ClausesSet" "(\<lambda>a_ca. (((a_ca[2])[2]) \\in FuncSet(a_E1a, ((SUBSET((U \\cup UU)) \\ {{}}) \\cup {{NONE}}))))", OF z_Hh z_Hk])
 have z_Hby: "(\\A zenon_Vib:((zenon_Vib \\in a_E1a)=>((((a_c2a[2])[2])[zenon_Vib]) \\in ((SUBSET((U \\cup UU)) \\ {{}}) \\cup {{NONE}}))))" (is "\\A x : ?z_hce(x)")
 by (rule zenon_in_funcset_2 [of "((a_c2a[2])[2])" "a_E1a" "((SUBSET((U \\cup UU)) \\ {{}}) \\cup {{NONE}})", OF z_Hbx])
 have z_Hcf: "?z_hce(a_e1a)" (is "_=>?z_hcg")
 by (rule zenon_all_0 [of "?z_hce" "a_e1a", OF z_Hby])
 show FALSE
 proof (rule zenon_imply [OF z_Hcf])
  assume z_Hch:"(~?z_hf)"
  show FALSE
  by (rule notE [OF z_Hch z_Hf])
 next
  assume z_Hcg:"?z_hcg"
  show FALSE
  proof (rule zenon_in_cup [of "?z_hbm" "(SUBSET((U \\cup UU)) \\ {{}})" "{{NONE}}", OF z_Hcg])
   assume z_Hbl:"(?z_hbm \\in (SUBSET((U \\cup UU)) \\ {{}}))" (is "?z_hbl")
   show FALSE
   by (rule zenon_L1_ [OF z_Hbl z_Hbp])
  next
   assume z_Hci:"(?z_hbm \\in {{NONE}})" (is "?z_hci")
   show FALSE
   proof (rule zenon_in_addElt [of "?z_hbm" "{NONE}" "{}", OF z_Hci])
    assume z_Hcj:"(?z_hbm={NONE})" (is "_=?z_hbj")
    have z_Hck: "(\\A zenon_Vtfm:((zenon_Vtfm \\in ?z_hbm)<=>(zenon_Vtfm \\in ?z_hbj)))" (is "\\A x : ?z_hcp(x)")
    by (rule zenon_setequal_0 [of "?z_hbm" "?z_hbj", OF z_Hcj])
    have z_Hcq: "?z_hcp(NONE)" (is "?z_hcr<=>?z_hbv")
    by (rule zenon_all_0 [of "?z_hcp" "NONE", OF z_Hck])
    show FALSE
    proof (rule zenon_equiv [OF z_Hcq])
     assume z_Hcs:"(~?z_hcr)"
     assume z_Hbu:"(~?z_hbv)"
     show FALSE
     by (rule zenon_L2_ [OF z_Hbu])
    next
     assume z_Hcr:"?z_hcr"
     assume z_Hbv:"?z_hbv"
     have z_Hct: "(NONE \\in {})" (is "?z_hct")
     by (rule subst [where P="(\<lambda>zenon_Vlrla. (NONE \\in zenon_Vlrla))", OF z_Hbp z_Hcr])
     show FALSE
     by (rule zenon_in_emptyset [of "NONE", OF z_Hct])
    qed
   next
    assume z_Hcx:"(?z_hbm \\in {})" (is "?z_hcx")
    show FALSE
    by (rule zenon_in_emptyset [of "?z_hbm", OF z_Hcx])
   qed
  qed
 qed
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 694"; *} qed
lemma ob'816:
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
fixes a_l1a
assumes a_l1a_in : "(a_l1a \<in> (l))"
fixes a_c1a
assumes a_c1a_in : "(a_c1a \<in> (a_p1a))"
fixes a_c2a
assumes a_c2a_in : "(a_c2a \<in> (a_p2a))"
assumes v'59: "(((a_l1a) \<noteq> (<<>>)))"
assumes v'60: "(((a_l1a) = (cond(((substMap3Equality ((a_c1a), (a_c2a)))), (<<(fapply ((a_c2a), ((Succ[0])))), (<<([ a_e0a \<in> (a_E0a)  \<mapsto> (((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (a_e0a))) \<inter> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (a_e0a)))))]), ([ a_e1a \<in> (a_E1a)  \<mapsto> (cond((((((NONE) \<in> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))) \<and> (((NONE) \<in> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))))), ({(NONE)}), ((((((matchLocks ((a_c1a), (a_c2a), (a_e1a)))) \<union> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))) \\ ({(NONE)})))))])>>)>>), (cond(((substMap3Equality ((a_c2a), (a_c1a)))), (<<(fapply ((a_c1a), ((Succ[0])))), (<<([ a_e0a \<in> (a_E0a)  \<mapsto> (((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (a_e0a))) \<inter> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (a_e0a)))))]), ([ a_e1a \<in> (a_E1a)  \<mapsto> (cond((((((NONE) \<in> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))) \<and> (((NONE) \<in> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))))), ({(NONE)}), ((((((matchLocks ((a_c2a), (a_c1a), (a_e1a)))) \<union> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))) \\ ({(NONE)})))))])>>)>>), (<<>>)))))))"
shows "((((a_l1a) = (<<(fapply ((a_c2a), ((Succ[0])))), (<<([ a_e0a \<in> (a_E0a)  \<mapsto> (((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (a_e0a))) \<inter> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (a_e0a)))))]), ([ a_e1a \<in> (a_E1a)  \<mapsto> (cond((((((NONE) \<in> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))) \<and> (((NONE) \<in> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))))), ({(NONE)}), ((((((matchLocks ((a_c1a), (a_c2a), (a_e1a)))) \<union> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))) \\ ({(NONE)})))))])>>)>>))) | (((a_l1a) = (<<(fapply ((a_c1a), ((Succ[0])))), (<<([ a_e0a \<in> (a_E0a)  \<mapsto> (((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (a_e0a))) \<inter> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (a_e0a)))))]), ([ a_e1a \<in> (a_E1a)  \<mapsto> (cond((((((NONE) \<in> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))) \<and> (((NONE) \<in> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))))), ({(NONE)}), ((((((matchLocks ((a_c2a), (a_c1a), (a_e1a)))) \<union> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))) \\ ({(NONE)})))))])>>)>>))))"(is "PROP ?ob'816")
proof -
ML_command {* writeln "*** TLAPS ENTER 816"; *}
show "PROP ?ob'816"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_e6a2af.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_e6a2af.znn.out
;; obligation #816
$hyp "a_p1a_in" (TLA.in a_p1a PoliciesSet)
$hyp "a_p2a_in" (TLA.in a_p2a PoliciesSet)
$hyp "l_in" (TLA.in l PoliciesSet)
$hyp "a_l1a_in" (TLA.in a_l1a l)
$hyp "a_c1a_in" (TLA.in a_c1a a_p1a)
$hyp "a_c2a_in" (TLA.in a_c2a a_p2a)
$hyp "v'59" (-. (= a_l1a (TLA.tuple )))
$hyp "v'60" (= a_l1a (TLA.cond (substMap3Equality a_c1a
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
$goal (\/ (= a_l1a (TLA.tuple (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))
(TLA.tuple (TLA.Fcn a_E0a ((a_e0a) (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) a_e0a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) a_e0a))))
(TLA.Fcn a_E1a ((a_e1a) (TLA.cond (/\ (TLA.in NONE
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
(TLA.in NONE
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))) (TLA.set NONE) (TLA.setminus (TLA.cup (matchLocks a_c1a
a_c2a a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
(TLA.set NONE)))))))) (= a_l1a
(TLA.tuple (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.tuple (TLA.Fcn a_E0a ((a_e0a) (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) a_e0a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) a_e0a))))
(TLA.Fcn a_E1a ((a_e1a) (TLA.cond (/\ (TLA.in NONE
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
(TLA.in NONE
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))) (TLA.set NONE) (TLA.setminus (TLA.cup (matchLocks a_c2a
a_c1a a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
(TLA.set NONE)))))))))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Hh:"(a_l1a=cond(substMap3Equality(a_c1a, a_c2a), <<(a_c2a[1]), <<Fcn(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a]) \\cap (((a_c2a[2])[1])[a_e0a])))), Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), {NONE}, ((matchLocks(a_c1a, a_c2a, a_e1a) \\cup (((a_c2a[2])[2])[a_e1a])) \\ {NONE}))))>>>>, cond(substMap3Equality(a_c2a, a_c1a), <<(a_c1a[1]), <<Fcn(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a]) \\cap (((a_c2a[2])[1])[a_e0a])))), Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), {NONE}, ((matchLocks(a_c2a, a_c1a, a_e1a) \\cup (((a_c1a[2])[2])[a_e1a])) \\ {NONE}))))>>>>, <<>>)))" (is "_=?z_hk")
 using v'60 by blast
 have z_Hg:"(a_l1a~=<<>>)" (is "_~=?z_hcg")
 using v'59 by blast
 have z_Hd:"(a_l1a \\in l)" (is "?z_hd")
 using a_l1a_in by blast
 assume z_Hi:"(~((a_l1a=<<(a_c2a[1]), <<Fcn(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a]) \\cap (((a_c2a[2])[1])[a_e0a])))), Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), {NONE}, ((matchLocks(a_c1a, a_c2a, a_e1a) \\cup (((a_c2a[2])[2])[a_e1a])) \\ {NONE}))))>>>>)|(a_l1a=<<(a_c1a[1]), <<Fcn(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a]) \\cap (((a_c2a[2])[1])[a_e0a])))), Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), {NONE}, ((matchLocks(a_c2a, a_c1a, a_e1a) \\cup (((a_c1a[2])[2])[a_e1a])) \\ {NONE}))))>>>>)))" (is "~(?z_hcj|?z_hck)")
 have z_Hcl: "(?z_hk~=?z_hcg)"
 by (rule subst [where P="(\<lambda>zenon_Vg. (zenon_Vg~=?z_hcg))", OF z_Hh z_Hg])
 have z_Hcp: "(a_l1a~=<<(a_c2a[1]), <<Fcn(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a]) \\cap (((a_c2a[2])[1])[a_e0a])))), Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), {NONE}, ((matchLocks(a_c1a, a_c2a, a_e1a) \\cup (((a_c2a[2])[2])[a_e1a])) \\ {NONE}))))>>>>)" (is "_~=?z_ho")
 by (rule zenon_notor_0 [OF z_Hi])
 have z_Hcq: "(a_l1a~=<<(a_c1a[1]), <<Fcn(a_E0a, (\<lambda>a_e0a. ((((a_c1a[2])[1])[a_e0a]) \\cap (((a_c2a[2])[1])[a_e0a])))), Fcn(a_E1a, (\<lambda>a_e1a. cond(((NONE \\in (((a_c1a[2])[2])[a_e1a]))&(NONE \\in (((a_c2a[2])[2])[a_e1a]))), {NONE}, ((matchLocks(a_c2a, a_c1a, a_e1a) \\cup (((a_c1a[2])[2])[a_e1a])) \\ {NONE}))))>>>>)" (is "_~=?z_hbx")
 by (rule zenon_notor_1 [OF z_Hi])
 have z_Hcr: "(?z_hk~=?z_ho)"
 by (rule subst [where P="(\<lambda>zenon_Vv. (zenon_Vv~=?z_ho))", OF z_Hh z_Hcp])
 have z_Hcv: "(?z_hk~=?z_hbx)"
 by (rule subst [where P="(\<lambda>zenon_Vu. (zenon_Vu~=?z_hbx))", OF z_Hh z_Hcq])
 have z_Hcz: "(?z_hk \\in l)" (is "?z_hcz")
 by (rule subst [where P="(\<lambda>zenon_Vl. (zenon_Vl \\in l))", OF z_Hh z_Hd])
 show FALSE
 proof (rule zenon_ifthenelse [of "(\<lambda>zenon_Vl. (zenon_Vl \\in l))" "substMap3Equality(a_c1a, a_c2a)" "?z_ho" "cond(substMap3Equality(a_c2a, a_c1a), ?z_hbx, ?z_hcg)", OF z_Hcz])
  assume z_Hl:"substMap3Equality(a_c1a, a_c2a)" (is "?z_hl")
  assume z_Hdd:"(?z_ho \\in l)" (is "?z_hdd")
  show FALSE
  proof (rule zenon_ifthenelse [of "(\<lambda>zenon_Vv. (zenon_Vv~=?z_ho))" "?z_hl" "?z_ho" "cond(substMap3Equality(a_c2a, a_c1a), ?z_hbx, ?z_hcg)", OF z_Hcr])
   assume z_Hl:"?z_hl"
   assume z_Hde:"(?z_ho~=?z_ho)"
   show FALSE
   by (rule zenon_noteq [OF z_Hde])
  next
   assume z_Hdf:"(~?z_hl)"
   assume z_Hdg:"(cond(substMap3Equality(a_c2a, a_c1a), ?z_hbx, ?z_hcg)~=?z_ho)" (is "?z_hbv~=_")
   show FALSE
   by (rule notE [OF z_Hdf z_Hl])
  qed
 next
  assume z_Hdf:"(~substMap3Equality(a_c1a, a_c2a))" (is "~?z_hl")
  assume z_Hdh:"(cond(substMap3Equality(a_c2a, a_c1a), ?z_hbx, ?z_hcg) \\in l)" (is "?z_hdh")
  show FALSE
  proof (rule zenon_ifthenelse [of "(\<lambda>zenon_Vl. (zenon_Vl \\in l))" "substMap3Equality(a_c2a, a_c1a)" "?z_hbx" "?z_hcg", OF z_Hdh])
   assume z_Hbw:"substMap3Equality(a_c2a, a_c1a)" (is "?z_hbw")
   assume z_Hdi:"(?z_hbx \\in l)" (is "?z_hdi")
   show FALSE
   proof (rule zenon_ifthenelse [of "(\<lambda>zenon_Vu. (zenon_Vu~=?z_hbx))" "?z_hl" "?z_ho" "cond(?z_hbw, ?z_hbx, ?z_hcg)", OF z_Hcv])
    assume z_Hl:"?z_hl"
    assume z_Hdj:"(?z_ho~=?z_hbx)"
    show FALSE
    by (rule notE [OF z_Hdf z_Hl])
   next
    assume z_Hdf:"(~?z_hl)"
    assume z_Hdk:"(cond(?z_hbw, ?z_hbx, ?z_hcg)~=?z_hbx)" (is "?z_hbv~=_")
    show FALSE
    proof (rule zenon_ifthenelse [of "(\<lambda>zenon_Vu. (zenon_Vu~=?z_hbx))" "?z_hbw" "?z_hbx" "?z_hcg", OF z_Hdk])
     assume z_Hbw:"?z_hbw"
     assume z_Hdl:"(?z_hbx~=?z_hbx)"
     show FALSE
     by (rule zenon_noteq [OF z_Hdl])
    next
     assume z_Hdm:"(~?z_hbw)"
     assume z_Hdn:"(?z_hcg~=?z_hbx)"
     show FALSE
     by (rule notE [OF z_Hdm z_Hbw])
    qed
   qed
  next
   assume z_Hdm:"(~substMap3Equality(a_c2a, a_c1a))" (is "~?z_hbw")
   assume z_Hdo:"(?z_hcg \\in l)" (is "?z_hdo")
   show FALSE
   proof (rule zenon_ifthenelse [of "(\<lambda>zenon_Vg. (zenon_Vg~=?z_hcg))" "?z_hl" "?z_ho" "cond(?z_hbw, ?z_hbx, ?z_hcg)", OF z_Hcl])
    assume z_Hl:"?z_hl"
    assume z_Hdp:"(?z_ho~=?z_hcg)"
    show FALSE
    by (rule notE [OF z_Hdf z_Hl])
   next
    assume z_Hdf:"(~?z_hl)"
    assume z_Hdq:"(cond(?z_hbw, ?z_hbx, ?z_hcg)~=?z_hcg)" (is "?z_hbv~=_")
    show FALSE
    proof (rule zenon_ifthenelse [of "(\<lambda>zenon_Vg. (zenon_Vg~=?z_hcg))" "?z_hbw" "?z_hbx" "?z_hcg", OF z_Hdq])
     assume z_Hbw:"?z_hbw"
     assume z_Hdr:"(?z_hbx~=?z_hcg)"
     show FALSE
     by (rule notE [OF z_Hdm z_Hbw])
    next
     assume z_Hdm:"(~?z_hbw)"
     assume z_Hds:"(?z_hcg~=?z_hcg)"
     show FALSE
     by (rule zenon_noteq [OF z_Hds])
    qed
   qed
  qed
 qed
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 816"; *} qed
lemma ob'880:
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
fixes a_l1a
assumes a_l1a_in : "(a_l1a \<in> (l))"
fixes a_c1a
assumes a_c1a_in : "(a_c1a \<in> (a_p1a))"
fixes a_c2a
assumes a_c2a_in : "(a_c2a \<in> (a_p2a))"
fixes a_e1a
assumes a_e1a_in : "(a_e1a \<in> (a_E1a))"
assumes v'89: "((({(fapply ((a_l1a), ((Succ[0]))))}) = (UU)))"
assumes v'90: "(\<forall> a_e1a_1 \<in> (a_E1a) : (((((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a_1))) \<inter> (UU))) = ({}))) & ((((matchLocks ((a_c2a), (a_l1a), (a_e1a_1)))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a_1)))))) | ((((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a_1))) \<inter> (UU))) \<noteq> ({}))) & ((((matchLocks ((a_c2a), (a_l1a), (a_e1a_1)))) = (((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a_1))) \\ (UU))) \<union> ({(fapply ((a_l1a), ((Succ[0]))))}))))))))"
shows "((((matchLocks ((a_c2a), (a_l1a), (a_e1a)))) = (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a)))))"(is "PROP ?ob'880")
proof -
ML_command {* writeln "*** TLAPS ENTER 880"; *}
show "PROP ?ob'880"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_35aeef.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_35aeef.znn.out
;; obligation #880
$hyp "a_p1a_in" (TLA.in a_p1a PoliciesSet)
$hyp "a_p2a_in" (TLA.in a_p2a PoliciesSet)
$hyp "l_in" (TLA.in l PoliciesSet)
$hyp "a_l1a_in" (TLA.in a_l1a l)
$hyp "a_c1a_in" (TLA.in a_c1a a_p1a)
$hyp "a_c2a_in" (TLA.in a_c2a a_p2a)
$hyp "a_e1a_in" (TLA.in a_e1a a_E1a)
$hyp "v'89" (= (TLA.set (TLA.fapply a_l1a (TLA.fapply TLA.Succ 0)))
UU)
$hyp "v'90" (TLA.bAll a_E1a ((a_e1a_1) (\/ (/\ (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a_1)
UU) TLA.emptyset) (= (matchLocks a_c2a a_l1a a_e1a_1)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a_1)))
(/\ (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a_1)
UU) TLA.emptyset)) (= (matchLocks a_c2a a_l1a a_e1a_1)
(TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a_1)
UU)
(TLA.set (TLA.fapply a_l1a (TLA.fapply TLA.Succ 0)))))))))
$goal (= (matchLocks a_c2a a_l1a a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Hh:"({(a_l1a[1])}=UU)" (is "?z_hk=_")
 using v'89 by blast
 have z_Hi:"bAll(a_E1a, (\<lambda>a_e1a_1. (((((((a_c2a[2])[2])[a_e1a_1]) \\cap UU)={})&(matchLocks(a_c2a, a_l1a, a_e1a_1)=(((a_c2a[2])[2])[a_e1a_1])))|((((((a_c2a[2])[2])[a_e1a_1]) \\cap UU)~={})&(matchLocks(a_c2a, a_l1a, a_e1a_1)=(((((a_c2a[2])[2])[a_e1a_1]) \\ UU) \\cup ?z_hk))))))" (is "?z_hi")
 using v'90 by blast
 have z_Hg:"(a_e1a \\in a_E1a)" (is "?z_hg")
 using a_e1a_in by blast
 assume z_Hj:"(matchLocks(a_c2a, a_l1a, a_e1a)~=(((a_c2a[2])[2])[a_e1a]))" (is "?z_hbk~=?z_hbl")
 have z_Hbm: "((((?z_hbl \\cap UU)={})&(?z_hbk=?z_hbl))|(((?z_hbl \\cap UU)~={})&(?z_hbk=((?z_hbl \\ UU) \\cup ?z_hk))))" (is "?z_hbn|?z_hbr")
 by (rule zenon_all_in_0 [of "a_E1a" "(\<lambda>a_e1a_1. (((((((a_c2a[2])[2])[a_e1a_1]) \\cap UU)={})&(matchLocks(a_c2a, a_l1a, a_e1a_1)=(((a_c2a[2])[2])[a_e1a_1])))|((((((a_c2a[2])[2])[a_e1a_1]) \\cap UU)~={})&(matchLocks(a_c2a, a_l1a, a_e1a_1)=(((((a_c2a[2])[2])[a_e1a_1]) \\ UU) \\cup ?z_hk)))))", OF z_Hi z_Hg])
 show FALSE
 proof (rule zenon_or [OF z_Hbm])
  assume z_Hbn:"?z_hbn" (is "?z_hbo&?z_hbq")
  have z_Hbq: "?z_hbq"
  by (rule zenon_and_1 [OF z_Hbn])
  show FALSE
  by (rule notE [OF z_Hj z_Hbq])
 next
  assume z_Hbr:"?z_hbr" (is "?z_hbs&?z_hbt")
  have z_Hbs: "?z_hbs" (is "?z_hbp~=_")
  by (rule zenon_and_0 [OF z_Hbr])
  have z_Hbt: "?z_hbt" (is "_=?z_hbu")
  by (rule zenon_and_1 [OF z_Hbr])
  have z_Hbw: "((?z_hbl \\cap ?z_hk)~={})" (is "?z_hbx~=_")
  by (rule ssubst [where P="(\<lambda>zenon_Vsqd. ((?z_hbl \\cap zenon_Vsqd)~={}))", OF z_Hh z_Hbs])
  show FALSE
  proof (rule notE [OF z_Hj])
   have z_Hcc: "(?z_hbu=?z_hbl)"
   proof (rule zenon_nnpp [of "(?z_hbu=?z_hbl)"])
    assume z_Hcd:"(?z_hbu~=?z_hbl)"
    have z_Hce: "(~(\\A zenon_Vua:((zenon_Vua \\in ?z_hbx)<=>(zenon_Vua \\in {}))))" (is "~(\\A x : ?z_hck(x))")
    by (rule zenon_notsetequal_0 [of "?z_hbx" "{}", OF z_Hbw])
    have z_Hcl: "(\\E zenon_Vua:(~((zenon_Vua \\in ?z_hbx)<=>(zenon_Vua \\in {}))))" (is "\\E x : ?z_hcn(x)")
    by (rule zenon_notallex_0 [of "?z_hck", OF z_Hce])
    have z_Hco: "?z_hcn((CHOOSE zenon_Vua:(~((zenon_Vua \\in ?z_hbx)<=>(zenon_Vua \\in {})))))" (is "~(?z_hcq<=>?z_hcr)")
    by (rule zenon_ex_choose_0 [of "?z_hcn", OF z_Hcl])
    show FALSE
    proof (rule zenon_notequiv [OF z_Hco])
     assume z_Hcs:"(~?z_hcq)"
     assume z_Hcr:"?z_hcr"
     show FALSE
     by (rule zenon_in_emptyset [of "(CHOOSE zenon_Vua:(~((zenon_Vua \\in ?z_hbx)<=>(zenon_Vua \\in {}))))", OF z_Hcr])
    next
     assume z_Hcq:"?z_hcq"
     assume z_Hct:"(~?z_hcr)"
     have z_Hcu: "((CHOOSE zenon_Vua:(~((zenon_Vua \\in ?z_hbx)<=>(zenon_Vua \\in {})))) \\in ?z_hbl)" (is "?z_hcu")
     by (rule zenon_in_cap_0 [of "(CHOOSE zenon_Vua:(~((zenon_Vua \\in ?z_hbx)<=>(zenon_Vua \\in {}))))" "?z_hbl" "?z_hk", OF z_Hcq])
     have z_Hcv: "((CHOOSE zenon_Vua:(~((zenon_Vua \\in ?z_hbx)<=>(zenon_Vua \\in {})))) \\in ?z_hk)" (is "?z_hcv")
     by (rule zenon_in_cap_1 [of "(CHOOSE zenon_Vua:(~((zenon_Vua \\in ?z_hbx)<=>(zenon_Vua \\in {}))))" "?z_hbl" "?z_hk", OF z_Hcq])
     show FALSE
     proof (rule zenon_in_addElt [of "(CHOOSE zenon_Vua:(~((zenon_Vua \\in ?z_hbx)<=>(zenon_Vua \\in {}))))" "(a_l1a[1])" "{}", OF z_Hcv])
      assume z_Hcx:"((CHOOSE zenon_Vua:(~((zenon_Vua \\in ?z_hbx)<=>(zenon_Vua \\in {}))))=(a_l1a[1]))" (is "?z_hcp=?z_hl")
      have z_Hcy: "(~(\\A zenon_Vya:((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl))))" (is "~(\\A x : ?z_hde(x))")
      by (rule zenon_notsetequal_0 [of "?z_hbu" "?z_hbl", OF z_Hcd])
      have z_Hdf: "(\\E zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl))))" (is "\\E x : ?z_hdh(x)")
      by (rule zenon_notallex_0 [of "?z_hde", OF z_Hcy])
      have z_Hdi: "?z_hdh((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl)))))" (is "~(?z_hdk<=>?z_hdl)")
      by (rule zenon_ex_choose_0 [of "?z_hdh", OF z_Hdf])
      show FALSE
      proof (rule zenon_notequiv [OF z_Hdi])
       assume z_Hdm:"(~?z_hdk)"
       assume z_Hdl:"?z_hdl"
       have z_Hdn: "(~((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl)))) \\in (?z_hbl \\ UU)))" (is "~?z_hdo")
       by (rule zenon_notin_cup_0 [of "(CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl))))" "(?z_hbl \\ UU)" "?z_hk", OF z_Hdm])
       have z_Hdp: "(~((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl)))) \\in ?z_hk))" (is "~?z_hdq")
       by (rule zenon_notin_cup_1 [of "(CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl))))" "(?z_hbl \\ UU)" "?z_hk", OF z_Hdm])
       show FALSE
       proof (rule zenon_notin_setminus [of "(CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl))))" "?z_hbl" "UU", OF z_Hdn])
        assume z_Hdr:"(~?z_hdl)"
        show FALSE
        by (rule notE [OF z_Hdr z_Hdl])
       next
        assume z_Hds:"((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl)))) \\in UU)" (is "?z_hds")
        have z_Hdq: "?z_hdq"
        by (rule ssubst [where P="(\<lambda>zenon_Vupd. ((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl)))) \\in zenon_Vupd))", OF z_Hh z_Hds])
        show FALSE
        by (rule notE [OF z_Hdp z_Hdq])
       qed
      next
       assume z_Hdk:"?z_hdk"
       assume z_Hdr:"(~?z_hdl)"
       show FALSE
       proof (rule zenon_in_cup [of "(CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl))))" "(?z_hbl \\ UU)" "?z_hk", OF z_Hdk])
        assume z_Hdo:"((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl)))) \\in (?z_hbl \\ UU))" (is "?z_hdo")
        have z_Hdl: "?z_hdl"
        by (rule zenon_in_setminus_0 [of "(CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl))))" "?z_hbl" "UU", OF z_Hdo])
        show FALSE
        by (rule notE [OF z_Hdr z_Hdl])
       next
        assume z_Hdq:"((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl)))) \\in ?z_hk)" (is "?z_hdq")
        show FALSE
        proof (rule zenon_in_addElt [of "(CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl))))" "?z_hl" "{}", OF z_Hdq])
         assume z_Hdw:"((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl))))=?z_hl)" (is "?z_hdj=_")
         show FALSE
         proof (rule notE [OF z_Hdr])
          have z_Hdx: "(?z_hcp=?z_hdj)"
          proof (rule zenon_nnpp [of "(?z_hcp=?z_hdj)"])
           assume z_Hdy:"(?z_hcp~=?z_hdj)"
           show FALSE
           proof (rule notE [OF z_Hdy])
            have z_Hdz: "(?z_hl=?z_hdj)"
            by (rule sym [OF z_Hdw])
            have z_Hdx: "(?z_hcp=?z_hdj)"
            by (rule subst [where P="(\<lambda>zenon_Vvqd. (?z_hcp=zenon_Vvqd))", OF z_Hdz], fact z_Hcx)
            thus "(?z_hcp=?z_hdj)" .
           qed
          qed
          have z_Hdl: "?z_hdl"
          by (rule subst [where P="(\<lambda>zenon_Vxpd. (zenon_Vxpd \\in ?z_hbl))", OF z_Hdx], fact z_Hcu)
          thus "?z_hdl" .
         qed
        next
         assume z_Heg:"((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl)))) \\in {})" (is "?z_heg")
         show FALSE
         by (rule zenon_in_emptyset [of "(CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl))))", OF z_Heg])
        qed
       qed
      qed
     next
      assume z_Heh:"((CHOOSE zenon_Vua:(~((zenon_Vua \\in ?z_hbx)<=>(zenon_Vua \\in {})))) \\in {})" (is "?z_heh")
      show FALSE
      by (rule zenon_in_emptyset [of "(CHOOSE zenon_Vua:(~((zenon_Vua \\in ?z_hbx)<=>(zenon_Vua \\in {}))))", OF z_Heh])
     qed
    qed
   qed
   have z_Hbq: "(?z_hbk=?z_hbl)"
   by (rule subst [where P="(\<lambda>zenon_Vxqd. (?z_hbk=zenon_Vxqd))", OF z_Hcc], fact z_Hbt)
   thus "(?z_hbk=?z_hbl)" .
  qed
 qed
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 880"; *} qed
lemma ob'818:
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
(* usable definition matchLocks suppressed *)
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
fixes a_l1a
assumes a_l1a_in : "(a_l1a \<in> (l))"
fixes a_c1a
assumes a_c1a_in : "(a_c1a \<in> (a_p1a))"
fixes a_c2a
assumes a_c2a_in : "(a_c2a \<in> (a_p2a))"
assumes v'79: "(((a_l1a) = (<<(fapply ((a_c2a), ((Succ[0])))), (<<([ a_e0a \<in> (a_E0a)  \<mapsto> (((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (a_e0a))) \<inter> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (a_e0a)))))]), ([ a_e1a \<in> (a_E1a)  \<mapsto> (cond((((((NONE) \<in> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))) \<and> (((NONE) \<in> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))))), ({(NONE)}), ((((((matchLocks ((a_c1a), (a_c2a), (a_e1a)))) \<union> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))) \\ ({(NONE)})))))])>>)>>)))"
assumes v'80: "(((((fapply ((a_c1a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_l1a), ((Succ[0]))))))))"
assumes v'81: "(((fapply ((a_c2a), ((Succ[0])))) = (fapply ((a_l1a), ((Succ[0]))))))"
assumes v'82: "(\<forall> k \<in> (a_E0a) : (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_l1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_l1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({})))) & ((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_l1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_l1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))))"
assumes v'83: "(\<forall> a_e1a \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))) = ({(NONE)}))) | ((((matchLocks ((a_c1a), (a_l1a), (a_e1a)))) \<subseteq> (fapply ((fapply ((fapply ((a_l1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a)))))))"
assumes v'84: "(\<forall> a_e1a \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))) = ({(NONE)}))) | ((((matchLocks ((a_c2a), (a_l1a), (a_e1a)))) \<subseteq> (fapply ((fapply ((fapply ((a_l1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a)))))))"
shows "((\<exists> a_c1a_1 \<in> (a_p1a) : ((((((fapply ((a_c1a_1), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a_1), ((Succ[0])))) = (fapply ((a_l1a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_l1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_l1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | ((((matchLocks ((a_c1a_1), (a_l1a), (e)))) \<subseteq> (fapply ((fapply ((fapply ((a_l1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))) & (\<exists> a_c2a_1 \<in> (a_p2a) : ((((((fapply ((a_c2a_1), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c2a_1), ((Succ[0])))) = (fapply ((a_l1a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_l1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_l1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | ((((matchLocks ((a_c2a_1), (a_l1a), (e)))) \<subseteq> (fapply ((fapply ((fapply ((a_l1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))))"(is "PROP ?ob'818")
proof -
ML_command {* writeln "*** TLAPS ENTER 818"; *}
show "PROP ?ob'818"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_69dbf1.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_69dbf1.znn.out
;; obligation #818
$hyp "a_p1a_in" (TLA.in a_p1a PoliciesSet)
$hyp "a_p2a_in" (TLA.in a_p2a PoliciesSet)
$hyp "l_in" (TLA.in l PoliciesSet)
$hyp "a_l1a_in" (TLA.in a_l1a l)
$hyp "a_c1a_in" (TLA.in a_c1a a_p1a)
$hyp "a_c2a_in" (TLA.in a_c2a a_p2a)
$hyp "v'79" (= a_l1a (TLA.tuple (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))
(TLA.tuple (TLA.Fcn a_E0a ((a_e0a) (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) a_e0a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) a_e0a))))
(TLA.Fcn a_E1a ((a_e1a) (TLA.cond (/\ (TLA.in NONE
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
(TLA.in NONE
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))) (TLA.set NONE) (TLA.setminus (TLA.cup (matchLocks a_c1a
a_c2a a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
(TLA.set NONE))))))))
$hyp "v'80" (\/ (TLA.in (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0)) UU)
(= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_l1a (TLA.fapply TLA.Succ 0))))
$hyp "v'81" (= (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_l1a (TLA.fapply TLA.Succ 0)))
$hyp "v'82" (TLA.bAll a_E0a ((k) (/\ (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_l1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_l1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))
(\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_l1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_l1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset)))))
$hyp "v'83" (TLA.bAll a_E1a ((a_e1a) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a)
(TLA.set NONE)) (TLA.subseteq (matchLocks a_c1a a_l1a a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_l1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a)))))
$hyp "v'84" (TLA.bAll a_E1a ((a_e1a) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a)
(TLA.set NONE)) (TLA.subseteq (matchLocks a_c2a a_l1a a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_l1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a)))))
$goal (/\ (TLA.bEx a_p1a ((a_c1a_1) (/\ (\/ (TLA.in (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ 0))
(TLA.fapply a_l1a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_l1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_l1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE)) (TLA.subseteq (matchLocks a_c1a_1 a_l1a e)
(TLA.fapply (TLA.fapply (TLA.fapply a_l1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))))
(TLA.bEx a_p2a ((a_c2a_1) (/\ (\/ (TLA.in (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ 0))
(TLA.fapply a_l1a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_l1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_l1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE)) (TLA.subseteq (matchLocks a_c2a_1 a_l1a e)
(TLA.fapply (TLA.fapply (TLA.fapply a_l1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)))))))))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Hj:"bAll(a_E0a, (\<lambda>k. ((((((a_c1a[2])[1])[k])=(((a_l1a[2])[1])[k]))|((((a_l1a[2])[1])[k])={}))&(((((a_c2a[2])[1])[k])=(((a_l1a[2])[1])[k]))|((((a_l1a[2])[1])[k])={})))))" (is "?z_hj")
 using v'82 by blast
 have z_He:"(a_c1a \\in a_p1a)" (is "?z_he")
 using a_c1a_in by blast
 have z_Hh:"(((a_c1a[1]) \\in UU)|((a_c1a[1])=(a_l1a[1])))" (is "?z_hbm|?z_hbp")
 using v'80 by blast
 have z_Hk:"bAll(a_E1a, (\<lambda>a_e1a. (((((a_c1a[2])[2])[a_e1a])={NONE})|(matchLocks(a_c1a, a_l1a, a_e1a) \\subseteq (((a_l1a[2])[2])[a_e1a])))))" (is "?z_hk")
 using v'83 by blast
 have z_Hf:"(a_c2a \\in a_p2a)" (is "?z_hf")
 using a_c2a_in by blast
 have z_Hi:"((a_c2a[1])=(a_l1a[1]))" (is "?z_hcf=?z_hbq")
 using v'81 by blast
 have z_Hl:"bAll(a_E1a, (\<lambda>a_e1a. (((((a_c2a[2])[2])[a_e1a])={NONE})|(matchLocks(a_c2a, a_l1a, a_e1a) \\subseteq (((a_l1a[2])[2])[a_e1a])))))" (is "?z_hl")
 using v'84 by blast
 have zenon_L1_: "(~bAll(a_E0a, (\<lambda>k. (((((a_c2a[2])[1])[k])=(((a_l1a[2])[1])[k]))|((((a_l1a[2])[1])[k])={}))))) ==> (\\A x:((x \\in a_E0a)=>((((((a_c1a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={}))&(((((a_c2a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={}))))) ==> FALSE" (is "?z_hcn ==> ?z_hcq ==> FALSE")
 proof -
  assume z_Hcn:"?z_hcn" (is "~?z_hco")
  assume z_Hcq:"?z_hcq" (is "\\A x : ?z_hdd(x)")
  have z_Hde_z_Hcn: "(~(\\A x:((x \\in a_E0a)=>(((((a_c2a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={}))))) == ?z_hcn" (is "?z_hde == _")
  by (unfold bAll_def)
  have z_Hde: "?z_hde" (is "~(\\A x : ?z_hdh(x))")
  by (unfold z_Hde_z_Hcn, fact z_Hcn)
  have z_Hdi: "(\\E x:(~((x \\in a_E0a)=>(((((a_c2a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={})))))" (is "\\E x : ?z_hdk(x)")
  by (rule zenon_notallex_0 [of "?z_hdh", OF z_Hde])
  have z_Hdl: "?z_hdk((CHOOSE x:(~((x \\in a_E0a)=>(((((a_c2a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={}))))))" (is "~(?z_hdn=>?z_hdo)")
  by (rule zenon_ex_choose_0 [of "?z_hdk", OF z_Hdi])
  have z_Hdn: "?z_hdn"
  by (rule zenon_notimply_0 [OF z_Hdl])
  have z_Hdp: "(~?z_hdo)" (is "~(?z_hdq|?z_hdr)")
  by (rule zenon_notimply_1 [OF z_Hdl])
  have z_Hds: "((((a_c2a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((a_c2a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={})))))])~=(((a_l1a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((a_c2a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={})))))]))" (is "?z_hdt~=?z_hdu")
  by (rule zenon_notor_0 [OF z_Hdp])
  have z_Hdv: "(?z_hdu~={})"
  by (rule zenon_notor_1 [OF z_Hdp])
  have z_Hdw: "?z_hdd((CHOOSE x:(~((x \\in a_E0a)=>(((((a_c2a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={}))))))" (is "_=>?z_hdx")
  by (rule zenon_all_0 [of "?z_hdd" "(CHOOSE x:(~((x \\in a_E0a)=>(((((a_c2a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={})))))", OF z_Hcq])
  show FALSE
  proof (rule zenon_imply [OF z_Hdw])
   assume z_Hdy:"(~?z_hdn)"
   show FALSE
   by (rule notE [OF z_Hdy z_Hdn])
  next
   assume z_Hdx:"?z_hdx" (is "?z_hdz&_")
   have z_Hdo: "?z_hdo"
   by (rule zenon_and_1 [OF z_Hdx])
   show FALSE
   proof (rule zenon_or [OF z_Hdo])
    assume z_Hdq:"?z_hdq"
    show FALSE
    by (rule notE [OF z_Hds z_Hdq])
   next
    assume z_Hdr:"?z_hdr"
    show FALSE
    by (rule notE [OF z_Hdv z_Hdr])
   qed
  qed
 qed
 assume z_Hm:"(~(bEx(a_p1a, (\<lambda>a_c1a_1. ((((a_c1a_1[1]) \\in UU)|((a_c1a_1[1])=?z_hbq))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a_1[2])[1])[k])=(((a_l1a[2])[1])[k]))|((((a_l1a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a_1[2])[2])[e])={NONE})|(matchLocks(a_c1a_1, a_l1a, e) \\subseteq (((a_l1a[2])[2])[e])))))))))&bEx(a_p2a, (\<lambda>a_c1a_1. ((((a_c1a_1[1]) \\in UU)|((a_c1a_1[1])=?z_hbq))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a_1[2])[1])[k])=(((a_l1a[2])[1])[k]))|((((a_l1a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a_1[2])[2])[e])={NONE})|(matchLocks(a_c1a_1, a_l1a, e) \\subseteq (((a_l1a[2])[2])[e])))))))))))" (is "~(?z_heb&?z_hfb)")
 have z_Hcq_z_Hj: "(\\A x:((x \\in a_E0a)=>((((((a_c1a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={}))&(((((a_c2a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={}))))) == ?z_hj" (is "?z_hcq == _")
 by (unfold bAll_def)
 have z_Hcq: "?z_hcq" (is "\\A x : ?z_hdd(x)")
 by (unfold z_Hcq_z_Hj, fact z_Hj)
 show FALSE
 proof (rule zenon_notand [OF z_Hm])
  assume z_Hfc:"(~?z_heb)"
  have z_Hfd: "(~((?z_hbm|?z_hbp)&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((a_l1a[2])[1])[k]))|((((a_l1a[2])[1])[k])={}))))&?z_hk)))" (is "~(?z_hh&?z_hff)")
  by (rule zenon_notex_in_0 [of "a_p1a" "(\<lambda>a_c1a_1. ((((a_c1a_1[1]) \\in UU)|((a_c1a_1[1])=?z_hbq))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a_1[2])[1])[k])=(((a_l1a[2])[1])[k]))|((((a_l1a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a_1[2])[2])[e])={NONE})|(matchLocks(a_c1a_1, a_l1a, e) \\subseteq (((a_l1a[2])[2])[e]))))))))", OF z_Hfc z_He])
  show FALSE
  proof (rule zenon_notand [OF z_Hfd])
   assume z_Hfi:"(~?z_hh)"
   show FALSE
   by (rule notE [OF z_Hfi z_Hh])
  next
   assume z_Hfj:"(~?z_hff)" (is "~(?z_hfg&_)")
   show FALSE
   proof (rule zenon_notand [OF z_Hfj])
    assume z_Hfk:"(~?z_hfg)"
    have z_Hfl_z_Hfk: "(~(\\A x:((x \\in a_E0a)=>(((((a_c1a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={}))))) == (~?z_hfg)" (is "?z_hfl == ?z_hfk")
    by (unfold bAll_def)
    have z_Hfl: "?z_hfl" (is "~(\\A x : ?z_hfo(x))")
    by (unfold z_Hfl_z_Hfk, fact z_Hfk)
    have z_Hfp: "(\\E x:(~((x \\in a_E0a)=>(((((a_c1a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={})))))" (is "\\E x : ?z_hfr(x)")
    by (rule zenon_notallex_0 [of "?z_hfo", OF z_Hfl])
    have z_Hfs: "?z_hfr((CHOOSE x:(~((x \\in a_E0a)=>(((((a_c1a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={}))))))" (is "~(?z_hfu=>?z_hfv)")
    by (rule zenon_ex_choose_0 [of "?z_hfr", OF z_Hfp])
    have z_Hfu: "?z_hfu"
    by (rule zenon_notimply_0 [OF z_Hfs])
    have z_Hfw: "(~?z_hfv)" (is "~(?z_hfx|?z_hfy)")
    by (rule zenon_notimply_1 [OF z_Hfs])
    have z_Hfz: "((((a_c1a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((a_c1a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={})))))])~=(((a_l1a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((a_c1a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={})))))]))" (is "?z_hga~=?z_hgb")
    by (rule zenon_notor_0 [OF z_Hfw])
    have z_Hgc: "(?z_hgb~={})"
    by (rule zenon_notor_1 [OF z_Hfw])
    have z_Hgd: "?z_hdd((CHOOSE x:(~((x \\in a_E0a)=>(((((a_c1a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={}))))))" (is "_=>?z_hge")
    by (rule zenon_all_0 [of "?z_hdd" "(CHOOSE x:(~((x \\in a_E0a)=>(((((a_c1a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={})))))", OF z_Hcq])
    show FALSE
    proof (rule zenon_imply [OF z_Hgd])
     assume z_Hgf:"(~?z_hfu)"
     show FALSE
     by (rule notE [OF z_Hgf z_Hfu])
    next
     assume z_Hge:"?z_hge" (is "_&?z_hgg")
     have z_Hfv: "?z_hfv"
     by (rule zenon_and_0 [OF z_Hge])
     show FALSE
     proof (rule zenon_or [OF z_Hfv])
      assume z_Hfx:"?z_hfx"
      show FALSE
      by (rule notE [OF z_Hfz z_Hfx])
     next
      assume z_Hfy:"?z_hfy"
      show FALSE
      by (rule notE [OF z_Hgc z_Hfy])
     qed
    qed
   next
    assume z_Hgh:"(~?z_hk)"
    show FALSE
    by (rule notE [OF z_Hgh z_Hk])
   qed
  qed
 next
  assume z_Hgi:"(~?z_hfb)"
  have z_Hgj: "(~(((?z_hcf \\in UU)|(?z_hcf=?z_hbq))&(bAll(a_E0a, (\<lambda>k. (((((a_c2a[2])[1])[k])=(((a_l1a[2])[1])[k]))|((((a_l1a[2])[1])[k])={}))))&?z_hl)))" (is "~(?z_hgl&?z_hgn)")
  by (rule zenon_notex_in_0 [of "a_p2a" "(\<lambda>a_c1a_1. ((((a_c1a_1[1]) \\in UU)|((a_c1a_1[1])=?z_hbq))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a_1[2])[1])[k])=(((a_l1a[2])[1])[k]))|((((a_l1a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a_1[2])[2])[e])={NONE})|(matchLocks(a_c1a_1, a_l1a, e) \\subseteq (((a_l1a[2])[2])[e]))))))))", OF z_Hgi z_Hf])
  show FALSE
  proof (rule zenon_notand [OF z_Hgj])
   assume z_Hgo:"(~?z_hgl)" (is "~(?z_hgm|?z_hi)")
   have z_Hgp: "(?z_hcf~=?z_hbq)"
   by (rule zenon_notor_1 [OF z_Hgo])
   show FALSE
   by (rule notE [OF z_Hgp z_Hi])
  next
   assume z_Hgq:"(~?z_hgn)" (is "~(?z_hco&_)")
   show FALSE
   proof (rule zenon_notand [OF z_Hgq])
    assume z_Hcn:"(~?z_hco)"
    show FALSE
    by (rule zenon_L1_ [OF z_Hcn z_Hcq])
   next
    assume z_Hgr:"(~?z_hl)"
    show FALSE
    by (rule notE [OF z_Hgr z_Hl])
   qed
  qed
 qed
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 818"; *} qed
lemma ob'963:
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
fixes a_l1a
assumes a_l1a_in : "(a_l1a \<in> (l))"
fixes a_c1a
assumes a_c1a_in : "(a_c1a \<in> (a_p1a))"
fixes a_c2a
assumes a_c2a_in : "(a_c2a \<in> (a_p2a))"
fixes a_e1a
assumes a_e1a_in : "(a_e1a \<in> (a_E1a))"
assumes v'90: "((({(fapply ((a_l1a), ((Succ[0]))))}) = (UU)))"
assumes v'91: "(\<forall> a_e1a_1 \<in> (a_E1a) : (((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a_1))) \<inter> (UU))) = ({}))) & ((((matchLocks ((a_c1a), (a_l1a), (a_e1a_1)))) = (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a_1)))))) | ((((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a_1))) \<inter> (UU))) \<noteq> ({}))) & ((((matchLocks ((a_c1a), (a_l1a), (a_e1a_1)))) = (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a_1))) \\ (UU))) \<union> ({(fapply ((a_l1a), ((Succ[0]))))}))))))))"
shows "((((matchLocks ((a_c1a), (a_l1a), (a_e1a)))) = (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a)))))"(is "PROP ?ob'963")
proof -
ML_command {* writeln "*** TLAPS ENTER 963"; *}
show "PROP ?ob'963"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_001f4b.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_001f4b.znn.out
;; obligation #963
$hyp "a_p1a_in" (TLA.in a_p1a PoliciesSet)
$hyp "a_p2a_in" (TLA.in a_p2a PoliciesSet)
$hyp "l_in" (TLA.in l PoliciesSet)
$hyp "a_l1a_in" (TLA.in a_l1a l)
$hyp "a_c1a_in" (TLA.in a_c1a a_p1a)
$hyp "a_c2a_in" (TLA.in a_c2a a_p2a)
$hyp "a_e1a_in" (TLA.in a_e1a a_E1a)
$hyp "v'90" (= (TLA.set (TLA.fapply a_l1a (TLA.fapply TLA.Succ 0)))
UU)
$hyp "v'91" (TLA.bAll a_E1a ((a_e1a_1) (\/ (/\ (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a_1)
UU) TLA.emptyset) (= (matchLocks a_c1a a_l1a a_e1a_1)
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a_1)))
(/\ (-. (= (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a_1)
UU) TLA.emptyset)) (= (matchLocks a_c1a a_l1a a_e1a_1)
(TLA.cup (TLA.setminus (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a_1)
UU)
(TLA.set (TLA.fapply a_l1a (TLA.fapply TLA.Succ 0)))))))))
$goal (= (matchLocks a_c1a a_l1a a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Hh:"({(a_l1a[1])}=UU)" (is "?z_hk=_")
 using v'90 by blast
 have z_Hi:"bAll(a_E1a, (\<lambda>a_e1a_1. (((((((a_c1a[2])[2])[a_e1a_1]) \\cap UU)={})&(matchLocks(a_c1a, a_l1a, a_e1a_1)=(((a_c1a[2])[2])[a_e1a_1])))|((((((a_c1a[2])[2])[a_e1a_1]) \\cap UU)~={})&(matchLocks(a_c1a, a_l1a, a_e1a_1)=(((((a_c1a[2])[2])[a_e1a_1]) \\ UU) \\cup ?z_hk))))))" (is "?z_hi")
 using v'91 by blast
 have z_Hg:"(a_e1a \\in a_E1a)" (is "?z_hg")
 using a_e1a_in by blast
 assume z_Hj:"(matchLocks(a_c1a, a_l1a, a_e1a)~=(((a_c1a[2])[2])[a_e1a]))" (is "?z_hbk~=?z_hbl")
 have z_Hbm: "((((?z_hbl \\cap UU)={})&(?z_hbk=?z_hbl))|(((?z_hbl \\cap UU)~={})&(?z_hbk=((?z_hbl \\ UU) \\cup ?z_hk))))" (is "?z_hbn|?z_hbr")
 by (rule zenon_all_in_0 [of "a_E1a" "(\<lambda>a_e1a_1. (((((((a_c1a[2])[2])[a_e1a_1]) \\cap UU)={})&(matchLocks(a_c1a, a_l1a, a_e1a_1)=(((a_c1a[2])[2])[a_e1a_1])))|((((((a_c1a[2])[2])[a_e1a_1]) \\cap UU)~={})&(matchLocks(a_c1a, a_l1a, a_e1a_1)=(((((a_c1a[2])[2])[a_e1a_1]) \\ UU) \\cup ?z_hk)))))", OF z_Hi z_Hg])
 show FALSE
 proof (rule zenon_or [OF z_Hbm])
  assume z_Hbn:"?z_hbn" (is "?z_hbo&?z_hbq")
  have z_Hbq: "?z_hbq"
  by (rule zenon_and_1 [OF z_Hbn])
  show FALSE
  by (rule notE [OF z_Hj z_Hbq])
 next
  assume z_Hbr:"?z_hbr" (is "?z_hbs&?z_hbt")
  have z_Hbs: "?z_hbs" (is "?z_hbp~=_")
  by (rule zenon_and_0 [OF z_Hbr])
  have z_Hbt: "?z_hbt" (is "_=?z_hbu")
  by (rule zenon_and_1 [OF z_Hbr])
  have z_Hbw: "((?z_hbl \\cap ?z_hk)~={})" (is "?z_hbx~=_")
  by (rule ssubst [where P="(\<lambda>zenon_Vsqd. ((?z_hbl \\cap zenon_Vsqd)~={}))", OF z_Hh z_Hbs])
  show FALSE
  proof (rule notE [OF z_Hj])
   have z_Hcc: "(?z_hbu=?z_hbl)"
   proof (rule zenon_nnpp [of "(?z_hbu=?z_hbl)"])
    assume z_Hcd:"(?z_hbu~=?z_hbl)"
    have z_Hce: "(~(\\A zenon_Vua:((zenon_Vua \\in ?z_hbx)<=>(zenon_Vua \\in {}))))" (is "~(\\A x : ?z_hck(x))")
    by (rule zenon_notsetequal_0 [of "?z_hbx" "{}", OF z_Hbw])
    have z_Hcl: "(\\E zenon_Vua:(~((zenon_Vua \\in ?z_hbx)<=>(zenon_Vua \\in {}))))" (is "\\E x : ?z_hcn(x)")
    by (rule zenon_notallex_0 [of "?z_hck", OF z_Hce])
    have z_Hco: "?z_hcn((CHOOSE zenon_Vua:(~((zenon_Vua \\in ?z_hbx)<=>(zenon_Vua \\in {})))))" (is "~(?z_hcq<=>?z_hcr)")
    by (rule zenon_ex_choose_0 [of "?z_hcn", OF z_Hcl])
    show FALSE
    proof (rule zenon_notequiv [OF z_Hco])
     assume z_Hcs:"(~?z_hcq)"
     assume z_Hcr:"?z_hcr"
     show FALSE
     by (rule zenon_in_emptyset [of "(CHOOSE zenon_Vua:(~((zenon_Vua \\in ?z_hbx)<=>(zenon_Vua \\in {}))))", OF z_Hcr])
    next
     assume z_Hcq:"?z_hcq"
     assume z_Hct:"(~?z_hcr)"
     have z_Hcu: "((CHOOSE zenon_Vua:(~((zenon_Vua \\in ?z_hbx)<=>(zenon_Vua \\in {})))) \\in ?z_hbl)" (is "?z_hcu")
     by (rule zenon_in_cap_0 [of "(CHOOSE zenon_Vua:(~((zenon_Vua \\in ?z_hbx)<=>(zenon_Vua \\in {}))))" "?z_hbl" "?z_hk", OF z_Hcq])
     have z_Hcv: "((CHOOSE zenon_Vua:(~((zenon_Vua \\in ?z_hbx)<=>(zenon_Vua \\in {})))) \\in ?z_hk)" (is "?z_hcv")
     by (rule zenon_in_cap_1 [of "(CHOOSE zenon_Vua:(~((zenon_Vua \\in ?z_hbx)<=>(zenon_Vua \\in {}))))" "?z_hbl" "?z_hk", OF z_Hcq])
     show FALSE
     proof (rule zenon_in_addElt [of "(CHOOSE zenon_Vua:(~((zenon_Vua \\in ?z_hbx)<=>(zenon_Vua \\in {}))))" "(a_l1a[1])" "{}", OF z_Hcv])
      assume z_Hcx:"((CHOOSE zenon_Vua:(~((zenon_Vua \\in ?z_hbx)<=>(zenon_Vua \\in {}))))=(a_l1a[1]))" (is "?z_hcp=?z_hl")
      have z_Hcy: "(~(\\A zenon_Vya:((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl))))" (is "~(\\A x : ?z_hde(x))")
      by (rule zenon_notsetequal_0 [of "?z_hbu" "?z_hbl", OF z_Hcd])
      have z_Hdf: "(\\E zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl))))" (is "\\E x : ?z_hdh(x)")
      by (rule zenon_notallex_0 [of "?z_hde", OF z_Hcy])
      have z_Hdi: "?z_hdh((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl)))))" (is "~(?z_hdk<=>?z_hdl)")
      by (rule zenon_ex_choose_0 [of "?z_hdh", OF z_Hdf])
      show FALSE
      proof (rule zenon_notequiv [OF z_Hdi])
       assume z_Hdm:"(~?z_hdk)"
       assume z_Hdl:"?z_hdl"
       have z_Hdn: "(~((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl)))) \\in (?z_hbl \\ UU)))" (is "~?z_hdo")
       by (rule zenon_notin_cup_0 [of "(CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl))))" "(?z_hbl \\ UU)" "?z_hk", OF z_Hdm])
       have z_Hdp: "(~((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl)))) \\in ?z_hk))" (is "~?z_hdq")
       by (rule zenon_notin_cup_1 [of "(CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl))))" "(?z_hbl \\ UU)" "?z_hk", OF z_Hdm])
       show FALSE
       proof (rule zenon_notin_setminus [of "(CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl))))" "?z_hbl" "UU", OF z_Hdn])
        assume z_Hdr:"(~?z_hdl)"
        show FALSE
        by (rule notE [OF z_Hdr z_Hdl])
       next
        assume z_Hds:"((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl)))) \\in UU)" (is "?z_hds")
        have z_Hdq: "?z_hdq"
        by (rule ssubst [where P="(\<lambda>zenon_Vupd. ((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl)))) \\in zenon_Vupd))", OF z_Hh z_Hds])
        show FALSE
        by (rule notE [OF z_Hdp z_Hdq])
       qed
      next
       assume z_Hdk:"?z_hdk"
       assume z_Hdr:"(~?z_hdl)"
       show FALSE
       proof (rule zenon_in_cup [of "(CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl))))" "(?z_hbl \\ UU)" "?z_hk", OF z_Hdk])
        assume z_Hdo:"((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl)))) \\in (?z_hbl \\ UU))" (is "?z_hdo")
        have z_Hdl: "?z_hdl"
        by (rule zenon_in_setminus_0 [of "(CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl))))" "?z_hbl" "UU", OF z_Hdo])
        show FALSE
        by (rule notE [OF z_Hdr z_Hdl])
       next
        assume z_Hdq:"((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl)))) \\in ?z_hk)" (is "?z_hdq")
        show FALSE
        proof (rule zenon_in_addElt [of "(CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl))))" "?z_hl" "{}", OF z_Hdq])
         assume z_Hdw:"((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl))))=?z_hl)" (is "?z_hdj=_")
         show FALSE
         proof (rule notE [OF z_Hdr])
          have z_Hdx: "(?z_hcp=?z_hdj)"
          proof (rule zenon_nnpp [of "(?z_hcp=?z_hdj)"])
           assume z_Hdy:"(?z_hcp~=?z_hdj)"
           show FALSE
           proof (rule notE [OF z_Hdy])
            have z_Hdz: "(?z_hl=?z_hdj)"
            by (rule sym [OF z_Hdw])
            have z_Hdx: "(?z_hcp=?z_hdj)"
            by (rule subst [where P="(\<lambda>zenon_Vvqd. (?z_hcp=zenon_Vvqd))", OF z_Hdz], fact z_Hcx)
            thus "(?z_hcp=?z_hdj)" .
           qed
          qed
          have z_Hdl: "?z_hdl"
          by (rule subst [where P="(\<lambda>zenon_Vxpd. (zenon_Vxpd \\in ?z_hbl))", OF z_Hdx], fact z_Hcu)
          thus "?z_hdl" .
         qed
        next
         assume z_Heg:"((CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl)))) \\in {})" (is "?z_heg")
         show FALSE
         by (rule zenon_in_emptyset [of "(CHOOSE zenon_Vya:(~((zenon_Vya \\in ?z_hbu)<=>(zenon_Vya \\in ?z_hbl))))", OF z_Heg])
        qed
       qed
      qed
     next
      assume z_Heh:"((CHOOSE zenon_Vua:(~((zenon_Vua \\in ?z_hbx)<=>(zenon_Vua \\in {})))) \\in {})" (is "?z_heh")
      show FALSE
      by (rule zenon_in_emptyset [of "(CHOOSE zenon_Vua:(~((zenon_Vua \\in ?z_hbx)<=>(zenon_Vua \\in {}))))", OF z_Heh])
     qed
    qed
   qed
   have z_Hbq: "(?z_hbk=?z_hbl)"
   by (rule subst [where P="(\<lambda>zenon_Vxqd. (?z_hbk=zenon_Vxqd))", OF z_Hcc], fact z_Hbt)
   thus "(?z_hbk=?z_hbl)" .
  qed
 qed
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 963"; *} qed
lemma ob'901:
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
(* usable definition matchLocks suppressed *)
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
fixes a_l1a
assumes a_l1a_in : "(a_l1a \<in> (l))"
fixes a_c1a
assumes a_c1a_in : "(a_c1a \<in> (a_p1a))"
fixes a_c2a
assumes a_c2a_in : "(a_c2a \<in> (a_p2a))"
assumes v'80: "(((a_l1a) = (<<(fapply ((a_c1a), ((Succ[0])))), (<<([ a_e0a \<in> (a_E0a)  \<mapsto> (((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (a_e0a))) \<inter> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (a_e0a)))))]), ([ a_e1a \<in> (a_E1a)  \<mapsto> (cond((((((NONE) \<in> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))) \<and> (((NONE) \<in> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))))), ({(NONE)}), ((((((matchLocks ((a_c2a), (a_c1a), (a_e1a)))) \<union> (fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))))) \\ ({(NONE)})))))])>>)>>)))"
assumes v'81: "(((((fapply ((a_c2a), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c2a), ((Succ[0])))) = (fapply ((a_l1a), ((Succ[0]))))))))"
assumes v'82: "(((fapply ((a_c1a), ((Succ[0])))) = (fapply ((a_l1a), ((Succ[0]))))))"
assumes v'83: "(\<forall> k \<in> (a_E0a) : (((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_l1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_l1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({})))) & ((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_l1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_l1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))))"
assumes v'84: "(\<forall> a_e1a \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))) = ({(NONE)}))) | ((((matchLocks ((a_c2a), (a_l1a), (a_e1a)))) \<subseteq> (fapply ((fapply ((fapply ((a_l1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a)))))))"
assumes v'85: "(\<forall> a_e1a \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a))) = ({(NONE)}))) | ((((matchLocks ((a_c1a), (a_l1a), (a_e1a)))) \<subseteq> (fapply ((fapply ((fapply ((a_l1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (a_e1a)))))))"
shows "((\<exists> a_c1a_1 \<in> (a_p1a) : ((((((fapply ((a_c1a_1), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c1a_1), ((Succ[0])))) = (fapply ((a_l1a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_l1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_l1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c1a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | ((((matchLocks ((a_c1a_1), (a_l1a), (e)))) \<subseteq> (fapply ((fapply ((fapply ((a_l1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))) & (\<exists> a_c2a_1 \<in> (a_p2a) : ((((((fapply ((a_c2a_1), ((Succ[0])))) \<in> (UU))) \<or> (((fapply ((a_c2a_1), ((Succ[0])))) = (fapply ((a_l1a), ((Succ[0])))))))) & (\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_l1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_l1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({}))))) & (\<forall> e \<in> (a_E1a) : ((((fapply ((fapply ((fapply ((a_c2a_1), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | ((((matchLocks ((a_c2a_1), (a_l1a), (e)))) \<subseteq> (fapply ((fapply ((fapply ((a_l1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))))))"(is "PROP ?ob'901")
proof -
ML_command {* writeln "*** TLAPS ENTER 901"; *}
show "PROP ?ob'901"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_56372c.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_56372c.znn.out
;; obligation #901
$hyp "a_p1a_in" (TLA.in a_p1a PoliciesSet)
$hyp "a_p2a_in" (TLA.in a_p2a PoliciesSet)
$hyp "l_in" (TLA.in l PoliciesSet)
$hyp "a_l1a_in" (TLA.in a_l1a l)
$hyp "a_c1a_in" (TLA.in a_c1a a_p1a)
$hyp "a_c2a_in" (TLA.in a_c2a a_p2a)
$hyp "v'80" (= a_l1a (TLA.tuple (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.tuple (TLA.Fcn a_E0a ((a_e0a) (TLA.cap (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) a_e0a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) a_e0a))))
(TLA.Fcn a_E1a ((a_e1a) (TLA.cond (/\ (TLA.in NONE
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
(TLA.in NONE
(TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))) (TLA.set NONE) (TLA.setminus (TLA.cup (matchLocks a_c2a
a_c1a a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a))
(TLA.set NONE))))))))
$hyp "v'81" (\/ (TLA.in (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0)) UU)
(= (TLA.fapply a_c2a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_l1a (TLA.fapply TLA.Succ 0))))
$hyp "v'82" (= (TLA.fapply a_c1a (TLA.fapply TLA.Succ 0))
(TLA.fapply a_l1a (TLA.fapply TLA.Succ 0)))
$hyp "v'83" (TLA.bAll a_E0a ((k) (/\ (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_l1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_l1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))
(\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_l1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_l1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset)))))
$hyp "v'84" (TLA.bAll a_E1a ((a_e1a) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a)
(TLA.set NONE)) (TLA.subseteq (matchLocks a_c2a a_l1a a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_l1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a)))))
$hyp "v'85" (TLA.bAll a_E1a ((a_e1a) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a)
(TLA.set NONE)) (TLA.subseteq (matchLocks a_c1a a_l1a a_e1a)
(TLA.fapply (TLA.fapply (TLA.fapply a_l1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) a_e1a)))))
$goal (/\ (TLA.bEx a_p1a ((a_c1a_1) (/\ (\/ (TLA.in (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ 0))
(TLA.fapply a_l1a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_l1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_l1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c1a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE)) (TLA.subseteq (matchLocks a_c1a_1 a_l1a e)
(TLA.fapply (TLA.fapply (TLA.fapply a_l1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e))))))))
(TLA.bEx a_p2a ((a_c2a_1) (/\ (\/ (TLA.in (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ 0))
UU) (= (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ 0))
(TLA.fapply a_l1a (TLA.fapply TLA.Succ 0))))
(TLA.bAll a_E0a ((k) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
(TLA.fapply (TLA.fapply (TLA.fapply a_l1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k))
(= (TLA.fapply (TLA.fapply (TLA.fapply a_l1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ 0)) k)
TLA.emptyset))))
(TLA.bAll a_E1a ((e) (\/ (= (TLA.fapply (TLA.fapply (TLA.fapply a_c2a_1 (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)
(TLA.set NONE)) (TLA.subseteq (matchLocks a_c2a_1 a_l1a e)
(TLA.fapply (TLA.fapply (TLA.fapply a_l1a (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) (TLA.fapply TLA.Succ (TLA.fapply TLA.Succ 0))) e)))))))))
END ZENON  INPUT *)
(* PROOF-FOUND *)
(* BEGIN-PROOF *)
proof (rule zenon_nnpp)
 have z_Hj:"bAll(a_E0a, (\<lambda>k. ((((((a_c1a[2])[1])[k])=(((a_l1a[2])[1])[k]))|((((a_l1a[2])[1])[k])={}))&(((((a_c2a[2])[1])[k])=(((a_l1a[2])[1])[k]))|((((a_l1a[2])[1])[k])={})))))" (is "?z_hj")
 using v'83 by blast
 have z_He:"(a_c1a \\in a_p1a)" (is "?z_he")
 using a_c1a_in by blast
 have z_Hi:"((a_c1a[1])=(a_l1a[1]))" (is "?z_hbm=?z_hbn")
 using v'82 by blast
 have z_Hl:"bAll(a_E1a, (\<lambda>a_e1a. (((((a_c1a[2])[2])[a_e1a])={NONE})|(matchLocks(a_c1a, a_l1a, a_e1a) \\subseteq (((a_l1a[2])[2])[a_e1a])))))" (is "?z_hl")
 using v'85 by blast
 have z_Hf:"(a_c2a \\in a_p2a)" (is "?z_hf")
 using a_c2a_in by blast
 have z_Hh:"(((a_c2a[1]) \\in UU)|((a_c2a[1])=?z_hbn))" (is "?z_hcc|?z_hcf")
 using v'81 by blast
 have z_Hk:"bAll(a_E1a, (\<lambda>a_e1a. (((((a_c2a[2])[2])[a_e1a])={NONE})|(matchLocks(a_c2a, a_l1a, a_e1a) \\subseteq (((a_l1a[2])[2])[a_e1a])))))" (is "?z_hk")
 using v'84 by blast
 have zenon_L1_: "(~bAll(a_E0a, (\<lambda>k. (((((a_c2a[2])[1])[k])=(((a_l1a[2])[1])[k]))|((((a_l1a[2])[1])[k])={}))))) ==> (\\A x:((x \\in a_E0a)=>((((((a_c1a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={}))&(((((a_c2a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={}))))) ==> FALSE" (is "?z_hcn ==> ?z_hcq ==> FALSE")
 proof -
  assume z_Hcn:"?z_hcn" (is "~?z_hco")
  assume z_Hcq:"?z_hcq" (is "\\A x : ?z_hdd(x)")
  have z_Hde_z_Hcn: "(~(\\A x:((x \\in a_E0a)=>(((((a_c2a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={}))))) == ?z_hcn" (is "?z_hde == _")
  by (unfold bAll_def)
  have z_Hde: "?z_hde" (is "~(\\A x : ?z_hdh(x))")
  by (unfold z_Hde_z_Hcn, fact z_Hcn)
  have z_Hdi: "(\\E x:(~((x \\in a_E0a)=>(((((a_c2a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={})))))" (is "\\E x : ?z_hdk(x)")
  by (rule zenon_notallex_0 [of "?z_hdh", OF z_Hde])
  have z_Hdl: "?z_hdk((CHOOSE x:(~((x \\in a_E0a)=>(((((a_c2a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={}))))))" (is "~(?z_hdn=>?z_hdo)")
  by (rule zenon_ex_choose_0 [of "?z_hdk", OF z_Hdi])
  have z_Hdn: "?z_hdn"
  by (rule zenon_notimply_0 [OF z_Hdl])
  have z_Hdp: "(~?z_hdo)" (is "~(?z_hdq|?z_hdr)")
  by (rule zenon_notimply_1 [OF z_Hdl])
  have z_Hds: "((((a_c2a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((a_c2a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={})))))])~=(((a_l1a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((a_c2a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={})))))]))" (is "?z_hdt~=?z_hdu")
  by (rule zenon_notor_0 [OF z_Hdp])
  have z_Hdv: "(?z_hdu~={})"
  by (rule zenon_notor_1 [OF z_Hdp])
  have z_Hdw: "?z_hdd((CHOOSE x:(~((x \\in a_E0a)=>(((((a_c2a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={}))))))" (is "_=>?z_hdx")
  by (rule zenon_all_0 [of "?z_hdd" "(CHOOSE x:(~((x \\in a_E0a)=>(((((a_c2a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={})))))", OF z_Hcq])
  show FALSE
  proof (rule zenon_imply [OF z_Hdw])
   assume z_Hdy:"(~?z_hdn)"
   show FALSE
   by (rule notE [OF z_Hdy z_Hdn])
  next
   assume z_Hdx:"?z_hdx" (is "?z_hdz&_")
   have z_Hdo: "?z_hdo"
   by (rule zenon_and_1 [OF z_Hdx])
   show FALSE
   proof (rule zenon_or [OF z_Hdo])
    assume z_Hdq:"?z_hdq"
    show FALSE
    by (rule notE [OF z_Hds z_Hdq])
   next
    assume z_Hdr:"?z_hdr"
    show FALSE
    by (rule notE [OF z_Hdv z_Hdr])
   qed
  qed
 qed
 assume z_Hm:"(~(bEx(a_p1a, (\<lambda>a_c1a_1. ((((a_c1a_1[1]) \\in UU)|((a_c1a_1[1])=?z_hbn))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a_1[2])[1])[k])=(((a_l1a[2])[1])[k]))|((((a_l1a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a_1[2])[2])[e])={NONE})|(matchLocks(a_c1a_1, a_l1a, e) \\subseteq (((a_l1a[2])[2])[e])))))))))&bEx(a_p2a, (\<lambda>a_c1a_1. ((((a_c1a_1[1]) \\in UU)|((a_c1a_1[1])=?z_hbn))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a_1[2])[1])[k])=(((a_l1a[2])[1])[k]))|((((a_l1a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a_1[2])[2])[e])={NONE})|(matchLocks(a_c1a_1, a_l1a, e) \\subseteq (((a_l1a[2])[2])[e])))))))))))" (is "~(?z_heb&?z_hfb)")
 have z_Hcq_z_Hj: "(\\A x:((x \\in a_E0a)=>((((((a_c1a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={}))&(((((a_c2a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={}))))) == ?z_hj" (is "?z_hcq == _")
 by (unfold bAll_def)
 have z_Hcq: "?z_hcq" (is "\\A x : ?z_hdd(x)")
 by (unfold z_Hcq_z_Hj, fact z_Hj)
 show FALSE
 proof (rule zenon_notand [OF z_Hm])
  assume z_Hfc:"(~?z_heb)"
  have z_Hfd: "(~(((?z_hbm \\in UU)|(?z_hbm=?z_hbn))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a[2])[1])[k])=(((a_l1a[2])[1])[k]))|((((a_l1a[2])[1])[k])={}))))&?z_hl)))" (is "~(?z_hff&?z_hfh)")
  by (rule zenon_notex_in_0 [of "a_p1a" "(\<lambda>a_c1a_1. ((((a_c1a_1[1]) \\in UU)|((a_c1a_1[1])=?z_hbn))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a_1[2])[1])[k])=(((a_l1a[2])[1])[k]))|((((a_l1a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a_1[2])[2])[e])={NONE})|(matchLocks(a_c1a_1, a_l1a, e) \\subseteq (((a_l1a[2])[2])[e]))))))))", OF z_Hfc z_He])
  show FALSE
  proof (rule zenon_notand [OF z_Hfd])
   assume z_Hfk:"(~?z_hff)" (is "~(?z_hfg|?z_hi)")
   have z_Hfl: "(?z_hbm~=?z_hbn)"
   by (rule zenon_notor_1 [OF z_Hfk])
   show FALSE
   by (rule notE [OF z_Hfl z_Hi])
  next
   assume z_Hfm:"(~?z_hfh)" (is "~(?z_hfi&_)")
   show FALSE
   proof (rule zenon_notand [OF z_Hfm])
    assume z_Hfn:"(~?z_hfi)"
    have z_Hfo_z_Hfn: "(~(\\A x:((x \\in a_E0a)=>(((((a_c1a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={}))))) == (~?z_hfi)" (is "?z_hfo == ?z_hfn")
    by (unfold bAll_def)
    have z_Hfo: "?z_hfo" (is "~(\\A x : ?z_hfr(x))")
    by (unfold z_Hfo_z_Hfn, fact z_Hfn)
    have z_Hfs: "(\\E x:(~((x \\in a_E0a)=>(((((a_c1a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={})))))" (is "\\E x : ?z_hfu(x)")
    by (rule zenon_notallex_0 [of "?z_hfr", OF z_Hfo])
    have z_Hfv: "?z_hfu((CHOOSE x:(~((x \\in a_E0a)=>(((((a_c1a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={}))))))" (is "~(?z_hfx=>?z_hfy)")
    by (rule zenon_ex_choose_0 [of "?z_hfu", OF z_Hfs])
    have z_Hfx: "?z_hfx"
    by (rule zenon_notimply_0 [OF z_Hfv])
    have z_Hfz: "(~?z_hfy)" (is "~(?z_hga|?z_hgb)")
    by (rule zenon_notimply_1 [OF z_Hfv])
    have z_Hgc: "((((a_c1a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((a_c1a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={})))))])~=(((a_l1a[2])[1])[(CHOOSE x:(~((x \\in a_E0a)=>(((((a_c1a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={})))))]))" (is "?z_hgd~=?z_hge")
    by (rule zenon_notor_0 [OF z_Hfz])
    have z_Hgf: "(?z_hge~={})"
    by (rule zenon_notor_1 [OF z_Hfz])
    have z_Hgg: "?z_hdd((CHOOSE x:(~((x \\in a_E0a)=>(((((a_c1a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={}))))))" (is "_=>?z_hgh")
    by (rule zenon_all_0 [of "?z_hdd" "(CHOOSE x:(~((x \\in a_E0a)=>(((((a_c1a[2])[1])[x])=(((a_l1a[2])[1])[x]))|((((a_l1a[2])[1])[x])={})))))", OF z_Hcq])
    show FALSE
    proof (rule zenon_imply [OF z_Hgg])
     assume z_Hgi:"(~?z_hfx)"
     show FALSE
     by (rule notE [OF z_Hgi z_Hfx])
    next
     assume z_Hgh:"?z_hgh" (is "_&?z_hgj")
     have z_Hfy: "?z_hfy"
     by (rule zenon_and_0 [OF z_Hgh])
     show FALSE
     proof (rule zenon_or [OF z_Hfy])
      assume z_Hga:"?z_hga"
      show FALSE
      by (rule notE [OF z_Hgc z_Hga])
     next
      assume z_Hgb:"?z_hgb"
      show FALSE
      by (rule notE [OF z_Hgf z_Hgb])
     qed
    qed
   next
    assume z_Hgk:"(~?z_hl)"
    show FALSE
    by (rule notE [OF z_Hgk z_Hl])
   qed
  qed
 next
  assume z_Hgl:"(~?z_hfb)"
  have z_Hgm: "(~((?z_hcc|?z_hcf)&(bAll(a_E0a, (\<lambda>k. (((((a_c2a[2])[1])[k])=(((a_l1a[2])[1])[k]))|((((a_l1a[2])[1])[k])={}))))&?z_hk)))" (is "~(?z_hh&?z_hgo)")
  by (rule zenon_notex_in_0 [of "a_p2a" "(\<lambda>a_c1a_1. ((((a_c1a_1[1]) \\in UU)|((a_c1a_1[1])=?z_hbn))&(bAll(a_E0a, (\<lambda>k. (((((a_c1a_1[2])[1])[k])=(((a_l1a[2])[1])[k]))|((((a_l1a[2])[1])[k])={}))))&bAll(a_E1a, (\<lambda>e. (((((a_c1a_1[2])[2])[e])={NONE})|(matchLocks(a_c1a_1, a_l1a, e) \\subseteq (((a_l1a[2])[2])[e]))))))))", OF z_Hgl z_Hf])
  show FALSE
  proof (rule zenon_notand [OF z_Hgm])
   assume z_Hgp:"(~?z_hh)"
   show FALSE
   by (rule notE [OF z_Hgp z_Hh])
  next
   assume z_Hgq:"(~?z_hgo)" (is "~(?z_hco&_)")
   show FALSE
   proof (rule zenon_notand [OF z_Hgq])
    assume z_Hcn:"(~?z_hco)"
    show FALSE
    by (rule zenon_L1_ [OF z_Hcn z_Hcq])
   next
    assume z_Hgr:"(~?z_hk)"
    show FALSE
    by (rule notE [OF z_Hgr z_Hk])
   qed
  qed
 qed
qed
(* END-PROOF *)
ML_command {* writeln "*** TLAPS EXIT 901"; *} qed
lemma ob'1042:
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
shows "(\<forall> k \<in> (a_E0a) : ((((fapply ((fapply ((fapply ((u), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = (fapply ((fapply ((fapply ((a_y1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))))) | (((fapply ((fapply ((fapply ((a_y1a), ((Succ[Succ[0]])))), ((Succ[0])))), (k))) = ({})))))"(is "PROP ?ob'1042")
proof -
ML_command {* writeln "*** TLAPS ENTER 1042"; *}
show "PROP ?ob'1042"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_d2e14f.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_d2e14f.znn.out
;; obligation #1042
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
ML_command {* writeln "*** TLAPS EXIT 1042"; *} qed
lemma ob'1056:
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
shows "((((fapply ((fapply ((fapply ((u), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = ({(NONE)}))) | ((((matchLocks ((u), (a_y1a), (e)))) \<subseteq> (fapply ((fapply ((fapply ((a_y1a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))))"(is "PROP ?ob'1056")
proof -
ML_command {* writeln "*** TLAPS ENTER 1056"; *}
show "PROP ?ob'1056"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_d7f162.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_d7f162.znn.out
;; obligation #1056
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
ML_command {* writeln "*** TLAPS EXIT 1056"; *} qed
lemma ob'1068:
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
shows "(((fapply ((fapply ((fapply ((u), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))) = (cond(((((((((((matchLocks ((a_c1a), (a_c2a), (e)))) \<union> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \\ ({(NONE)}))) \\ (UU))) = ({}))), ((((((matchLocks ((a_c1a), (a_c2a), (e)))) \<union> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \\ ({(NONE)}))), ((((((((matchLocks ((a_c1a), (a_c2a), (e)))) \<union> (fapply ((fapply ((fapply ((a_c2a), ((Succ[Succ[0]])))), ((Succ[Succ[0]])))), (e))))) \\ ({(NONE)}))) \\ (UU)))))))"(is "PROP ?ob'1068")
proof -
ML_command {* writeln "*** TLAPS ENTER 1068"; *}
show "PROP ?ob'1068"

(* BEGIN ZENON INPUT
;; file=ParalocksLattice.tlaps/tlapm_aae54d.znn; PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/bin:/usr/local/lib/tlaps/bin'; zenon -p0 -x tla -oisar -max-time 1d "$file" >ParalocksLattice.tlaps/tlapm_aae54d.znn.out
;; obligation #1068
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
ML_command {* writeln "*** TLAPS EXIT 1068"; *} qed
end
