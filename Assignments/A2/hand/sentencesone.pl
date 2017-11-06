%Xin Serena Wen, wenxin6, 1000442666
%passes
test_sent([she, fed, the, dog, with, puppies, with, him]).
test_sent([she, fed, the, dog, with, the, puppies]).
test_sent([puppies, fed, the, dog, with, him]).
test_sent([she, fed, puppies]).
test_sent([the dog, with, him, fed, him]).

%fails
test_sent([him, fed, the, puppies], fails).
test_sent([she, fed, she], fails).
test_sent([she, fed, with, him], fails).
test_sent([she, fed], fails).
test_sent([dog, fed, him], fails).
test_sent([she, with, puppies, fed, puppies], fails).
