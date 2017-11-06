%Xin Serena Wen, wenxin6, 1000442666
:- ale_flag(subtypecover,_,off).
:- discontiguous sub/2,intro/2.

bot sub [mood, tense, sem, cat, pos, verbal, nominal].

        % parts of speech
        pos sub [n,p,v,det,toinf].
                toinf sub [].   % infinitival to
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
        semi sub [v_sem, n_sem].

                % semantics for verbs
                v_sem sub [prefer, persuade, promise, expect, sleep]
                      intro [tense:tense].   % This should not be empty!  Fill in features for this and
                                  %  the following subtypes:
                        prefer sub [].
                        persuade sub [].
                        promise sub [].
                        expect sub [].
                        sleep sub [].

                % semantics for nouns
                n_sem sub [student, teacher] intro [number:number].
			number sub [sg, pl].
                        student sub [].
                        teacher sub [].

%Lexicon
the ---> det.

student ---> n.
students ---> n.

teacher ---> n.
teachers ---> n.

to ---> toinf.

sleep ---> v.
slept ---> v.

%rules

%Sentences
%%S -> NP VP
srule rule
s
===>
cat> np,
cat> v.


%Verbs
%%VP -> V
vrule rule
vp
===>
cat> v.

%%VP -> V NP
%%VP -> V inf_c
%%VP -> V NP inf_c

%%inf_clause
%%inf_c -> toinf VP

%%Verbs
%%VP -> Vpast
%%VP -> Vpast NPnoBen
%%VP -> VPast inf_clause
%%VP -> Vpast NP inf_clause

%%inf_clause
%%infc -> toinf Vpresent
%%infc -> to Vp Npnoben
%%infc -> to VP Npnoben inf_c

%%NP rules
detrule rule
np
===>
cat> det,
cat> n.

n_rule rule
np
===>
cat> n.
