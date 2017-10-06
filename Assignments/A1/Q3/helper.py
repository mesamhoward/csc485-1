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
    c = True
    with open(name, 'r') as f:
        for line in f:
            if "%" not in line:
                s = nltk.tokenize.word_tokenize(line)
                parser = nltk.parse.BottomUpChartParser(grammar)
                for t in parser.parse_all(s):
                    passed = True
                    if name == "Negative" or name == "Undergen":
                        print("FAILURE: " + line + "\n")
                        c = False
                if not passed:
                    if name == "Positive" or name == "Overgen":
                        print('FAILURE: ' + line + "\n")
                        c = False
                passed = False
    if (name == "Positive" or name == "Overgen") and c:
        print('All Passed\n')
    elif (name == "Negative" or name == "Undergen") and c:
        print('All Failed\n')

def manutest(grammar):
    test = input("type test: ")
    passed = False

    while test != "q":
        s = nltk.tokenize.word_tokenize(test)

        parser = nltk.parse.BottomUpChartParser(grammar)

        for t in parser.parse_all(s):
            print(t)
            passed = True
        
        if not passed:
            print("No Parses")
        passed = False
        test = input("type test: ")
