% Xin Serena Wen, wenxin6, 1000442666
%%Pass
test_sent([students, slept]).
test_sent([the, student, persuaded, the, teacher, to, sleep]).
test_sent([the, student, preferred, to, sleep]).
test_sent([the, student, promised, the, teacher, to, sleep]).
test_sent([the, student, expected, the, teacher, to, sleep]).

%%Fail
test_sent([the, student, persuaded.], fails).
test_sent([student, slept], fails).
test_sent([students, slept, teachers], fails).
test_sent([students, persuaded, teachers, to persuaded, students]).