import nltk

def merge(l):
    s = ""
    for item in l:
        with open(item, 'r') as f:
            for line in f:
                if "%" not in line:
                    s += line
    return s

def output(name, grammar):
    passed = False
    with open(name, 'r') as f:
        for line in f:
            if "%" not in line:
                sentence = nltk.tokenize.word_tokenize(line)
                parser = nltk.parse.BottomUpChartParser(grammar)
                print("\n" + line.rstrip("\n"))
                for t in parser.parse_all(sentence):
                    passed = True
                    print(t)
        
                if not passed:
                    print("No parses")
                passed = False

def autotest(name, grammar):
    passed = False
    c = 0
    with open(name, 'r') as f:
        for line in f:
            if "%" not in line:
                s = nltk.tokenize.word_tokenize(line)
                parser = nltk.parse.BottomUpChartParser(grammar)
                for t in parser.parse_all(s):
                    passed = True
                    if name == "Negative" or name == "Undergen":
                        print("FAILURE: " + line + "\n")
                if not passed:
                    if name == "Positive" or name == "Overgen":
                        print('FAILURE: ' + line + "\n")
                    c += 1
                passed = False
    if (name == "Positive" or name == "Overgen") and c == 0:
        print('All Passed\n')
    elif (name == "Negative" or name == "Undergen") and c > 0:
        print('All Failed\n')

# def test(grammar):
#     t = input("type test: ")
#     passed = False
#     while t != "quit":
#         s = nltk.tokenize.word_tokenize(test)

#         parser = nltk.parse.BottomUpChartParser(grammar)

#         for t in parser.parse_all(s):
#             print(t)
#             passed = True
    
#         if not passed:
#             print("No Parses")
#         passed = False
#         t = input("type test: ")
