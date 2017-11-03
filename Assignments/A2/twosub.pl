:- ale_flag(subtypecover,_,off).
:- discontiguous sub/2,intro/2.

bot sub [mood, tense, sem, cat, pos, verbal, nominal].
	index sub [] intro [num:number].
		number sub [sg, pl].
        % parts of speech
        pos sub [n,p,v,det,toinf].
                toinf sub [].   % infinitival to
                n sub [] intro [index:index].
                v sub [].
                p sub [].
                det sub [].
        % phrasal categories
        cat sub [vproj,np].
                vproj sub [inf_clause,s,vp] intro [mood:mood, trans:transitivity].
                        s intro [mood:indicative].
                        inf_clause intro [mood:infinitive].
                        vp intro [mood:indicative].
			transitivity sub [trans, intrans].
                np sub [].

        verbal sub [v,vproj] intro [vsem:n_sem].
        nominal sub [n,np] intro [nsem:v_sem].

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
                      intro [].   % This should not be empty!  Fill in features for this and
                                  %  the following subtypes:
                        prefer sub [].
                        persuade sub [].
                        promise sub [].
                        expect sub [].
                        sleep sub [].

                % semantics for nouns
                n_sem sub [student, teacher].
                        student sub [].
                        teacher sub [].
% Lexicon

%nouns
student ---> (n, index:(num:sg)).
students ---> (n, index:(num:pl)).

teacher ---> (n, index:(num:sg)).
teachers ---> (n, index:(num:pl)).

%det
the ---> det.

%verbs
prefer ---> v.
preferred ---> v.

persuade ---> v.
persuaded ---> v.

promise ---> v.
promised ---> v.

expect ---> v.
expected ---> v.

sleep ---> v.
slept ---> (vp, mood:(indicative, tense:past)).

%toinf
to ---> toinf.

%rules
%sentence rules
%%declarative sentence
sdecrule rule
s
===>
cat> np,
cat> vp.

strans rule
s
===>
cat> np,
cat> (vp, mood:(indicative, tense:past)).

%%Imperative sentence
simprule rule
si
===>
cat> v,
cat> np.

%Verb rules

%Noun rules
detrule rule
np
===>
cat> det,
cat> n.

nprule rule
ne
===>
cat> (n, index:(num:pl)).

infrule rule
inf_clause
===>
cat> toinf,
cat> v.
