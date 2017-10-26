%% CSC485H1/2501H:Computational Linguistics, Fall 2017%% 

bot sub [s,np,vp]. 

s sub [].  
np sub [].
vp sub [].

john ---> np.
walked ---> vp.

srule rule
s
===>
cat> np,
cat> vp.
