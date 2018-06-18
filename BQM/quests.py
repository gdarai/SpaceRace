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
    writeLine(f, intention, '"id:8": "'+item['package']+':'+item['name']+'",')
    writeLine(f, intention, '"Count:3": '+count+',')
    writeLine(f, intention, '"OreDict:8": "'+item['ore']+'",')
    if(item['nbt']!='no'):
        writeLine(f, intention, '"tag:10": '+item['nbt']+',')
    writeLine(f, intention, '"Damage:3": '+item['damage'])

def printTaskItemList(f, intention, text, taskItems, items):
	writeLine(f, intention, '"'+text+':9": {')
	iMax = len(taskItems)
	iCnt = 0
	for it in taskItems:
		iCnt = iCnt + 1
		m = it.split(':')
		item = items[parseName(m[0])]
		count = '1'
		if(len(m)>1):
			count = m[1]
		writeLine(f, intention+1, '"'+str(iCnt-1)+':10": {')
		writeItemLines(f, intention+2, item, count)
		writeLineCondition(f,intention+1,'},','}', iCnt==iMax)
	writeLine(f, intention, '},')

def writeTaskLines(f, intention, task, items, locs):
	type = task['type']
	if(type=='TRIGGER'):
		writeLine(f, intention, '"taskID": "bq_standard:checkbox",')
	elif(type=='TRAVEL'):
		loc = locs[parseName(task['items'][0])]
		writeLine(f, intention, '"name:8": "'+loc['name']+'",')
		writeLine(f, intention, '"posX:3": '+loc['x']+',')
		writeLine(f, intention, '"posY:3": '+loc['y']+',')
		writeLine(f, intention, '"posZ:3": '+loc['z']+',')
		writeLine(f, intention, '"dimension:3": '+loc['dim']+',')
		writeLine(f, intention, '"range:3": '+loc['radius']+',')
		writeLine(f, intention, '"visible:1": 1,')
		writeLine(f, intention, '"hideInfo:1": 0,')
		writeLine(f, intention, '"taskID:8": "bq_standard:location",')
	elif(type=='HAVE'):
		writeLine(f, intention, '"partialMatch:1": 0,')
		writeLine(f, intention, '"ignoreNBT:1": 0,')
		writeLine(f, intention, '"consume:1": 0,')
		writeLine(f, intention, '"groupDetect:1": 0,')
		writeLine(f, intention, '"autoConsume:1": 0,')
		printTaskItemList(f, intention, 'requiredItems', task['items'], items)
		writeLine(f, intention, '"taskID:8": "bq_standard:retrieval",')
	elif(type=='GIVE'):
		writeLine(f, intention, '"partialMatch:1": 1,')
		writeLine(f, intention, '"ignoreNBT:1": 0,')
		writeLine(f, intention, '"consume:1": 1,')
		writeLine(f, intention, '"groupDetect:1": 0,')
		writeLine(f, intention, '"autoConsume:1": 0,')
		printTaskItemList(f, intention, 'requiredItems', task['items'], items)
		writeLine(f, intention, '"taskID:8": "bq_standard:retrieval",')
	elif(type=='CRAFT'):
		writeLine(f, intention, '"partialMatch:1": 1,')
		writeLine(f, intention, '"ignoreNBT:1": 0,')
		printTaskItemList(f, intention, 'requiredItems', task['items'], items)
		writeLine(f, intention, '"taskID:8": "bq_standard:crafting",')
	elif(type=='LIQUID'):
		m = task['items'][0].split(':')
		writeLine(f, intention, '"consume:1": 1,')
		writeLine(f, intention, '"autoConsume:1": 0,')
		writeLine(f, intention, '"requiredFluids:9": {')
		writeLine(f, intention+1, '"0:10": {')
		writeLine(f, intention+2, '"FluidName:8": "'+m[0]+'",')
		writeLine(f, intention+2, '"Amount:3": '+m[1])
		writeLine(f, intention+1, '}')
		writeLine(f, intention, '},')
		writeLine(f, intention, '"taskID:8": "bq_standard:fluid",')
	elif(type=='RF_RATE'):
		m = task['items'][0].split(':')
		writeLine(f, intention, '"rf:3": '+m[0]+',')
		writeLine(f, intention, '"duration:3": '+m[1]+',')
		writeLine(f, intention, '"voidExcess:1": 1,')
		writeLine(f, intention, '"taskID:8": "bq_rf:rf_rate",')
	elif(type=='RF_CHARGE'):
		writeLine(f, intention, '"rf:3": '+task['items'][0]+',')
		writeLine(f, intention, '"taskID:8": "bq_rf:rf_charge",')
	elif(type=='XP'):
		isLevels = '0'
		consume = '0'
		amount = '1'
		for i in task['items']:
			m = i.split(':')
			for ii in m:
				parii = parseName(ii)
				if parii == 'levels':
					isLevels = '1'
				elif parii == 'consume':
					consume = '1'
				else:
					amount = ii
		writeLine(f, intention, '"amount:3": '+amount+',')
		writeLine(f, intention, '"isLevels:1": '+isLevels+',')
		writeLine(f, intention, '"consume:1": '+consume+',')
		writeLine(f, intention, '"taskID:8": "bq_standard:xp",')
	elif(type=='SCORE'):
		m0 = task['items'][0]
		m1 = task['items'][1].split(':')
		m2 = task['items'][2].split(':')
		writeLine(f, intention, '"scoreName:8": "'+m1[0]+'",')
		writeLine(f, intention, '"scoreDisp:8": "'+m0+'",')
		writeLine(f, intention, '"type:8": '+m1[1]+',')
		writeLine(f, intention, '"operation:8": "'+m2[0]+'",')
		writeLine(f, intention, '"target:3": '+m2[1]+',')
		writeLine(f, intention, '"unitConversion:5": 1.0,')
		writeLine(f, intention, '"unitSuffix:8": "'+m2[2]+'",')
		writeLine(f, intention, '"taskID:8": "bq_standard:scoreboard",')
	elif(type=='HUNT'):
		subtypes = '1'
		ignoreNBT = '1'
		targetNBT = '{}'
		m1 = task['items'][0].split(':')
		for i in task['items'][1:]:
			m = i.split(':')
			nm = parseName(m[0])
			if nm[1:3] == 'sub':
				subtypes = parseName(m[1])
			elif nm[1:3] == 'nbt' or nm[1:3] == 'tag':
				ignoreNBT = '0'
				targetNBT = m[1]
		writeLine(f, intention, '"target:8": "'+m1[0]+'",')
		writeLine(f, intention, '"required:3": "'+m1[1]+'",')
		writeLine(f, intention, '"subtypes:1": '+subtypes+',')
		writeLine(f, intention, '"ignoreNBT:1": '+ignoreNBT+',')
		writeLine(f, intention, '"targetNBT:10": '+targetNBT+',')
		writeLine(f, intention, '"taskID:8": "bq_standard:hunt",')
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
	else:
		printError('Unknown task type '+type+': '+str(task))
		print('Supported types are TRIGGER TRAVEL HAVE CRAFT LIQUID RF_RATE RF_CHARGE XP SCORE HUNT')
		exit()

