:- ale_flag(subtypecover,_,off).
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
                infinitive sub [].

	% semantics for verbs and nouns
	sem sub [v_sem, n_sem].

		% semantics for verbs
		v_sem sub [prefer, persuade, promise, expect, sleep]
		      intro [vform:verbform, agent:n_sem_or_none, theme:n_sem_or_none, ben:n_sem_or_none, exp:n_sem_or_none].   % This should not be empty!  Fill in features for this and
				verbform sub [base, fin].
					base sub [].
					fin sub [].
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
		n_sem_or_none sub [n_sem, none].
			none sub [].

%Lexicon

the ---> det.
to ---> toinf.

student ---> (n, nsem:(student, amt:sg)).
students ---> (n, nsem:(student, amt:pl)).
teacher ---> (n, nsem:(teacher, amt:sg)).
teachers ---> (n, nsem:(teacher, amt:pl)).

sleep ---> (v, vsem:(sleep, vform:base, agent:none, theme:none, ben:none, exp:Exp)).
slept ---> (v, vsem:(sleep, vform:fin, agent:Agent, theme:none, ben:none, exp:none)).

expect ---> (v, vsem:(expect, vform:base, agent:Agent, theme:Nounp2, ben:none, exp:none)).
expected ---> (v, vsem:(expect, vform:fin, agent:Agent, theme:Nounp2, ben:none, exp:none)).

prefer ---> (v, vsem:(expect, vform:base, agent:Agent, theme:Nounp2, ben:none, exp:none)).
preferred ---> (v, vsem:(expect, vform:fin, agent:Agent, theme:Nounp2, ben:none, exp:none)).


%Rules
%s->np+vp
s_rule rule
s
===>
cat> (np, nsem:Agent),
cat> (vp, vsem:(vform:fin, agent:Agent)).

%np->det+n
det_rule rule
np
===>
cat> det,
cat> n.

%np->n
n_rule rule
np
===>
cat> (n, nsem:(amt:pl)).

%VP->V
v_rule rule
(vp, vsem:(vform:fin, agent:Agent))
===>
cat> (v, vsem:(vform:fin, agent:Agent)).

%VP->V+toinf
vtoinf rule
(vp, vsem:(vform:fin, agent:Agent))
===>
cat> (v, vsem:(vform:fin, agent:Agent)),
cat> (inf_clause, vsem:(vform:base, exp:Agent)).

%inf_clause
inf_rule rule
(inf_clause, vsem:(vform:base, exp:Exp))
===>
cat> toinf,
cat> (v, vsem:(vform:base, agent:none, theme:none, ben:none, exp:Exp)).
