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
	line = re.sub(r"\s+#\s+","#", line)
	line = re.sub(r"\n","", line)
	line = re.sub(r"\r","", line)
	return line.split("#")

def parseName(name):
    name = name.lower()
    name = re.sub(r"\_","", name)
    return name

########
# Data loading

# Get Items and Locations
print('--> Items and Locations')
with open('items_in.txt') as f:
	lines = f.readlines()
f.closed

items={}
locations={}
for line in lines:
    if(line[0:2]=='//'):
        continue
    if((line == '\n')or(line == '\r\n')):
        continue
    m = parseLine(line)
    if (len(m)<2):
        printWarning('Skipping LINE: '+line)
        continue
    if (m[0]=='LOC'):
        name = parseName(m[1])
        if (len(m)<4):
            printWarning('Skipping LOC: '+name+', need parameters LOC <name> <dim:x:y:z> <radius>')
            continue
        coords = m[2].split(":")
        theLocation = {
            'dim': coords[0],
            'x': coords[1],
            'y': coords[2],
            'z': coords[3],
            'radius': m[3]
        }
        locations[name]=theLocation
    if (m[0]=='ITEM'):
        name = parseName(m[1])
        desc = (m[2]+':0').split(":")
        theItem = {
            'package': desc[0],
            'name': desc[1],
            'damage': desc[2],
            'nbt': 'no'
        }
        if(len(m)>3):
            theItem['nbt'] = m[3]
        items[name]=theItem

print ('Loaded '+str(len(list(locations.keys())))+' location(s).')
print ('Loaded '+str(len(list(items.keys())))+' item(s).')

# Get quests
print('--> Quests')
with open('quests_in.txt') as f:
	lines = f.readlines()
f.closed

theQ = { 'id':'' }
quests={}
for line in lines:
    if(line[0:2]=='//'):
        continue
    if((line == '\n')or(line == '\r\n')):
        continue
    m = parseLine(line)
    if (len(m)<2):
        printWarning('Skipping LINE: '+line)
        continue
    if (m[0]=='QUEST'):
        if(theQ['id']!=''):
            quests[theQ['id']]=theQ;
        if (len(m)<3):
            printError('Skipping QUEST: '+line+', need QUEST # <id> # <name>')
            exit()
        theQ = {
            'id': parseName(m[1]),
            'name': m[2],
            'preqType': 'none',
            'tasks': [],
            'rewards': []
        }
    if (m[0]=='TEXT'):
        theQ['text'] = m[1]
    if (m[0]=='PREREQ'):
        if (len(m)<3):
            printError('Skipping PREREQ: '+line+', need PREREQ # <type> # <id1> # <id2> ...')
            exit()
        theQ['preqType'] = parseName(m[1])
        theQ['preqIds'] = map(lambda x: parseName(x),m[2:])
    if (m[0]=='TASK'):
        if (len(m)<2):
            printError('Skipping TASK: '+line+', need TASK # <type>')
            exit()
        if (m[1]=='TRIGGER'):
            newTask = {
                'type': m[1]
            }
        else:
            if (len(m)<3):
                printError('Skipping TASK: '+line+', need TASK # <type> # <param1> # <param2> ...')
                exit()
            newTask = {
                'type': m[1],
                'params': m[2:]
            }
        theQ['tasks'].append(newTask)
    if (m[0]=='REWARD'):
        if (len(m)<3):
            printError('Skipping REWARD: '+line+', need REWARD # <type> # <param1> # <param2> ...')
            exit()
        newReward = {
            'type': m[1],
            'params': m[2:]
        }
        theQ['rewards'].append(newReward)
if(theQ['id']!=''):
    quests[theQ['id']]=theQ;

print ('Loaded '+str(len(list(quests.keys())))+' quests(s).')

# Get quest lines
print('--> Quest lines')
with open('questlines_in.txt') as f:
	lines = f.readlines()
f.closed

theL = { 'id':'' }
questlines=[]
for line in lines:
    if(line[0:2]=='//'):
        continue
    if((line == '\n')or(line == '\r\n')):
        continue
    m = parseLine(line)
    if (len(m)<2):
        printWarning('Skipping LINE: '+line)
        continue
    if (m[0]=='LINE'):
        if(theL['id']!=''):
            questlines.append(theL)
        if (len(m)<3):
            printError('Skipping LINE: '+line+', need LINE # <id> # <name>')
            exit()
        theL = {
            'id': parseName(m[1]),
            'name': m[2],
            'text': 'No Description',
            'size': '1:1',
            'pos': '0:0',
            'quests': []
        }
    if (m[0]=='SIZE'):
        if (len(m)<3):
            printError('Skipping SIZE: '+line+', need SIZE # <size x:y> # <positon x:y>')
            exit()
        theL['size'] = m[1].split(':')
        theL['pos'] = m[2].split(':')
    if (m[0]=='TEXT'):
        if (len(m)<2):
            printError('Skipping TEXT: '+line+', need TEXT # <text>')
            exit()
        theL['text'] = m[1]
    if (m[0]=='QUEST'):
        if (len(m)<5):
            printError('Skipping QUEST: '+line+', need QUEST # <quest name> # <quest pos> # <symbol size> # <symbol ico>')
            exit()
        newQ = {
            'id': parseName(m[1]),
            'pos': m[2].split(':'),
            'size': m[3],
            'ico': parseName(m[4])
        }
        theL['quests'].append(newQ)

if(theL['id']!=''):
    questlines.append(theL)
print ('Loaded '+str(len(questlines))+' questline(s).')
