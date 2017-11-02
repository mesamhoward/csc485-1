%Xin Serena Wen, wenxin6, 1000442666
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

%%Lexicon
she ---> (np, head:(index:(pro:nom))).
fed ---> v.
the ---> det.
dog ---> (n, index:(pro:nonpro, num:sg)).
puppies ---> (n, index:(pro:nonpro, num:pl)).
him ---> (np, head:(index:(pro:acc))).
with ---> p.

%%rules
srule rule
s
===>
cat> (np, head:(index:(pro:(nom;nonpro)))),
cat> vp.

%VP
vprule rule
vp
===>
cat> v,
cat> (np, head:(index:(pro:(acc;nonpro)))).

%PP
pprule rule
pp
===>
cat> p,
cat> (np, head:(index:(pro:(acc;nonpro)))).

nrule rule
(np, head:(index:(pro:nonpro)))
===>
cat> (n, index:(num:pl)).

%Adding PP to Noun
n_pprule rule
(np, head:(index:(pro:(acc;nonpro))))
===>
cat> (n, index:(num:pl)),
cat> pp.

%%Adding det
detrule rule
(np, head:(index:(pro:nonpro)))
===>
cat> det,
cat> (n, index:(pro:nonpro)).

det_pprule rule
(np, head:(index:(pro:nonpro)))
===>
cat> det,
cat> (n, index:(pro:nonpro)),
cat> pp.
