import re
import os

########
# Globals
canPrint = True;

########
# Superglobals

def printError(text):
	global canPrint
	print('!ERR '+text);
	canPrint = False

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
        writeLine(f, intention, '"tag": '+item['nbt']+',')
    writeLine(f, intention, '"Damage": '+item['damage'])

def writeTaskLines(f, intention, task, items, locs):
	type = task['type']
	if(type=='TRIGGER'):
		writeLine(f, intention, '"taskID": "bq_standard:checkbox",')
	elif(type=='TRAVEL'):
		loc = locs[parseName(task['items'][0])]
		writeLine(f, intention, '"name": "'+loc['name']+'",')
		writeLine(f, intention, '"posX": '+loc['x']+',')
		writeLine(f, intention, '"posY": '+loc['y']+',')
		writeLine(f, intention, '"posZ": '+loc['z']+',')
		writeLine(f, intention, '"dimension": '+loc['dim']+',')
		writeLine(f, intention, '"range": '+loc['radius']+',')
		writeLine(f, intention, '"visible": true,')
		writeLine(f, intention, '"hideInfo": false,')
		writeLine(f, intention, '"taskID": "bq_standard:location",')
	elif(type=='HAVE'):
		writeLine(f, intention, '"partialMatch": true,')
		writeLine(f, intention, '"ignoreNBT": false,')
		writeLine(f, intention, '"consume": false,')
		writeLine(f, intention, '"groupDetect": false,')
		writeLine(f, intention, '"autoConsume": false,')
		writeLine(f, intention, '"requiredItems": [')
		iMax = len(task['items'])
		iCnt = 0
		for it in task['items']:
			iCnt = iCnt + 1
			m = it.split(':')
			item = items[parseName(m[0])]
			count = '1'
			if(len(m)>1):
				count = m[1]
			writeLine(f, intention+1, '{')
			writeItemLines(f, intention+2, item, count)
			writeLineCondition(f,intention+1,'},','}', iCnt==iMax)
		writeLine(f, intention, '],')
		writeLine(f, intention, '"taskID": "bq_standard:retrieval",')
	elif(type=='GIVE'):
		writeLine(f, intention, '"partialMatch": true,')
		writeLine(f, intention, '"ignoreNBT": false,')
		writeLine(f, intention, '"consume": true,')
		writeLine(f, intention, '"groupDetect": false,')
		writeLine(f, intention, '"autoConsume": false,')
		writeLine(f, intention, '"requiredItems": [')
		iMax = len(task['items'])
		iCnt = 0
		for it in task['items']:
			iCnt = iCnt + 1
			m = it.split(':')
			item = items[parseName(m[0])]
			count = '1'
			if(len(m)>1):
				count = m[1]
			writeLine(f, intention+1, '{')
			writeItemLines(f, intention+2, item, count)
			writeLineCondition(f,intention+1,'},','}', iCnt==iMax)
		writeLine(f, intention, '],')
		writeLine(f, intention, '"taskID": "bq_standard:retrieval",')
	elif(type=='CRAFT'):
		writeLine(f, intention, '"partialMatch": true,')
		writeLine(f, intention, '"ignoreNBT": false,')
		writeLine(f, intention, '"requiredItems": [')
		iMax = len(task['items'])
		iCnt = 0
		for it in task['items']:
			iCnt = iCnt + 1
			m = it.split(':')
			item = items[parseName(m[0])]
			count = '1'
			if(len(m)>1):
				count = m[1]
			writeLine(f, intention+1, '{')
			writeItemLines(f, intention+2, item, count)
			writeLineCondition(f,intention+1,'},','}', iCnt==iMax)
		writeLine(f, intention, '],')
		writeLine(f, intention, '"taskID": "bq_standard:crafting",')
	elif(type=='RF_RATE'):
		m = task['items'][0].split(':')
		writeLine(f, intention, '"rf": '+m[0]+',')
		writeLine(f, intention, '"duration": '+m[1]+',')
		writeLine(f, intention, '"voidExcess": true,')
		writeLine(f, intention, '"taskID": "bq_rf:rf_rate",')
	elif(type=='RF_CHARGE'):
		writeLine(f, intention, '"rf": '+task['items'][0]+',')
		writeLine(f, intention, '"taskID": "bq_rf:rf_charge",')
	elif(type=='XP'):
		isLevels = 'false'
		consume = 'false'
		amount = '1'
		for i in task['items']:
			m = i.split(':')
			for ii in m:
				parii = parseName(ii)
				if parii == 'levels':
					isLevels = 'true'
				elif parii == 'consume':
					consume = 'true'
				else:
					amount = ii
		writeLine(f, intention, '"amount": '+amount+',')
		writeLine(f, intention, '"isLevels": '+isLevels+',')
		writeLine(f, intention, '"consume": '+consume+',')
		writeLine(f, intention, '"taskID": "bq_standard:xp",')
	elif(type=='SCORE'):
		m0 = task['items'][0]
		m1 = task['items'][1].split(':')
		m2 = task['items'][2].split(':')
		writeLine(f, intention, '"scoreName": "'+m1[0]+'",')
		writeLine(f, intention, '"scoreDisp": "'+m0+'",')
		writeLine(f, intention, '"type": '+m1[1]+',')
		writeLine(f, intention, '"operation": "'+m2[0]+'",')
		writeLine(f, intention, '"target": '+m2[1]+',')
		writeLine(f, intention, '"unitConversion": 1.0,')
		writeLine(f, intention, '"unitSuffix": "'+m2[2]+'",')
		writeLine(f, intention, '"taskID": "bq_standard:scoreboard",')
	elif(type=='HUNT'):
		subtypes = 'true'
		ignoreNBT = 'true'
		targetNBT = '{}'
		m1 = task['items'][0].split(':')
		for i in task['items'][1:]:
			m = i.split(':')
			nm = parseName(m[0])
			if nm[1:3] == 'sub':
				subtypes = parseName(m[1])
			elif nm[1:3] == 'nbt' or nm[1:3] == 'tag':
				ignoreNBT = 'false'
				targetNBT = m[1]
		writeLine(f, intention, '"target": "'+m1[0]+'",')
		writeLine(f, intention, '"required": "'+m1[1]+'",')
		writeLine(f, intention, '"subtypes": '+subtypes+',')
		writeLine(f, intention, '"ignoreNBT": '+ignoreNBT+',')
		writeLine(f, intention, '"targetNBT": '+targetNBT+',')
		writeLine(f, intention, '"taskID": "bq_standard:hunt",')
        # {
          # "target": "Villager",
          # "range": 4,
          # "amount": 1,
          # "subtypes": true,
          # "ignoreNBT": true,
          # "targetNBT": {},
          # "taskID": "bq_standard:meeting",
          # "index": 5
        # },
        # {
          # "consume": true,
          # "autoConsume": true,
          # "requiredFluids": [
            # {
              # "FluidName": "water",
              # "Amount": 1000
            # }
          # ],
          # "taskID": "bq_standard:fluid",
          # "index": 6
        # }
	else:
		printError('Unknown task type '+type+': '+str(task))
		print('Supported types are TRIGGER TRAVEL HAVE CRAFT')
		exit()

