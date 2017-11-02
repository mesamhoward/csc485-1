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
student ---> n.
students ---> n.

teacher ---> n.
teacher ---> n.

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
slept ---> v.

%toinf
to ---> toinf.

%rules
%sigh
detrule rules
np
===>
cat> det,
cat> n.
