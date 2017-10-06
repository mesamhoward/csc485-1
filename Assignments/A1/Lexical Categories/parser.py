s = '% Xin Wen, wenxin6 1000442666'
l = ['preposition', 'adjadv.txt', 'conjugation.txt', 'det.txt', 'npr.txt', 'noun', 'verb.txt', 'q2.txt', 'aux.txt']
f = open('Lex.txt', 'w')

for name in l:
    first = True
    file = open(name, 'r')
    s += "\n\n% " + name
    for line in file:
        if line.rstrip('\n') and "*" not in line:
            if '->' in line:
                s += "\n" + line.rstrip('\n') + " "
                first = True
            elif first:
                s += "'" + line.rstrip('\n') + "'"
                first = False
            else:
                s += " | '" + line.rstrip('\n') + "'"
    file.close() 

f.write(s)
f.close
