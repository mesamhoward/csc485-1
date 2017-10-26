%% CSC485H1/2501H:Computational Linguistics, Fall 2017%% 


index sub [] intro [p:person,num:number,g:gend].
person sub [fst,snd,trd].
number sub [sing,plural].
gend sub [m,f,n].
fst sub [].
snd sub [].
trd sub [].
sing sub [].
plural sub [].
m sub [].
n sub [].
f sub [].

cat sub [s,np,vp,pp,p].
s sub [].
noun sub [] intro [index:index].
np sub [] intro [head:noun].
vp sub [] intro [subj:np].
pp sub [].
p sub [].

i ---> (noun,index:(p:fst,num:sing)).
john ---> (noun,index:(p:trd,num:sing,g:m)).
walks ---> (vp,subj:(head:(index:(p:trd,num:sing)))).
walk ---> (vp,subj:(head:(index:(p:fst)))).
with ---> p.
sam ---> (noun,index:(p:trd,num:sing,g:m)).

srule rule
s
===>
cat> (np,head:(index:Index)),
cat> (vp,subj:(head:(index:Index))).

prule rule
s
===>
cat> (np,head:(index:Index)),
cat> (vp,subj:(head:(index:Index))),
cat> pp.

pprule rule
pp
===>
cat> p,
cat> np.

npnrule rule
(np,head:(index:Index))
===>
cat> (noun,index:Index).
