#!/usr/bin/env python

'''
Created on Jun 19, 2015

@author: Pavlos
'''
import sys

helpme = [0, 1, 5, 6]

s = sys.argv[1]

for move in sys.argv[2]:
    ind = helpme[int(move) - 1]
    s = s[:ind] + s[ind + 2] + s[ind + 1] + s[ind + 5] + s[ind] + s[ind + 4] + s[ind + 3] + s[ind + 6:]

print("Ok." if (s == "bgbGgGGrGyry") else "not Ok.") 





    
    

