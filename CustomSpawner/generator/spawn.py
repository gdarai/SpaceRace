import re
import os
import copy
import shutil

########
# Globals
canPrint = True;

typeParams = ['D:chunkgenspawnchance', 'I:mobspawnrange', 'S:shouldseesky', 'I:spawncap', 'I:spawntickrate', 'I:maxspawnheight', 'I:minspawnheight']
entitParams = ['B:canSpawn', 'I:frequency', 'I:maxChunk', 'I:maxLightlevel', 'I:maxSpawn', 'I:maxSpawnHeight', 'I:minLightlevel', 'I:minSpawn', 'I:minSpawnHeight', 'S:opaqueBlock', 'S:spawnBlockBlacklist ', 'S:type']
# + 'S:biomegroups ' + 'S:type' #
########
# Superglobals

def printError(text):
	print('!ERR '+text);
	canPrint = False;

def printWarning(text):
	print('WARN '+text);

def writeLine(f, intention, text):
	f.write('    '*intention+text+'\n');

def writeLineCondition(f, intention, textNo, textYes, condition):
	if(condition):
		f.write('    '*intention+textYes+'\n');
	else:
		f.write('    '*intention+textNo+'\n');

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

def processLastObject( data, newObject ):
    if (newObject == {}):
        return data
    if (newObject['type'] == 'type'):
        data['types'][newObject['name']]=copy.deepcopy(newObject)
        return data

def readList( pointyList ):
    return pointyList[1:-1].split(":")

def readParam( param ):
    if("=" in param ):
        return param[4:].split("=")
    elif("<" in param ):
        spl = param[4:].split("<")
        name = spl[0]
        lst = spl[1][0:-1].split(":")
        out = [name] + lst
        return out
    else:
        printError('cannot process parameter '+param)

def addParameter( parDict, newPar ):
    parName = readParam(newPar)[0]
    parDict[parName] = newPar
    return parDict
########
# Data loading

# Get Biome Maps
print('\n--> Parsing Groups')
lines = getLinesInFiles('source.*\.txt')

data = {}
data['biomes'] = {}
data['owners'] = {}
data['types'] = {}
newObject={}
for line in lines:
    if(line[0:2]=='//'):
        continue
    if((line == '\n')or(line == '\r\n')):
        continue
    cmd = parseLine(line)[0]
    if(cmd=='TYPE'):
        data = processLastObject(data, newObject)
        ln = parseLine(line)
        newObject = {}
        newObject['type'] = 'type'
        newObject['name'] = ln[1]
        newObject['params'] = {}
        newObject['entities'] = []
        newObject['owner'] = ''
        print('NEW Type Group '+ln[1])
    elif(cmd=='BIOME'):
        data = processLastObject(data, newObject)
        newObject = {}
        ln = parseLine(line)
        data['biomes'][ln[1]] = readList(ln[2])
        print('NEW Biome Group '+ln[1]+' '+str(len(data['biomes'][ln[1]])))
    elif(newObject['type']=='type'):
        if(cmd=='CREATURES'):
            newObject['entities'] = parseLine(line)[1:]
            print(' - ENTRIES:'+str(newObject['entities']))
        elif(cmd=='PARENT'):
            parName = parseLine(line)[1]
            if(parName in data['types']):
                print(' - PARENT: '+parName)
                sourcePar =  data['types'][parName]['params']
                for par in sourcePar.keys():
                    newObject['params'] = addParameter(newObject['params'], sourcePar[par]);
            else:
                printError('parent '+parName+' not existent ('+str(data['types'].keys())+')')
        elif(cmd=='OWNER'):
            owner = parseLine(line)[1]
            newObject['owner'] = owner
            print(' - OWNER: '+owner)
            if owner in data['owners']:
                data['owners'][owner].append(newObject['name'])
            else:
                data['owners'][owner] = [newObject['name']]
        else:
            parName = readParam(line[0:-1])[0]
            if parName in typeParams:
                newObject['params']['S:type'] = '    S:type='+newObject['name']
            newObject['params'] = addParameter(newObject['params'], line[0:-1]);
            print(line[0:-1])