def writeRewardLines(f, intention, reward, items, quests):
	type = reward['type']
	if(type=='ALL'):
		writeLine(f, intention, '"rewards": [')
		iMax = len(reward['items'])
		iCnt = 0
		for it in reward['items']:
			iCnt = iCnt + 1
			m = it.split(':')
			item = items[parseName(m[0])]
			count = '1'
			if(len(m)>1):
				count = m[1]
			writeLine(f, intention+1, '{')
			writeItemLines(f, intention+2, item, count)
			writeLineCondition(f,intention+1,'},','}', iCnt==iMax)
		writeLine(f, intention, '],')
		writeLine(f, intention, '"rewardID": "bq_standard:item",')
	elif(type=='SAPLING'):
		writeLine(f, intention, '"rewards": [')
		iMax = len(reward['items'])
		iCnt = 0
		for it in reward['items']:
			iCnt = iCnt + 1
			m = it.split(':')
			item = items[parseName(m[0])]
			count = '1'
			if(len(m)>1):
				count = m[1]
			writeLine(f, intention+1, '{')
			writeItemLines(f, intention+2, item, count)
			writeLineCondition(f,intention+1,'},','}', iCnt==iMax)
		writeLine(f, intention, '],')
		writeLine(f, intention, '"rewardID": "forestryquesting:reward.tree",')
	elif(type=='BEE'):
		writeLine(f, intention, '"rewards": [')
		iMax = len(reward['items'])
		iCnt = 0
		for it in reward['items']:
			iCnt = iCnt + 1
			m = it.split(':')
			item = items[parseName(m[0])]
			count = '1'
			if(len(m)>1):
				count = m[1]
			writeLine(f, intention+1, '{')
			writeItemLines(f, intention+2, item, count)
			writeLineCondition(f,intention+1,'},','}', iCnt==iMax)
		writeLine(f, intention, '],')
		writeLine(f, intention, '"rewardID": "forestryquesting:reward.bee",')
	elif(type=='PICK'):
		writeLine(f, intention, '"choices": [')
		iMax = len(reward['items'])
		iCnt = 0
		for it in reward['items']:
			iCnt = iCnt + 1
			m = it.split(':')
			item = items[parseName(m[0])]
			count = '1'
			if(len(m)>1):
				count = m[1]
			writeLine(f, intention+1, '{')
			writeItemLines(f, intention+2, item, count)
			writeLineCondition(f,intention+1,'},','}', iCnt==iMax)
		writeLine(f, intention, '],')
		writeLine(f, intention, '"rewardID": "bq_standard:choice",')
	elif(type=='RESET'):
		quest = quests[parseName(reward['items'][0])]
		writeLine(f, intention, '"command": "/bq_admin reset '+quest['qid']+' VAR_NAME",')
		writeLine(f, intention, '"hideCommand": true,')
		writeLine(f, intention, '"viaPlayer": true,')
		writeLine(f, intention, '"rewardID": "bq_standard:command",')
	elif(type=='COMMAND'):
		writeLine(f, intention, '"command": "'+reward['items'][0]+'",')
		writeLine(f, intention, '"hideCommand": true,')
		writeLine(f, intention, '"viaPlayer": true,')
		writeLine(f, intention, '"rewardID": "bq_standard:command",')
	elif(type=='XP'):
		m = reward['items'][0].split(':')
		val = m[0]
		isLevels = 'false'
		if(len(m)>1):
			val = m[1]
			if(parseName(m[0])=='levels'):
				isLevels = 'true'
		writeLine(f, intention, '"amount": '+val+',')
		writeLine(f, intention, '"isLevels": '+isLevels+',')
		writeLine(f, intention, '"rewardID": "bq_standard:xp",')
	elif(type=='SCORE'):
		m1 = reward['items'][0].split(':')
		m2 = reward['items'][1].split(':')
		if(parseName(m2[0])=='set'):
			m2[0] = 'false'
		else:
			m2[0] = 'true'
		writeLine(f, intention, '"score": "'+m1[0]+'",')
		writeLine(f, intention, '"type": "'+m1[1]+'",')
		writeLine(f, intention, '"value": '+m2[1]+',')
		writeLine(f, intention, '"relative": '+m2[0]+',')
		writeLine(f, intention, '"rewardID": "bq_standard:scoreboard",')
	else:
		printError('Unknown reward type '+type+': '+str(reward))
		print('Supported types are ALL PICK RESET COMMAND XP SCORE SAPLING BEE')
		exit()


