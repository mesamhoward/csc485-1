bot sub [mood, tense, sem, cat, pos, verbal, nominal].

        %parts of speech
            pos sub [n,p,v,det,toinf].
                toinf sub [].   % infinitival to
                n sub [].
                v sub [].
                p sub [].
                det sub [].

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

        %phrasal categories
            cat sub [vproj,np].
                vproj sub [inf_clause,s,vp] intro [mood:mood].
                        s intro [mood:indicative].
                        inf_clause intro [mood:infinitive].
                        vp intro [mood:indicative].
                np sub [].

            % Lexicon

                %nouns
                student ---> np
                teacher ---> np

                %verbs
                prefer ---> 
                preferred ---> 

                persuade ---> 
                persuaded ---> 
                
                promise ---> 
                promised ---> 
                
                expect ---> 
                expected ---> 
                
                sleep ---> 
                slept ---> 

        %Verbal
            verbal sub [v,vproj] intro [vsem:n_sem].

            % Lexicon
                %verbs
                prefer ---> (v, vsem:n_sem)
                preferred ---> (v, vsem:n_sem)
                
                persuade ---> (v, vsem:n_sem)
                persuaded ---> (v, vsem:n_sem)
                
                promise ---> (v, vsem:n_sem)
                promised ---> (v, vsem:n_sem)
                
                expect ---> (v, vsem:n_sem)
                expected ---> (v, vsem:n_sem)
                
                sleep ---> (v, vsem:n_sem)
                slept ---> (v, vsem:n_sem)
        
        %Nominal
            nominal sub [n,np] intro [nsem:v_sem].
            % Lexicon
                %nouns
                student ---> (n, nsem:v_sem)
                teacher ---> (n, nsem:v_sem)
        
        %mood and tense for verbs (bot: mood, tense)
            tense sub [past, present].
                    past sub [].
                    present sub [].
            
                        % Lexicon
                %verbs
                prefer ---> present
                preferred ---> past

                persuade ---> present
                persuaded ---> past

                promise ---> present
                promised ---> past

                expect ---> present
                expected ---> past

                sleep ---> present
                slept ---> past

            mood sub [indicative,infinitive].
                    indicative intro [tense:tense].
                    infinitive sub [].

            % Lexicon
                %verbs
                prefer ---> 
                preferred ---> v
                
                persuade ---> v
                persuaded ---> v
                
                promise ---> v
                promised ---> v
                
                expect ---> v
                expected ---> v
                
                sleep ---> v
                slept ---> v
        
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
                    
            % Lexicon
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
                
                    % semantics for nouns
                    n_sem sub [student, teacher].
                            student sub [].
                            teacher sub [].
                
                % Lexicon
                %nouns
                studentb ---> n
                teacher ---> n