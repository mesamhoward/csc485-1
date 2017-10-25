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

cat sub [s,np,vp].
s sub [].
np sub [] intro [index:index].
vp sub [] intro [subj:np].

i ---> (np,index:(p:fst,num:sing)).
john ---> (np,index:(p:trd,num:sing,g:m)).
walks ---> (vp,subj:index:(p:trd,num:sing)).
walk ---> (vp,subj:index:(p:fst)).

srule rule
s
===>
cat> (np,index:Index),
cat> (vp,subj:index:Index).


