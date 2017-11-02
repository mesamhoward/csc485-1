% Xin Serena Wen, wenxin6, 1000442666
test_sent([she, fed, the, dog, with, puppies, with, him])
test_sent([she, fed, the, dog, with, the, puppies])
test_sent([puppies, fed, the, dog, with, him])
test_sent([him, fed, the, puppies], fails)
test_sent([she, fed, she], fails)
test_sent([she, fed, with, him], fails)
