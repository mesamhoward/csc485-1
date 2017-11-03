% Xin Serena Wen, wenxin6, 1000442666
%%Pass
test_sent([the, student, persuaded, the, teacher, to, sleep]).
test_sent([the, student, preferred, to, sleep]).
test_sent([the, student, promised, the, teacher, to, sleep]).
test_sent([the, student, expected, the, theacher, to, sleep]).

test_sent([the, student, slept]).
)

%%fail
test_sent([the, student, expected], fails).
test_sent([slept, the, student], fails).