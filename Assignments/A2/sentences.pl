% Xin Serena Wen, wenxin6, 1000442666
%%Pass

test_sent([the, student, persuaded, the, teacher, to, sleep]).
test_sent([the, student, preferred, to, sleep]).
test_sent([the, student, promised, the, teacher, to, sleep]).
test_sent([the, student, expected, the, teacher, to, sleep]).

%%Fail
test_sent([students, expected, to, sleep, to, sleep], fails).
test_sent([the, student, persuaded.], fails).
test_sent((the, student, persuaded, to, sleep), fails).
