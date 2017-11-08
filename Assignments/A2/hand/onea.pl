%Xin Serena Wen, wenxin6, 1000442666
cat sub [s, npnom, vp, npacc, np, pp, n].          

s sub [].
npnom sub [].
pronom sub [].

vp sub [].          
v sub [].

npacc sub [].
proacc sub [].

pp sub [].
p sub [].

np sub [].
n sub [].
nsg sub [].
npl sub [].

det sub [].

%Rules
srule rule
s
===>
cat> npnom,
cat> vp.

vprule rule
vp
===>
cat> v,
cat> npacc.

pprule rule
pp
===>
cat> p,
cat> npacc.

%NPnom [2]
npnom_nprule rule
npnom
===>
cat> np.

npnom_prorule rule
npnom
===>
cat> pronom.

%NPacc [2]
npacc_nprule rule
npacc
===>
cat> np.

npacc_prorule rule
npacc
===>
cat> proacc.

%NP [4]

%dealing with Det
np_detrule rule
np
===>
cat> det,
cat> n.

np_det_pprule rule
np
===>
cat> det,
cat> n,
cat> pp.

%pointing directly to npl
np_nplrule rule
np
===>
cat> npl.

%deling with prepostions and plurality
np_npl_pprule rule
np
===>
cat> npl,
cat> pp.

%dealing plurality of nouns [2]
np_sgrule rule
n
===>
cat> nsg.

np_plrule rule
n
===>
cat> npl.

%Lexicon
dog ---> nsg.
fed ---> v.
him ---> proacc.
puppies ---> npl.
she ---> pronom.
the ---> det.
with ---> p.