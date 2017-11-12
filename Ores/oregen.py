import re
import os

########
# Globals
canPrint = True;

########
# Superglobals

def printError(text):
	print('!ERR '+text);
	canPrint = False;

def printWarning(text):
	print('WARN '+text);

def writeLine(f, intention, text):
	f.write('\t'*intention+text+'\n');

def	writeLineBlocks(f,intention, texts):
	allBut = texts[0:-1]
	last = texts[-1]
	for l in allBut:
		writeLine(f, intention, l+',')
	writeLine(f, intention, last)
	
def parseLine(line):
	line = re.sub(r"\t+","\t", line)
	line = re.sub(r"\n","", line)
	return line.split("\t")
########
# Data loading
canPrint = True;

# Get Biomes
print('--> Biomes')
with open('biomes_in.txt') as f:
	lines = f.readlines()
f.closed

biomes={}
for line in lines:
	m = parseLine(line)
	if (len(m)<2):
		if (len(m)>0):
			printWarning('Skipping Biome: '+m[0])
		continue
	biomes[m[0]] = m[1:]

# Get Ores
print('--> Ores')
with open('ores_in.txt') as f:
	lines = f.readlines()
f.closed

ores={}
for line in lines:
	m = parseLine(line)
	if (len(m)<9):
		if (len(m)>1):
			printWarning('Skipping Ore: '+m[0])
		continue
	ores[m[0]] = m[1:]

# Get Instructions
print('--> Istructions')
with open('oregen_in.txt') as f:
	lines = f.readlines()
f.closed

instr=[]
for line in lines:
	m = parseLine(line)
	if (len(m)<4):
		continue
	obj = {
		'name': m[0],
		'ore': m[1],
		'biome': m[2],
		'dims': m[3].split(',')
	}
	instr.append(obj)

last = instr[-1]['name']
print('>> Printing vanilla.json <<')
f = open('vanilla.json','w')
writeLine(f,0,'{')
writeLine(f,1,'"populate": {')
for i in instr:
	print(i)
	writeLine(f,0,'')
	writeLine(f,2,'"'+i['name']+'": {')
	o = ores[i['ore']]
	writeLine(f,3,'"distribution": "'+o[4]+'",')
	writeLine(f,3,'"generator": {')
	writeLine(f,4,'"block": {')
	if ((o[1]=='0') & (o[2]=='no')):
		writeLine(f,5,'"name": "'+o[0]+'"')
	else:
		writeLine(f,5,'"name": "'+o[0]+'",')
	if (o[1]!='0'):
		writeLine(f,5,'"metadata": '+o[1]+',')
	if (o[2]!='no'):
		par = o[2].split(':')
		writeLine(f,5,'"properties": {')
		writeLine(f,6,'"'+par[0]+'": "'+par[1]+'"')
		writeLine(f,5,'}')
	writeLine(f,4,'},')
	writeLine(f,4,'"material": "'+o[3]+'",')
	writeLine(f,4,'"cluster-size": '+o[5])
	writeLine(f,3,'},')
	writeLine(f,3,'"cluster-count": '+o[6]+',')
	writeLine(f,3,'"min-height": '+o[7]+',')
	writeLine(f,3,'"max-height": '+o[8]+',')
	writeLine(f,3,'"retrogen": false,')
	if (i['biome']=='all'):
		writeLine(f,3,'"biome": "all",')
	else:
		writeLine(f,3,'"biome": {')
		writeLine(f,4,'"restriction": "whitelist",')
		writeLine(f,4,'"value": [')
		writeLine(f,5,'{')
		writeLine(f,6,'"type": "id",')
		writeLine(f,6,'"entry": [')
		bms = []
		for b in biomes[i['biome']]:
			bms.append('"'+b+'"')
		writeLineBlocks(f,7, bms)		
		writeLine(f,6,']')
		writeLine(f,5,'}')
		writeLine(f,4,']')
		writeLine(f,3,'},')
	writeLine(f,3,'"dimension": {')
	writeLine(f,4,'"restriction": "whitelist",')
	writeLine(f,4,'"value": [')
	writeLineBlocks(f,5, i['dims'])		
	writeLine(f,4,']')
	writeLine(f,3,'}')
	if i['name']==last:
		writeLine(f,2,'}')	
	else:
		writeLine(f,2,'},')	
writeLine(f,1,'}')
writeLine(f,0,'}')
f.close()