def writeRewardLines(f, intention, reward, items, quests):
	type = reward['type']
	if(type=='ALL'):
		printTaskItemList(f, intention, 'rewards', reward['items'], items)
		writeLine(f, intention, '"rewardID:8": "bq_standard:item",')
	elif(type=='SAPLING'):
		printTaskItemList(f, intention, 'rewards', reward['items'], items)
		writeLine(f, intention, '"rewardID:8": "bq_standard:item",')
	elif(type=='BEE'):
		printTaskItemList(f, intention, 'rewards', reward['items'], items)
		writeLine(f, intention, '"rewardID:8": "bq_standard:item",')
	elif(type=='PICK'):
		printTaskItemList(f, intention, 'choices', reward['items'], items)
		writeLine(f, intention, '"rewardID:8": "bq_standard:choice",')
	elif(type=='RESET'):
		quest = quests[parseName(reward['items'][0])]
		writeLine(f, intention, '"command:8": "/bq_admin reset '+quest['qid']+' VAR_NAME",')
		writeLine(f, intention, '"hideCommand:1": 1,')
		writeLine(f, intention, '"viaPlayer:1": 1,')
		writeLine(f, intention, '"rewardID:8": "bq_standard:command",')
	elif(type=='COMMAND'):
		writeLine(f, intention, '"command:8": "'+reward['items'][0]+'",')
		writeLine(f, intention, '"hideCommand:1": 1,')
		writeLine(f, intention, '"viaPlayer:1": 1,')
		writeLine(f, intention, '"rewardID:8": "bq_standard:command",')
	elif(type=='XP'):
		m = reward['items'][0].split(':')
		val = m[0]
		isLevels = '0'
		if(len(m)>1):
			val = m[1]
			if(parseName(m[0])=='levels'):
				isLevels = '1'
		writeLine(f, intention, '"amount:3": '+val+',')
		writeLine(f, intention, '"isLevels:1": '+isLevels+',')
		writeLine(f, intention, '"rewardID:8": "bq_standard:xp",')
	elif(type=='SCORE'):
		m1 = reward['items'][0].split(':')
		m2 = reward['items'][1].split(':')
		if(parseName(m2[0])=='set'):
			m2[0] = '0'
		else:
			m2[0] = '1'
		writeLine(f, intention, '"score:8": "'+m1[0]+'",')
		writeLine(f, intention, '"type:8": "'+m1[1]+'",')
		writeLine(f, intention, '"value:3": '+m2[1]+',')
		writeLine(f, intention, '"relative:1": '+m2[0]+',')
		writeLine(f, intention, '"rewardID:8": "bq_standard:scoreboard",')
	else:
		printError('Unknown reward type '+type+': '+str(reward))
		print('Supported types are ALL SAPLING BEE PICK RESET COMMAND XP SCORE')
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
    