def getFiles( wildch ):
	mypath = os.getcwd()
	onlyfiles = [f for f in os.listdir(mypath) if os.path.isfile(os.path.join(mypath, f))]
	filtered = []
	for f in onlyfiles:
		if(re.match(wildch, f) != None):
			filtered.append(f)
	return filtered

def getLinesInFiles( wildch ):
	print('File search pattern: '+wildch)
	files = getFiles(wildch)
	print(files)

	lines = []
	for nm in files:
		with open(nm) as f:
			lns = f.readlines()
		f.closed
		print('File '+nm+', '+str(len(lns))+' lines')
		lines = lines + lns

	return lines
	
def expandWildchars( lst0, lstFull ):
	lst1 = []
	for it in lst0:
		if((it[0]=="<")and(it[-1]==">")):
			r = re.compile(it[1:-1])
			lst1.extend(list(filter(r.match, lstFull)))
		else:
			lst1.append(it)
	return lst1
########
# Data loading

# Get Items and Locations
print('\n--> Items and Locations')
lines = getLinesInFiles('items_in.*\.txt')

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
			'name': m[1],
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
        items[name]=theItem
    if (m[0]=='SAPLING'):
        name = parseName(m[1])
        if (len(m)<7):
            printWarning('Skipping SAPLING: '+name+', need parameters SAPLING # <name> # <isAnalyzed0/1> # <tree:growthLight/Dark:height:saplings:fruit:yield> # <plantType:sappiness:territory:leaves:maturation> # <i1d:i20:i4d> # <fireproof>')
            continue
        props1 = m[3].split(":")
        props2 = m[4].split(":")
        props3 = m[5].split(":")
        if (len(props1)<5):
            printWarning('Skipping SAPLING: '+name+', parameter 2 must be <tree:growthLight/Dark:height:saplings:fruit:yield>')
            continue
        if (len(props2)<5):
            printWarning('Skipping SAPLING: '+name+', parameter 3 must be <plantType:sappiness:territory:leaves:maturation>')
            continue
        if (len(props3)<3):
            printWarning('Skipping SAPLING: '+name+', parameter 4 must be <i1d:i20:i4d>')
            continue
        chromozomes = []
        for attr in props1:
            chromozomes.append('{ "UID1:8": "forestry.'+attr+'", "UID0:8": "forestry.'+attr+'", "Slot:1": '+str(len(chromozomes))+' }')
        for attr in props2:
            chromozomes.append('{ "UID1:8": "forestry.'+attr+'", "UID0:8": "forestry.'+attr+'", "Slot:1": '+str(len(chromozomes))+' }')
        for attr in props3:
            chromozomes.append('{ "UID1:8": "forestry.'+attr+'", "UID0:8": "forestry.'+attr+'", "Slot:1": '+str(len(chromozomes))+' }')
        chromozomes.append('{ "UID1:8": "forestry.'+m[6]+'", "UID0:8": "forestry.'+m[6]+'", "Slot:1": '+str(len(chromozomes))+' }')
        nbt = '{ "IsAnalyzed:1": '+m[2]+', "Genome:10": { "Chromosomes:9": ['+', '.join(chromozomes)+'] } }'

        theItem = {
            'package': 'forestry',
            'name': 'sapling',
            'damage': '0',
            'nbt': nbt,
            'ore': ''
        }
        items[name]=theItem
    if (m[0]=='BEE'):
        name = parseName(m[1])
        if (len(m)<7):
            printWarning('Skipping BEE: '+name+', need parameters BEE # <name> # <isAnalyzed0/1> # <Queen/Princess/Drone:health> # <species:speed:lifespan:fertility> # <temp_tolerance:diurnal(bool):hum_tolerance> # <raintolerant(bool):noctural(bool):flowers:flowering:territory:effect>')
            continue
        props0 = m[3].split(":")
        props1 = m[4].split(":")
        props2 = m[5].split(":")
        props3 = m[6].split(":")
        if (len(props0)<2):
            printWarning('Skipping BEE: '+name+', parameter 2 must be <Queen/Princess/Drone:health>')
            continue
        if (len(props1)<4):
            printWarning('Skipping BEE: '+name+', parameter 3 must be <species:speed:lifespan:fertility>')
            continue
        if (len(props2)<3):
            printWarning('Skipping BEE: '+name+', parameter 4 must be <hum_tolerance:noctural:temp_tolerance>')
            continue
        if (len(props3)<6):
            printWarning('Skipping BEE: '+name+', parameter 5 must be <bool:bool:flowers:flowering:territory:effect>')
            continue
        chromozomes = []
        for attr0 in props1:
            attr = attr0 if len(attr0.split(".")) == 2 else 'forestry.'+attr0
            chromozomes.append('{ "UID1:8": "'+attr+'", "UID0:8": "'+attr+'", "Slot:1": '+str(len(chromozomes))+' }')
        for attr0 in props2:
            attr = attr0 if len(attr0.split(".")) == 2 else 'forestry.'+attr0
            chromozomes.append('{ "UID1:8": "'+attr+'", "UID0:8": "'+attr+'", "Slot:1": '+str(len(chromozomes))+' }')
        for attr0 in props3:
            attr = attr0 if len(attr0.split(".")) == 2 else 'forestry.'+attr0
            chromozomes.append('{ "UID1:8": "'+attr+'", "UID0:8": "'+attr+'", "Slot:1": '+str(len(chromozomes))+' }')
        nbt = '{ "MaxH:3": '+props0[1]+', "Health:3": '+props0[1]+', "IsAnalyzed:1": '+m[2]+', "Genome:10": { "Chromosomes:9": ['+', '.join(chromozomes)+'] } }'

        theItem = {
            'package': 'forestry',
            'name': 'bee'+props0[0]+'GE',
            'damage': '0',
            'nbt': nbt,
            'ore': ''
        }
        items[name]=theItem
        

