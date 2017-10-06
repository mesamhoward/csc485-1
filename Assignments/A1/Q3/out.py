import nltk
import helper

g = helper.merge(["Grammar", "Lexicon"])

grammar = nltk.grammar.CFG.fromstring(g)

files = ["Positive", "Negative", "Overgen", "Undergen"]

print("% Xin Wen, wenxin6, 1000442666")
for name in files:
    print("\n% " + name)
    helper.output(name, grammar)