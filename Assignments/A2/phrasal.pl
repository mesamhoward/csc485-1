bot sub [mood, tense, sem, cat, pos, verbal, nominal].

        % phrasal categories
        cat sub [vproj,np].
                vproj sub [inf_clause,s,vp] intro [mood:mood].
                        s intro [mood:indicative].
                        inf_clause intro [mood:infinitive].
                        vp intro [mood:indicative].
                np sub [].
% Lexicon

%nouns
studentb ---> n
teacher ---> n

%det
the ---> det

%verbs
prefer ---> v
preferred ---> v
persuade ---> v
persuaded ---> v
promise ---> v
promised ---> v
expect ---> v
expected ---> v
sleep ---> v
slept ---> v

%toinf
to ---> toinf
