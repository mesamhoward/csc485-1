%Xin Serena Wen, wenxin6, 1000442666
index sub [] intro [num:number].
	number sub [sg, pl].
		sg sub [].
		pl sub [].
cat sub [s, np, vp, pp, n, v, p].
s sub [].

p sub [].
pp sub [].

det sub [].

v sub [].
vp sub [].

n sub [] intro [index:index].

np sub [] intro [head:n].
	type sub [nom, acc].
		nom sub [].
		acc sub [].

%%Lexicon
she ---> (np, case:nom, head:(index:(num:sg))).
fed ---> v.
the ---> det.
dog ---> (n, index:(num:sg)).
puppies ---> (n, index:(num:pl)).
him ---> (np, case:acc, head:(index:(num:sg))).
with ---> p.

%%rules

%%s -> NP VP
srule rule
s
===>
cat> (np, case:nom),
cat> vp.

%%VP -> V NP
vprule rule
vp
===>
cat> v,
cat> (np, case:acc).

%%PP -> P NP
pprule rule
pp
===>
cat> p,
cat> (np, case:acc).

%%NP -> N
nrule rule
np
===>
cat> (n, index:(num:pl)).

%%NP -> N PP
n_pprule rule
np
===>
cat> (n, index:(num:pl)),
cat> pp.

%%NP -> Det NP
detrule rule
np
===>
cat> det,
cat> n.

%%NP -> Det NP PP
det_pprule rule
np
===>
cat> det,
cat> n,
cat> pp.