print ('Loaded '+str(len(list(locations.keys())))+' location(s).')
print ('Loaded '+str(len(list(items.keys())))+' item(s).')

# Get quests
print('\n--> Quests')
lines = getLinesInFiles('quests_in.*\.txt')

theQ = { 'id':'' }
quests={}
qids={}
confliktQIDs=[]
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
        if (len(m)<4):
            printError('Skipping QUEST: '+line+', need QUEST # <id> # <name> # <#id>')
            exit()
        theQ = {
            'id': parseName(m[1]),
            'name': m[2],
            'preqType': 'none',
            'tasks': [],
            'rewards': [],
			'qid': m[3],
			'main': 'false',
			'chain': False
        }
        if (m[3] in qids):
            confliktQIDs.append(m[3])
            qids[m[3]].append(parseName(m[1])+'-'+m[2])
        else:
            qids[m[3]] = [parseName(m[1])+'-'+m[2]]
    if (m[0]=='TEXT'):
        theQ['text'] = m[1]
    if (m[0]=='PREREQ'):
        if (len(m)<3):
            printError('Skipping PREREQ: '+line+', need PREREQ # <type> # <id1> # <id2> ...')
            exit()
        theQ['preqType'] = parseName(m[1])
        theQ['preqIds'] = list(map(lambda x: parseName(x),m[2:]))
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
                'items': m[2:]
            }
        theQ['tasks'].append(newTask)
    if (m[0]=='REWARD'):
        if (len(m)<3):
            printError('Skipping REWARD: '+line+', need REWARD # <type> # <param1> # <param2> ...')
            exit()
        newReward = {
            'type': m[1],
            'items': m[2:]
        }
        theQ['rewards'].append(newReward)
