#!/usr/bin/env python3
import fileinput

# grpfile = '.\\gblfinance.txt'
# with fileinput.FileInput(grpfile, inplace=True, backup='.bak') as file:
#     for line in file:
#         print(line.replace(line, "DMN_Sher01\\" + line), end='')

input_audit_file = open('.\\u drive audit.txt', 'r').read()
output_audit_file = open('.\\u drive mod.txt', 'w')

with open('.\\gblfinance.txt') as gblfinance:
    gblfinance_lines = gblfinance.read().splitlines()
    
group_string = ''
for line in gblfinance_lines:
    group_string = group_string + line + '\n'

print(input_audit_file.replace("GblFinance", group_string))
