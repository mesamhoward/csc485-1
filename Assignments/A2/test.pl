iindex sub [] intro [num:number].
	number sub [sg, pl].
		sg sub [].
		pl sub [].

cat sub [s, np, vp, pp].
s sub [].

det sub [].

n sub [] intro [index:index].
np sub [] intro [head:n].

v sub [].

%% Lexicon
the ---> det.
dog ---> (n,index:(num:sg)).
puppies ---> (n,index:(num:pl)).
fed ---> v.

%%rules
srule rule
s
===>
cat> n,
cat> v.

nrule rule
np
===>
cat> n.

detrule rule
np
===>
cat> det,
cat> n.