if(theQ['id']!=''):
    quests[theQ['id']]=theQ;
print ('Loaded '+str(len(list(quests.keys())))+' quests(s).')

# Get quest lines
print('\n--> Quest lines')
lines = getLinesInFiles('questlines_in.*\.txt')

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
            'pos': list(map(lambda x: float(x), m[2].split(':'))),
            'size': m[3]
        }
        quests[newQ['id']]['ico'] = parseName(m[4])
        for p in m[5:]:
            m1 = p.split(':')
            nm = parseName(m1[0])
            if(nm=='main'):
                quests[newQ['id']]['main'] = 'true'
            elif(nm=='chain'):
                quests[newQ['id']]['chain'] = True
            else:
                printWarning('Quest '+theL['name']+'/'+newQ['id']+': skipping unknown parameter '+p)
        theL['quests'].append(newQ)
if(theL['id']!=''):
    questlines.append(theL)
print ('Loaded '+str(len(questlines))+' questline(s).')

if(len(confliktQIDs) > 0):
    printError('Conflikt QUESTIDs detected: '+str(confliktQIDs))
    for id0 in confliktQIDs:
        print('qid '+id0+': '+str(qids[id0]))
        found = []
        needIDs = len(qids[id0]);
        id = int(id0)		
        while len(found) < needIDs:
            if(str(id) not in qids):
                found.append(id)
            id = id + 1
        print('free ids: '+str(found))
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
iMax = len(list(quests.keys()))
iCnt = 0
print('\n== Quests ==')
questNames = quests.keys()
for id in questNames:
	iCnt = iCnt + 1
	q = quests[id]
	print(id+': '+q['name'])
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
	if(q['chain']==True):	
		writeLine(f,5,'"visibility": "CHAIN",')
	writeLine(f,5,'"isMain": '+q['main']+',')
	writeLine(f,5,'"simultaneous": false,')
	writeLine(f,5,'"globalShare": false,')
	writeLine(f,5,'"lockedProgress": false,')
	writeLine(f,5,'"taskLogic": "AND",')
	writeLine(f,5,'"repeatTime": -1,')
	if(q['preqType']=='none'):
		writeLine(f,5,'"questLogic": "AND"')
	else:
		writeLine(f,5,'"questLogic": "'+q['preqType'].upper()+'"')
	writeLine(f,4,'}')
	writeLine(f,3,'},')
	jMax = len(q['tasks'])
	jCnt = 0
	if(jMax==0):
		writeLine(f,3,'"tasks": [],')
	else:
		writeLine(f,3,'"tasks": [')
		for t in q['tasks']:
			jCnt = jCnt + 1
			writeLine(f,4,'{')
			writeTaskLines(f, 5, t, items, locations)
			writeLine(f,5,'"index": '+str(jCnt-1))
			writeLineCondition(f,4,'},','}', jCnt==jMax)
		writeLine(f,3,'],')
	kMax = len(q['rewards'])
	kCnt = 0
	if(kMax==0):
		writeLine(f,3,'"rewards": [],')
	else:
		writeLine(f,3,'"rewards": [')
		for r in q['rewards']:
			kCnt = kCnt + 1
			writeLine(f,4,'{')
			writeRewardLines(f, 5, r, items, quests)
			writeLine(f,5,'"index": '+str(kCnt-1))
			writeLineCondition(f,4,'},','}', kCnt==kMax)
		writeLine(f,3,'],')

	if(q['preqType']=='none'):
		writeLine(f,3,'"preRequisites": [],')
	else:
		writeLine(f,3,'"preRequisites": [ '+', '.join(map(lambda x: quests[x]['qid'], expandWildchars(q['preqIds'], questNames)))+' ],')
	writeLine(f,3,'"questID": '+q['qid'])
	writeLineCondition(f,2,'},','}', iCnt==iMax)
