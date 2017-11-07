:i- ale_flag(subtypecover,_,off).
:- discontiguous sub/2,intro/2.

bot sub [mood, tense, sem, cat, pos, verbal, nominal].

	% parts of speech
        pos sub [n,p,v,det,toinf].
		toinf sub [].	% infinitival to
                n sub [].
                v sub [].
                p sub [].
                det sub [].
	% phrasal categories
	cat sub [vproj,np].
		vproj sub [inf_clause,s,vp] intro [mood:mood].
			s intro [mood:indicative].
                        inf_clause intro [mood:infinitive].
			vp intro [mood:indicative].
		np sub [].

        verbal sub [v,vproj] intro [vsem:v_sem].
        nominal sub [n,np] intro [nsem:n_sem].
	
	% mood and tense for verbs
	tense sub [past, present].
		past sub [].	
		present sub [].
        mood sub [indicative,infinitive].
                indicative intro [tense:tense].
                infinitive sub [] intro [tense: present].

	% semantics for verbs and nouns
	sem sub [v_sem, n_sem].

		% semantics for verbs
		v_sem sub [prefer, persuade, promise, expect, sleep]
		      intro [vform:vform, tense:tense].   % This should not be empty!  Fill in features for this and
			vform sub [fin, base].
				fin sub [].
				base sub [].
                                  %  the following subtypes:
			prefer sub [].
			persuade sub [].
			promise sub [].
			expect sub [].
			sleep sub [].

		% semantics for nouns
		n_sem sub [student, teacher] intro [amt:amount].
			amount sub [sg, pl].
			student sub [].
			teacher sub [].

%Lexicon
the ---> det.

student ---> (n, nsem:(student, amt:sg)).
students ---> (n, nsem:(student, amt:pl)).

sleep ---> (v, vsem:(sleep, vform:base)).
slept ---> (v, vsem:(sleep, vform:fin, tense:tense)).

%Rules

%S->NP+VP
srule rule
(s, mood:(indicative, tense:past))
===>
cat> np,
cat> ((vp, mood:(indicative, tense:past)), vform:fin).

%NP->det+n
detrule rule
np
===>
cat> det,
cat> n.

%NP->N
nrule rule
np
===>
cat> (n, nsem:(Nsem, amt:pl)).

%VP->V
ivrule rule
((vp, mood:(Mood, tense:Tense)), vform:Vform)
===>
cat> (v, vsem:(vsem, vform:Vform, tense:Tense)).
