% Xin Serena Wen, wenxin6, 1000442666
%%Pass

test_sent([the, student, persuaded, the, teacher, to, sleep]).
test_sent([the, student, preferred, to, sleep]).
test_sent([the, student, promised, the, teacher, to, sleep]).
test_sent([teachers, expected, the, teacher, to, sleep]).
test_sent([students, expected, to, expect, to, expect, to, promise, the, students, to, sleep]).

%%Fail
test_sent([students, expected, to, sleep, to, sleep], fails).
test_sent([the, student, persuaded], fails).
test_sent([the, student, persuaded, to, sleep], fails).
test_sent([the, student, expected], fails).
test_sent([the, student, expected, the, teacher], fails).
test_sent([the, student, expected, to], fails).
test_sent([student, expected, to, sleep], fails).
