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
            inf_clause intro [mood:infinitive, rec:n_sem].
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
						%Features
						n_sem_or_none sub [n_sem, gap, none].
							none sub [].
						theme_or_none sub [theme, none].
							theme sub []  intro [obj:n_sem_or_none, action:vsem].
						verbform sub [base, fin].
							base sub [].
							fin sub [].
                                  %  the following subtypes:
			prefer sub [] intro [vform:verbform, agent:n_sem, theme:theme, ben:none, exp:none].
			persuade sub [] intro [vform:verbform, agent:n_sem, theme:theme, ben:n_sem, exp:none].
			promise sub [] intro [vform:verbform, agent:n_sem, theme:theme, ben:n_sem, exp:none].
			expect sub []  intro [vform:verbform, agent:n_sem, theme:theme, ben:none, exp:none].
			sleep sub [] intro [vform:verbform, agent:none, theme:none, ben:none, exp:n_sem].

		% semantics for nouns
		n_sem sub [student, teacher, gap] intro [amt:amount].
			amount sub [sg, pl].
			student sub [].
			teacher sub [].

%Lexicon

the ---> det.
to ---> toinf.

student ---> (n, nsem:(student, amt:sg)).
students ---> (n, nsem:(student, amt:pl)).
teacher ---> (n, nsem:(teacher, amt:sg)).
teachers ---> (n, nsem:(teacher, amt:pl)).

sleep ---> (v, vsem:(sleep, vform:base, agent:none, theme:none, ben:none, exp:Exp)).
slept ---> (v, vsem:(sleep, vform:fin, agent:none, theme:none, ben:none, exp:Exp)).

expect ---> (v, vsem:(expect, vform:base, agent:Agent, theme:(Theme, obj:Obj, action:Act), ben:none, exp:none)).
expected ---> (v, vsem:(expect, vform:fin, agent:Agent, theme:(Theme, obj:Obj, action:Act), ben:none, exp:none)).

prefer ---> (v, vsem:(prefer, vform:base, agent:Agent, theme:Theme, ben:none, exp:none)).
preferred ---> (v, vsem:(prefer, vform:fin, agent:Agent, theme:Theme, ben:none, exp:none)).

persuade ---> (v, vsem:(persuade, vform:base, agent:Agent, theme:(Theme, obj:Obj, action:Act), ben:Ben, exp:none)).
persuaded ---> (v, vsem:(persuade, vform:fin, agent:Agent, theme:(Theme, obj:Obj, action:Act), ben:Ben, exp:none)).

promise ---> (v, vsem:(persuade, vform:base, agent:Agent, theme:(Theme, obj:Obj, action:Act), ben:Ben, exp:none)).
promised ---> (v, vsem:(persuade, vform:fin, agent:Agent, theme:(Theme, obj:Obj, action:Act), ben:Ben, exp:none)).

%Rules
%s->np+vp
s_rule rule
(s, mood:(Mood, tense:past), vsem:Vpast)
===>
cat> (np, nsem:Subj),
cat> (vp, mood:(Mood, tense:past), vsem:(vform:fin, agent:Subj, exp:Subj)).

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
(vp, vsem:(Vpast, vform:fin, exp:Subj))
===>
cat> (v, vsem:(vform:fin, agent:none, exp:Subj)).

%VP->V+inf_clause
%Expected and preffered
vtoinf rule
(vp, vsem:(Vpast, vform:fin, agent:Subj))
===>
cat> (v, vsem:(vform:fin, agent:Subj, theme:(theme, obj:gap, action:Infsem), ben:none, exp:none)),
cat> (inf_clause).
%(inf_clause, mood:Mood, vsem:Bsem).

%inf_c->to+v
%Bsem=base sem
infrule rule
(inf_clause, rec:Subj)
===>
cat> toinf,
cat> (v, vsem:(vform:base, exp:Subj)).
