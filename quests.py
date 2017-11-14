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

def writeLineCondition(f, intention, textNo, textYes, condition):
	if(condition):
		f.write('\t'*intention+textYes+'\n');
	else:
		f.write('\t'*intention+textNo+'\n');

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


def writeItemLines(f, intention, item, count):
    writeLine(f, intention, '"id": "'+item['package']+':'+item['name']+'",')
    writeLine(f, intention, '"Count": '+count+',')
    writeLine(f, intention, '"OreDict": "'+item['ore']+'",')
    if(item['nbt']!='no'):
        writeLine(f, intention, '"nbt": "'+item['nbt']+'",')
    writeLine(f, intention, '"Damage": '+item['damage'])

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
            'nbt': 'no',
            'ore': ''
        }
        for attr in m[3:]:
            nm = parseName(attr[0:3])
            if((nm == 'nbt')or(nm == 'tag')):
                theItem['nbt'] = attr[4:]
            elif(nm == 'ore'):
                theItem['ore'] = attr[4:]
            else:
                printWarning('ITEM '+name+', skipping attribute: '+nm+', unknown.')
        print(theItem)
        items[name]=theItem

print ('Loaded '+str(len(list(locations.keys())))+' location(s).')
print ('Loaded '+str(len(list(items.keys())))+' item(s).')

# Get quests
print('--> Quests')
with open('quests_in.txt') as f:
	lines = f.readlines()
f.closed

theQ = { 'id':'' }
nextQID = 0
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
            'rewards': [],
			'qid': str(nextQID),
			'main': 'false'
        }
        nextQID = nextQID + 1
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
            printError('Skipping QUEST: '+line+', need QUEST # <quest name> # <quest pos> # <symbol size> # <symbol ico> # <par1> # <par2> ...')
            exit()
        newQ = {
            'id': parseName(m[1]),
            'pos': m[2].split(':'),
            'size': m[3]
        }
        quests[newQ['id']]['ico'] = parseName(m[4])
        for p in m[5:]:
            m1 = p.split(':')
            nm = parseName(m1[0])
            if(nm=='main'):
                quests[newQ['id']]['main'] = 'true'
            else:
                printWarning('Quest '+theL['name']+'/'+newQ['id']+': skipping unknown parameter '+p)
            theL['quests'].append(newQ)

if(theL['id']!=''):
    questlines.append(theL)
print ('Loaded '+str(len(questlines))+' questline(s).')

# Printing
print('\nCan Print: '+str(canPrint))
if canPrint == False:
	exit()

print('>> Printing DefaultQuests.json <<')
f = open('DefaultQuests.json','w')
writeLine(f,0,'{')
writeLine(f,1,'"questSettings": {')
writeLine(f,2,'"betterquesting": {')
writeLine(f,3,'"livesMax": 10,')
writeLine(f,3,'"livesDef": 3,')
writeLine(f,3,'"home_anchor_x": 0.5,')
writeLine(f,3,'"home_anchor_y": 0.0,')
writeLine(f,3,'"hardcore": false,')
writeLine(f,3,'"home_image": "betterquesting:textures/gui/default_title.png",')
writeLine(f,3,'"editMode": false,')
writeLine(f,3,'"home_offset_x": -128,')
writeLine(f,3,'"home_offset_y": 0')
writeLine(f,2,'}')
writeLine(f,1,'},')
writeLine(f,1,'"questDatabase": [')
for id in quests.keys():
	q = quests[id]
	writeLine(f,2,'{')
	writeLine(f,3,'"properties": {')
	writeLine(f,4,'"betterquesting": {')
	writeLine(f,5,'"name": "'+q['name']+'",')
	writeLine(f,5,'"desc": "'+q['text']+'",')
	writeLine(f,5,'"snd_complete": "minecraft:entity.player.levelup",')
	writeLine(f,5,'"snd_update": "minecraft:entity.player.levelup",')
	writeLine(f,5,'"icon": {')
	writeItemLines(f,6,items[q['ico']],'1')
	writeLine(f,5,'},')
	writeLine(f,5,'"autoClaim": true,')
	writeLine(f,5,'"isSilent": false,')
	writeLine(f,5,'"partySingleReward": false,')
	writeLine(f,5,'"isMain": '+q['main']+',')
	writeLine(f,5,'"simultaneous": false,')
	writeLine(f,5,'"globalShare": false,')
	writeLine(f,5,'"lockedProgress": false,')
	writeLine(f,5,'"taskLogic": "AND",')
	writeLine(f,5,'"repeatTime": -1,')
	writeLine(f,5,'"questLogic": "AND"')
	writeLine(f,4,'}')
	writeLine(f,3,'},')
    if(len(q['tasks'])==0):
        writeLine(f,3,'"tasks": [],')
    else:
        writeLine(f,3,'"tasks": [')
        
        writeLine(f,3,'],')
	writeLine(f,3,'"rewards": [],')
	writeLine(f,3,'"preRequisites": [],')
	writeLine(f,3,'"questID": '+q['qid'])
	writeLine(f,2,'},')

writeLine(f,0,'}')
f.close()
