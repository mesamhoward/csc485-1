%Xin Serena Wen, wenxin6, 1000442666
index sub [] intro [case:type, num:number].
	type sub [nom, acc].
		nom sub [].
		acc sub [].
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

%%Lexicon
she ---> (np, head:(index:(case:nom))).
fed ---> v.
the ---> det.
dog ---> (n, index:(num:sg)).
puppies ---> (n, index:(num:pl)).
him ---> (np, head:(index:(case:acc))).
with ---> p.

%%rules

%%s -> NP VP
srule rule
s
===>
cat> (np, head:(index:(case:nom))),
cat> vp.

%%VP -> V NP
vprule rule
vp
===>
cat> v,
cat> (np, head:(index:(case:acc))).

%%PP -> P NP
pprule rule
pp
===>
cat> p,
cat> (np, head:(index:(case:acc))).

%%NP -> N
nrule rule
np
===>
cat> (n, index:(num:pl)).

%%NP -> N PP
n_pprule rule
(np, head:(index:(case:acc)))
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
(np, head:(index:(case:acc)))
===>
cat> det,
cat> n,
cat> pp.