data = processLastObject(data, newObject)

# Printing
print('\nCan Print: '+str(canPrint))
if canPrint == False:
	exit()

# Empty the output directory
directory = 'output'
if os.path.exists(directory):
    shutil.rmtree(directory)
if not os.path.exists(directory):
    os.makedirs(directory)

# Let's do it
data['usedTypes'] = {}
data['usedBiomes'] = {}
crDir = directory+'/'+'Creatures'

os.makedirs(crDir)
# Print Creatures files
for owner in data['owners'].keys():
    f = open(crDir+'/'+owner+'.cfg','w')
    print('Printing '+crDir+'/'+owner+'.cfg')
    writeLine(f,0,'# Configuration file')
    for entityType in data['owners'][owner]:
        print(' - Entity '+entityType)
        d = data['types'][entityType]
        for anim in d['entities']:
            print(' - - '+anim)
            writeLine(f,0,'')
            writeLine(f,0,'####################')
            writeLine(f,0,'# '+anim)
            writeLine(f,0,'####################')
            writeLine(f,0,'')
            writeLine(f,0,anim+' {')
            if 'S:biomegroups ' not in d['params']:
                printError('entity '+entityType+' is missing parameter S:biomegroups ')
            biom = readParam(d['params']['S:biomegroups '])
            biomName = owner+'_'+anim.upper()+'_DEFAULT'
            data['biomes'][biomName] = biom[1:]
            writeLine(f,1,'S:biomegroups <'+biomName+'>')
            for param in entitParams:
                if param not in d['params']:
                    printError('entity '+entityType+' is missing parameter '+param)
                else:
                    writeLine(f,0,d['params'][param])
            biom = readParam(d['params']['S:biomegroups '])
            for b in biom[1:]:
                data['usedBiomes'][biomName] = 'used'
            usedType = readParam(d['params']['S:type'])[1]
            data['usedTypes'][usedType] = 'used'
            writeLine(f,0,'}')
    f.close()
# Print EntitySpawnTypes file
f = open(directory+'/EntitySpawnTypes.cfg','w')
print('Printing '+directory+'/EntitySpawnTypes.cfg')
writeLine(f,0,'# Configuration file')
for typ in data['usedTypes'].keys():
    print(' - typ '+typ)
    writeLine(f,0,'')
    d = data['types'][typ]
    writeLine(f,0,'####################')
    writeLine(f,0,'# '+typ)
    writeLine(f,0,'####################')
    writeLine(f,0,'')
    writeLine(f,0,typ+' {')
    for param in typeParams:
        if param not in d['params']:
            printError('entity '+typ+' is missing parameter '+param)
        else:
            writeLine(f,0,d['params'][param])
    writeLine(f,0,'}')
f.close()
# Print EntityBiomeGroups file
f = open(directory+'/EntityBiomeGroups.cfg','w')
print('Printing '+directory+'/EntityBiomeGroups.cfg')
writeLine(f,0,'# Configuration file')
writeLine(f,0,'')
writeLine(f,0,'####################')
writeLine(f,0,'# biomegroup-defaults')
writeLine(f,0,'####################')
writeLine(f,0,'')
writeLine(f,0,'biomegroup-defaults {')
for biom in data['usedBiomes'].keys():
    print(' - biome '+biom)
    biomOut = {}
    biomOut[data['biomes'][biom][0]]='ok'
    parseBiom = True
    while parseBiom:
        parseBiom = False
        biomIn = biomOut.keys()
        biomOut = {}
        for nm in biomIn:
            if(nm==""):
                continue
            if "|" in nm:
                biomOut[nm] = 'ok'
            else:
                if nm not in data['biomes']:
                    printError('when interpretting biome '+biom+' found missing definition: '+nm)
                for b in data['biomes'][nm]:
                    biomOut[b] = 'ok'
                parseBiom = True
    biomeListString = ":".join(biomOut.keys())
    writeLine(f,1,biom+' <'+biomeListString+'>')
writeLine(f,0,'}')
writeLine(f,0,'')
f.close()