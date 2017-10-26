%% CSC485H1/2501H:Computational Linguistics, Fall 2017, Gerald Penn%% 

:- ale_flag(subtypecover,_,off).

cat sub [phrase,subj_bearing,ref_bearing] intro [sem:sem].
  phrase sub [s,vp,np].
    vp intro [gap:index_or_none].
  subj_bearing sub [tv,vp,aux] intro [subj:index,vform:vform].
  ref_bearing sub [wh,np] intro [ref:index,case:case].
  tv intro [vform:vform,dobj:index].

index_or_none sub [index,none].
index intro [p:person,n:num,g:gend].
  person sub [first,second,third].
  num sub [sing,plural].
  gend sub [masc,fem,neut].
none sub [].

vform sub [fin,bse,modal].
  fin sub [].
  bse sub [].
sem sub [bin_relation,lambda,j,m].
bin_relation sub [like].
like sub [] intro [liker:index,liked:index].

case sub [nom,acc].

like ---> (tv,vform:bse,sem:(liker:Ind1,liked:Ind2),
          subj:Ind1,dobj:Ind2).
likes ---> (tv,vform:fin,sem:(liker:Ind1,liked:Ind2),
          subj:(Ind1,p:third,n:sing),dobj:Ind2).
does ---> (aux,vform:modal,subj:(p:third,n:sing)).
whom ---> (wh,sem:lambda,case:acc).
who ---> (wh,sem:lambda,ref:(p:third,n:sing)).
john ---> (np,ref:(p:third,g:masc,n:sing),sem:j).
mary ---> (np,ref:(p:third,g:fem,n:sing),sem:m).

subj_rule rule
(s,sem:VPSem)
===>
cat> (case:nom,ref:Subj),  % wh or otherwise
cat> (vp,subj:Subj,gap:none,sem:VPSem,vform:fin).

wh_dobj_rule rule
(s,sem:VPSem)
===>
cat> (wh,case:acc,ref:Gap),
cat> (aux,subj:Subj),
cat> (np,ref:Subj),
cat> (vp,vform:bse,gap:Gap,sem:VPSem,subj:Subj).

vp rule
(vp,gap:none,sem:VSem,subj:Subj,vform:VForm)
===>
cat> (tv,dobj:Obj,sem:VSem,subj:Subj,vform:VForm),
cat> (np,ref:Obj,case:acc).

vp_gap rule
(vp,gap:Gap,sem:VSem,subj:Subj,vform:VForm)
===>
cat> (tv,dobj:Gap,sem:VSem,subj:Subj,vform:VForm).