def addChromozomes  ( chList, attrList ):
    for attr0 in attrList:
        attr = attr0 if len(attr0.split(".")) == 2 else 'forestry.'+attr0
        index = str(len(chList))
        chList.append('"'+index+':10": { "UID1:8": "'+attr+'", "UID0:8": "'+attr+'", "Slot:1": '+index+' }')
    return chList

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
        chromozomes = addChromozomes(chromozomes, props1)
        chromozomes = addChromozomes(chromozomes, props2)
        chromozomes = addChromozomes(chromozomes, props3)
        chromozomes = addChromozomes(chromozomes, [m[6]])
        nbt = '{ "IsAnalyzed:1": '+m[2]+', "Genome:10": { "Chromosomes:9": {'+', '.join(chromozomes)+'} } }'

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
        chromozomes = addChromozomes(chromozomes, props1)
        chromozomes = addChromozomes(chromozomes, props2)
        chromozomes = addChromozomes(chromozomes, props3)
        chromoString = '{ "Chromosomes:9": {'+', '.join(chromozomes)+'} }'
        if props0[0] == 'Queen':
            nbt = '{ "MaxH:3": '+props0[1]+', "Health:3": '+props0[1]+', "IsAnalyzed:1": '+m[2]+', "Mate:10": '+chromoString+', "Genome:10": '+chromoString+' }'            
        else:
            nbt = '{ "MaxH:3": '+props0[1]+', "Health:3": '+props0[1]+', "IsAnalyzed:1": '+m[2]+', "Genome:10": '+chromoString+' }'

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
			'main': '0',
			'chain': False,
            'repeat': '-1',
            'auto': '1',
            'simul': '0',
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
                quests[newQ['id']]['main'] = '1'
            elif(nm=='chain'):
                quests[newQ['id']]['chain'] = True
            elif(nm=='repeat'):
                quests[newQ['id']]['repeat'] = m1[1]
                quests[newQ['id']]['auto'] = '0'
                quests[newQ['id']]['simul'] = '1'
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
writeLine(f,1,'"questSettings:10": {')
writeLine(f,2,'"betterquesting:10": {')
writeLine(f,3,'"livesMax:3": 10,')
writeLine(f,3,'"livesDef:3": 3,')
writeLine(f,3,'"home_anchor_x:5": 0.5,')
writeLine(f,3,'"home_anchor_y:5": 0.0,')
writeLine(f,3,'"hardcore:1": 0,')
writeLine(f,3,'"home_image:8": "betterquesting:textures/gui/default_title.png",')
writeLine(f,3,'"editMode:1": 0,')
writeLine(f,3,'"home_offset_x:3": -128,')
writeLine(f,3,'"home_offset_y:3": 0')
writeLine(f,2,'}')
writeLine(f,1,'},')
writeLine(f,1,'"questDatabase:9": {')
iMax = len(list(quests.keys()))
iCnt = 0
print('\n== Quests ==')
questNames = quests.keys()
for id in questNames:
	iCnt = iCnt + 1
	q = quests[id]
	qIdx = str(iCnt-1)
	print(id+': '+q['name']+' ('+qIdx+')')
	writeLine(f,2,'"'+qIdx+':10": {')
	writeLine(f,3,'"properties:10": {')
	writeLine(f,4,'"betterquesting:10": {')
	writeLine(f,5,'"name:8": "'+q['name']+'",')
	writeLine(f,5,'"desc:8": "'+q['text']+'",')
	writeLine(f,5,'"snd_complete:8": "minecraft:entity.player.levelup",')
	writeLine(f,5,'"snd_update:8": "minecraft:entity.player.levelup",')
	writeLine(f,5,'"icon:10": {')
	writeItemLines(f,6,items[q['ico']],'1')
	writeLine(f,5,'},')
	writeLine(f,5,'"autoClaim:1": '+q['auto']+',')
	writeLine(f,5,'"isSilent:1": '+q['simul']+',')
	writeLine(f,5,'"partySingleReward:1": 0,')
	if(q['chain']==True):
		writeLine(f,5,'"visibility:8": "CHAIN",')
	writeLine(f,5,'"isMain:1": '+q['main']+',')
	writeLine(f,5,'"simultaneous:1": '+q['simul']+',')
	writeLine(f,5,'"globalShare:1": 0,')
	writeLine(f,5,'"lockedProgress:1": 0,')
	writeLine(f,5,'"taskLogic:8": "AND",')
	writeLine(f,5,'"repeatTime:3": '+q['repeat']+',')
	if(q['preqType']=='none'):
		writeLine(f,5,'"questLogic:8": "AND"')
	else:
		writeLine(f,5,'"questLogic:8": "'+q['preqType'].upper()+'"')
	writeLine(f,4,'}')
	writeLine(f,3,'},')
	jMax = len(q['tasks'])
	jCnt = 0
	if(jMax==0):
		writeLine(f,3,'"tasks:9": {},')
	else:
		writeLine(f,3,'"tasks:9": {')
		for t in q['tasks']:
			taskIdx = str(jCnt)
			jCnt = jCnt + 1
			writeLine(f,4,'"'+taskIdx+':10": {')
			writeTaskLines(f, 5, t, items, locations)
			writeLine(f,5,'"index:3": '+taskIdx)
			writeLineCondition(f,4,'},','}', jCnt==jMax)
		writeLine(f,3,'},')
	kMax = len(q['rewards'])
	kCnt = 0
	if(kMax==0):
		writeLine(f,3,'"rewards:9": {},')
	else:
		writeLine(f,3,'"rewards:9": {')
		for r in q['rewards']:
			rewardIdx = str(kCnt)
			kCnt = kCnt + 1
			writeLine(f,4,'"'+rewardIdx+':10": {')
			writeRewardLines(f, 5, r, items, quests)
			writeLine(f,5,'"index:3": '+rewardIdx)
			writeLineCondition(f,4,'},','}', kCnt==kMax)
		writeLine(f,3,'},')

	if(q['preqType']=='none'):
		writeLine(f,3,'"preRequisites:11": [],')
	else:
		writeLine(f,3,'"preRequisites:11": [ '+', '.join(map(lambda x: quests[x]['qid'], expandWildchars(q['preqIds'], questNames)))+' ],')
	writeLine(f,3,'"questID:3": '+q['qid'])
	writeLineCondition(f,2,'},','}', iCnt==iMax)
