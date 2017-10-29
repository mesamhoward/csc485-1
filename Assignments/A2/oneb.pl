index sub [] intro [pro:pronoun, num:number].
	pronoun sub [nom, acc, nonpro].
		nom sub [].
		acc sub [].
		nonpro sub [].
	number sub [sg, pl].
		sg sub [].
		pl sub [].
cat sub [s, np, vp, pp].
s sub [].

p sub [].
pp sub [].

det sub [].

v sub [].
vp sub [].

n sub [] intro [index:index].
np sub [] intro [head:n].

%% Lexicon
she ---> (np, head:(index:(pro:nom))).
fed ---> v.
the ---> det.
dog ---> (np,head:(index:(pro:nonpro, num:sg))).
puppies ---> (np,head:(index:(pro:nonpro, num:pl))).
him ---> (np, head:(index:(pro:acc))).
with ---> p.

%%rules
srule rule
s
===>
cat> (np, head:(index:(pro:(nom;Nonpro)))),
cat> v.
%cat> np,
%cat> vp.

vprule rule
vp
===>
cat> v,
cat> np.

pprule rule
pp
===>
cat> p,
cat> np.

nrule rule
(np, head:(index:(pro:Nonpro)))
===>
cat> (n, index:(num:pl)).

n_pprule rule
np
===>
cat> (n, index:(num:pl)),
cat> pp.

detrule rule
(np, head:(index:(pro:Nonpro)))
===>
cat> det,
cat> (n, index:(pro:Nonpro)).

det_pprule rule
np
===>
cat> det,
cat> (n, index:(pro:nonpro)),
cat> pp.