writeLine(f,1,'],')
print('\n== Quest Lines ==')
writeLine(f,1,'"questLines": [')
lMax = len(questlines)
lid = 0
for ln in questlines:
	print(ln['id']+': '+ln['name'])
	pos = list(map(lambda x: float(x), ln['pos']))
	size = list(map(lambda x: float(x), ln['size']))
	writeLine(f,2,'{')
	writeLine(f,3,'"properties": {')
	writeLine(f,4,'"betterquesting": {')
	writeLine(f,5,'"name": "'+ln['name']+'",')
	writeLine(f,5,'"bg_image": "",')
	writeLine(f,5,'"bg_size": 256,')
	writeLine(f,5,'"desc": "'+ln['text']+'"')
	writeLine(f,4,'}')
	writeLine(f,3,'},')
	writeLine(f,3,'"quests": [')
	iMax = len(ln['quests'])
	iCnt = 0
	for q in ln['quests']:
		iCnt = iCnt + 1
		halfSize = int(q['size'])/2
		posx = str(int(q['pos'][0]*size[0] + pos[0])-halfSize)
		posy = str(int(q['pos'][1]*size[1] + pos[1])-halfSize)
		print('\t'+q['id']+': '+posx+':'+posy)
		writeLine(f,4,'{')
		writeLine(f,5,'"size": '+q['size']+',')
		writeLine(f,5,'"x": '+posx+',')
		writeLine(f,5,'"y": '+posy+',')
		writeLine(f,5,'"id": '+quests[q['id']]['qid'])
		writeLineCondition(f,4,'},','}', iCnt==iMax)
	writeLine(f,3,'],')
	writeLine(f,3,'"lineID": '+str(lid)+',')
	writeLine(f,3,'"order": '+str(lid))
	lid = lid + 1
	writeLineCondition(f,2,'},','}', lid==lMax)
writeLine(f,1,'],')
writeLine(f,1,'"format": "1.0.0"')
writeLine(f,0,'}')
f.close()