writeLine(f,1,'},')
print('\n== Quest Lines ==')
writeLine(f,1,'"questLines:9": {')
lMax = len(questlines)
lid = 0
for ln in questlines:
	print(ln['id']+': '+ln['name'])
	pos = list(map(lambda x: float(x), ln['pos']))
	size = list(map(lambda x: float(x), ln['size']))
	writeLine(f,2,'"'+str(lid)+':10": {')
	writeLine(f,3,'"properties:10": {')
	writeLine(f,4,'"betterquesting:10": {')
	writeLine(f,5,'"name:8": "'+ln['name']+'",')
	writeLine(f,5,'"bg_image:8": "",')
	writeLine(f,5,'"bg_size:3": 256,')
	writeLine(f,5,'"desc:8": "'+ln['text']+'"')
	writeLine(f,4,'}')
	writeLine(f,3,'},')
	writeLine(f,3,'"quests:9": {')
	iMax = len(ln['quests'])
	iCnt = 0
	for q in ln['quests']:
		questIdx = str(iCnt)
		iCnt = iCnt + 1
		halfSize = int(q['size'])/2
		posx = str(int(q['pos'][0]*size[0] + pos[0]-halfSize))
		posy = str(int(q['pos'][1]*size[1] + pos[1]-halfSize))
		print('\t'+q['id']+': '+posx+':'+posy)
		writeLine(f,4,'"'+questIdx+':10": {')
		writeLine(f,5,'"size:3": '+q['size']+',')
		writeLine(f,5,'"x:3": '+posx+',')
		writeLine(f,5,'"y:3": '+posy+',')
		writeLine(f,5,'"id:3": '+quests[q['id']]['qid'])
		writeLineCondition(f,4,'},','}', iCnt==iMax)
	writeLine(f,3,'},')
	writeLine(f,3,'"lineID:3": '+str(lid)+',')
	writeLine(f,3,'"order:3": '+str(lid))
	lid = lid + 1
	writeLineCondition(f,2,'},','}', lid==lMax)
writeLine(f,1,'},')
writeLine(f,1,'"format:8": "2.0.0"')
writeLine(f,0,'}')
f.close()
