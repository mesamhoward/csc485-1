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

she ---> pronom.
fed ---> v.
the ---> det.
dog ---> nsg.
puppies ---> npl.
him ---> proacc.
with ---> p.

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

%% NPnom [2]
npnom_nprule rule
npnom
===>
cat> np.

npnom_prorule rule
npnom
===>
cat> pronom.

%% NPacc [2]
npacc_nprule rule
npacc
===>
cat> np.

npacc_prorule rule
npacc
===>
cat> proacc.

%% NP [4]
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

np_nplrule rule
np
===>
cat> npl.

np_npl_pprule rule
np
===>
cat> npl,
cat> pp.

%% N [2]
np_sgrule rule
n
===>
cat> nsg.

np_plrule rule
n
===>
cat> npl.
