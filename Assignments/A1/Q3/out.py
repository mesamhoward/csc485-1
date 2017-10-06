import nltk
import helper

g = helper.merge(["Grammar", "Lexicon"])

grammar = nltk.grammar.CFG.fromstring(g)

files = ["Positive", "Negative", "Overgen", "Undergen"]

for name in files:
    helper.output(name, grammar)