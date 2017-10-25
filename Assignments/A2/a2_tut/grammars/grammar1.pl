%% CSC485H1/2501H:Computational Linguistics, Fall 2017 %%

bot sub [pp,p,np].          

pp sub [].          
p sub [].
np sub [].

with ---> p.
sam ---> np.

srule rule
pp
===>
cat> p,
cat> np.

