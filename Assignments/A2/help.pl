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
		      intro [vform:verbform, agent:n_sem_or_none, theme:theme_or_none, ben:n_sem_or_none, exp:n_sem_or_none].   % This should not be empty!  Fill in features for this and
				theme sub [] intro [obj:n_sem_or_none, action:inf_clause].
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
		theme_or_none sub [theme, none].

%Lexicon

the ---> det.
to ---> toinf.

student ---> (n, nsem:(student, amt:sg)).
students ---> (n, nsem:(student, amt:pl)).
teacher ---> (n, nsem:(teacher, amt:sg)).
teachers ---> (n, nsem:(teacher, amt:pl)).

sleep ---> (v, vsem:(sleep, vform:base, agent:none, theme:none, ben:none, exp:Exp)).
slept ---> (v, vsem:(sleep, vform:fin, agent:none, theme:none, ben:none, exp:Exp)).

expect ---> (v, vsem:(expect, vform:base, agent:Agent, theme:(theme, obj:Obj, action:Act), ben:none, exp:none)).
expected ---> (v, vsem:(expect, vform:fin, agent:Agent, theme:(theme, obj:Obj, action:Act), ben:none, exp:none)).

prefer ---> (v, vsem:(prefer, vform:base, agent:Agent, theme:(theme, obj:Obj, action:Act), ben:none, exp:none)).
preferred ---> (v, vsem:(prefer, vform:fin, agent:Agent, theme:(theme, obj:Obj, action:Act), ben:none, exp:none)).

persuade ---> (v, vsem:(persuade, vform:base, agent:Agent, theme:(theme, obj:Obj, action:Act), ben:Ben, exp:none)).
persuaded ---> (v, vsem:(persuade, vform:fin, agent:Agent, theme:(theme, obj:Obj, action:Act), ben:Ben, exp:none)).

promise ---> (v, vsem:(persuade, vform:base, agent:Agent, theme:(theme, obj:Obj, action:Act), ben:Ben, exp:none)).
promised ---> (v, vsem:(persuade, vform:fin, agent:Agent, theme:(theme, obj:Obj, action:Act), ben:Ben, exp:none)).

%Rules
%s->np+vp
s_rule rule
s
===>
cat> (np, nsem:Subj),
cat> (vp, vsem:(vform:fin, agent:Subj, exp:Subj)).

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
(vp, vsem:(vform:fin, exp:Subj))
===>
cat> (v, vsem:(vform:fin, agent:none, exp:Subj)).

%VP->V+inf_clause
%Expected and preffered
vtoinf rule
(vp, vsem:(vform:fin, agent:Subj, exp:Subj))
===>
cat> (v, vsem:(vform:fin, agent:Subj, theme:(theme, obj:none, action:InfC), ben:none, exp:none)),
cat> (inf_clause, vsem:(InfC)).
%cat> (inf_clause, vsem:(InfC, vform:base, agent:Subj, theme:(theme, obj:none, action:Basev), ben:none, exp:Subj)).

%inf_c->to+v
infrule rule
inf_clause
===>
cat> toinf,
cat> v.

%VP->V+NP+inf_clause
%v_np_infcrule rule
%(vp, vsem:(vform:fin, agent:Agent))
%===>
%cat> (v, vsem:(vform:fin, agent:Agent)),
%cat> (np, nsem:)

%inf_clause
%inf_rule rule
%(inf_clause, vsem:(vform:base, agent:Subj, theme:(theme, obj:Obj, action:InfV), ben:Ben, exp:Exp))
%===>
%cat> toinf,
%cat> (v, vsem:(vform:base, agent:none, theme:none, ben:none, exp:Exp)).
