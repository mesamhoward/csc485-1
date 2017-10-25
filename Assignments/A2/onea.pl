%% Xin Serena Wen, wenxin6, 1000442666 %%

bot sub [s, np, pp, vp].

s sub [].

vp sub [v npacc].
v sub [].

pp sub [p npacc].
p sub [].

npnom sub [np, pronom].
npacc sub [np, proacc].
np sub [det n, det n pp, npl, npl pp].
n sub [nsg, npl].
nsg sub [].
npl sub [].

she ---> pronom.
fed ---> v.
the ---> det.
dog ---> nsg.
puppies ---> npl.
him ---> proacc.
with ---> p.

srule rule
s
==>
cat>