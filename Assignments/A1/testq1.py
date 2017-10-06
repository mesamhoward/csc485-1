import nltk

grammar = nltk.grammar.CFG.fromstring('''
S -> NP VP | VP | Aux NP VP | WhP VP | WP Aux NP V PP | WRBP Aux NP VP
NP -> N | Det N | Adj N
VP -> V NP PP | V NP | V
PP -> P NP
WhP -> WP | WP Aux
WRBP -> WRB
Det -> 'the' | 'their' | 'your'
Adj -> 'old' | 'red' | 'happy'
N -> 'dogs' | 'parks' | 'statues' | 'people'
V -> 'saw' | 'walk' | 'ate'
P -> 'in' | 'to' | 'on' | 'under' | 'with'
WP -> 'who' | 'what'
WRB -> 'where'
Aux -> 'will' | 'should'
''')

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