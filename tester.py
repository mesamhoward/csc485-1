import nltk
import helper

g = helper.merge(["Grammar", "Lexicon"])

grammar = nltk.grammar.CFG.fromstring(g)

print('Test Positives')
helper.autotest('Positive', grammar)
print('Test Negatives')
helper.autotest('Negative', grammar)
print('Test Overgen')
helper.autotest('Overgen', grammar)
print('Test Undergen')
helper.autotest('Undergen', grammar)

test = input("type test: ")
passed = False

while test != "quit":
    s = nltk.tokenize.word_tokenize(test)

    parser = nltk.parse.BottomUpChartParser(grammar)

    for t in parser.parse_all(s):
        print(t)
        passed = True
    
    if not passed:
        print("No Parses")
    passed = False
    test = input("type test: ")

# passed = False
# c = 0
# with open('Positive', 'r') as f:
#     for line in f:
#         s = nltk.tokenize.word_tokenize(line)
#         parser = nltk.parse.BottomUpChartParser(grammar)
#         for t in parser.parse_all(s):
#             passed = True
    
#         if not passed:
#             print('FAILURE: ' + line)
#             c += 1
#         passed = False
# if c == 0:
#     print('All Passed\n')
# else:
#     c = 0

# print('Test Negative')
# with open('Negative', 'r') as f:
#     for line in f:
#         s = nltk.tokenize.word_tokenize(line)
#         parser = nltk.parse.BottomUpChartParser(grammar)
        
#         for t in parser.parse_all(s):
#             print('FAILURE: ' + line)
#             passed = True
#             c += 1
        
#         passed = False
# if c == 0:
#     print('All Rejected')
