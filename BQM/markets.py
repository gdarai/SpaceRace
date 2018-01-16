import re;

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

########
# Data loading

# Get item list
with open('m_items.txt') as f:
	lines = f.readlines()
f.closed

items = {}
for line in lines:
	m = line[0:-1].split('\t')
	if len(m)==3: m.append('')
	newItem = {}
	newItem["itemId"]=m[0]
	newItem["emc"]=int(m[2])
	newItem["hasNug"]=False
	if(m[3]!=""):
		newItem["nugId"]=m[3]
		newItem["hasNug"]=True
	name = m[1].lower()
	if name in items:
		print('item '+name+' is a duplicite.');
		exit()
	items[name]=newItem
	#print(newItem)

# Get markets setting
with open('m_markets_in.txt') as f:
	lines = f.readlines()
f.closed

markets = []
for line in lines:
	if line=='NEW\n':
		newMarket = {}
		shopList=[]
		newMarket["Buy"]=[]
		newMarket["Sell"]=[]
		target='Setup'
		setupPhase=0;
		continue
	elif line=='\n':
		if target=='Buy' or target=='Sell':
			newMarket[target]=shopList
		if target=='Buy':
			#print(newMarket)
			markets.append(newMarket)
		continue
	elif line=='Buy\n':
		target='Buy'
		shopList=[]
		continue
	elif line=='Sell\n':
		target='Sell'
		shopList=[]
		continue
	elif target=='Setup':
		m = line[0:-1].split('\t')
		if setupPhase==0:			
			newMarket["npc"]=m[0]
			newMarket["coefSell"]=int(m[1])
			newMarket["coefBuy"]=int(m[2])
		elif setupPhase==1:			
			newMarket["place"]=m[0]
		elif setupPhase==2:			
			newMarket["marketId"]=m[0]
		elif setupPhase==3:			
			newMarket["role"]=m[0]
		setupPhase += 1
	else:
		shopList.append(line[0:-1].lower())

# Get exchange setting
with open('m_exchange.txt') as f:
	lines = f.readlines()
f.closed

exchange = {}
exchange['values'] = []
exchange['coins'] = {}
exchange['courses'] = {}

swValues = True
for line in lines:
	if line=='\n':
		swValues = False
		continue
	if swValues:
		m = line[0:-1].split('\t')
		if m[3]=='False': continue
		newVal = {}
		newVal['value']=int(m[2])
		newVal['itemId']=m[1]
		exchange['coins'][m[0].lower()]=newVal
		exchange['coins'][int(m[2])]=newVal
		exchange['values'].append(int(m[2]));
		#print(newVal)
	else:
		m = line[0:-1].split('\t')
		m1 = re.match('\AEXCH\s(\w+)\sto\s(\w+)\s(\d+)\s(\d+)\n*\Z', line)
		newCourse = {}
		newCourse['from']=m1.group(1).lower()
		newCourse['to']=m1.group(2).lower()
		newCourse['fromNum']=int(m1.group(3))
		newCourse['toNum']=int(m1.group(4))
		exchange['courses'][m[0].lower()] = newCourse
		#print(newCourse)

########
# Support functions

# Get nearest value from a list of values, higher or lower
def getNearest(values, higher, val):
	i = 0
	for v in values:
		if v>val:
			if((not higher) and i>0):
				return i-1;
			return i
		i=i+1
	return len(values)-1

# simpleParser creating new output item
def newItem(itemId, count):
	out = {}
	if count<0:
		out['id']=''
		out['count']=-1
		return out
	if count>0:
		out['id']=itemId
		out['count']=count
		return out
	m = re.match('\A(\S+)\s*\*\s*(\d+)\Z', itemId)
	if type(m).__name__ != 'NoneType':
		out['id']=m.group(1)
		out['count']=int(m.group(2))		
		return out
	m = re.match('\A(.+)\Z', itemId)
	if type(m).__name__ != 'NoneType':
		out['id']=m.group(1)
		out['count']=1		
		return out
	printError('Cannot parse: '+itemId)

# Base on unit price, get required coins and amount
def calcPriceInCoins(doubleOutput, roundUp, price):
	idx = getNearest(exchange['values'], True, price/64)
	coinVal = exchange['values'][idx]
	cnt = int(price/coinVal)
	rest = price - (cnt*coinVal)
	if(cnt>60):
		printWarning('coin1:'+str(coinVal)+'*'+str(cnt)+' + '+str(rest))
	coin1 = newItem(exchange['coins'][coinVal]['itemId'], cnt)
	out = [coin1]
	if(doubleOutput):
		idx = getNearest(exchange['values'], roundUp, rest/64)
		coinVal = exchange['values'][idx]
		cnt = int(rest/coinVal)+1
		if(cnt>60):
			printWarning('coin2:'+str(coinVal)+'*'+str(cnt))
		rest = rest - (cnt*coinVal)
		coin2 = newItem(exchange['coins'][coinVal]['itemId'], cnt)
		out.append(coin2)
		if rest>0: printWarning('Check Price, rest > 0')
	return out

# Get id's calc unit price and set the FROM/TO parameters of a coin exchange
def calcExchange(item, coefBuy, coefSell):
	coef = min(0.35 + (coefSell / coefBuy), 1)
	print('EXCH ('+str(coef)+'): '+item)
	out = {}
	trade = dict.copy(exchange['courses'][item.lower()])
	if trade['fromNum']==1:
		trade['toNum'] = int(trade['toNum']*coef)
	else:
		trade['fromNum'] = int(trade['fromNum']/coef)
	out['reward']=newItem(exchange['coins'][trade['to']]['itemId'],trade['toNum'])
	out['price1']=newItem(exchange['coins'][trade['from']]['itemId'],trade['fromNum'])
	out['price2']=newItem('',-1)
	return out	

# Get id's calc unit price and set the FROM/TO parameters of a trade
def calcTrade(item, dir, coef):
	print(dir+': '+item)
	if(item[0:3]=='nug'):
		repo=items[item[4:]]		
		price=repo['emc']*coef/9
		id=repo['nugId']
	else:
		repo=items[item]
		price=repo['emc']*coef
		id=repo['itemId']
	out = {}
	coins=calcPriceInCoins(dir=='Sell', dir=='Sell', price)
	if(dir=='Sell'):
		out['reward']=newItem(id,0)
		out['price1']=coins[0]
		out['price2']=coins[1]
	else:
		out['reward']=coins[0]
		out['price1']=newItem(id,0)
		out['price2']=newItem('',-1)
	return out

# Formating mtweak item into customnpc format
def parseTags(tags):
	out=[]
	text=tags
	while len(text)>0:
		idx=text.find(':')
		if idx<0: break
		id=text[0:idx]
		text=text[idx+1:]
		if(text[0]=='"'):
			idx=text[1:].find('"')
			val=text[0:idx+2]
			text=text[idx+3:]
		else:
			idx=text.find(' ')
			if idx<0:
				val=text
				text=''
			else:
				val=text[0:idx-1]
				text=text[idx+1:]
		out.append(id+': '+val)
	return out

def getItemDescription(item, slot, count):
	m = re.match('\A<(\S+):(\S+):(\d+)>.*\Z', item)
	if type(m).__name__ != 'NoneType':
		damage=m.group(3)
	else:
		m = re.match('\A<(\S+):(\S+)>.*\Z', item)
		damage=0
	name=m.group(1)+':'+m.group(2)
	m = re.match('\A<.*>.withTag\({(.*)}\)\Z', item)
	if type(m).__name__ != 'NoneType':
		tag=parseTags(m.group(1))
	else:
		tag=[]
	out=[]
	out.append('{')
	out.append('\t"Slot": '+str(slot)+'b,')
	out.append('\t"id": "'+name+'",')
	out.append('\t"Count": '+str(count)+'b,')
	if tag==[]:
		out.append('\t"Damage": '+str(damage)+'s')
	else:
		out.append('\t"Damage": '+str(damage)+'s,')
		out.append('\t"tag": {')
		i=len(tag)
		for ln in tag:
			i=i-1;
			if(i!=0):
				out.append('\t\t'+ln+',')				
			else:
				out.append('\t\t'+ln+'')				
		
		out.append('\t}')
	out.append('}')
	return out

# Writing into file one itemlist
def printItemsToFile(firstSlot, theList, theFile, watchForLast):
	slotId=firstSlot
	lastId=len(theList)-1
	
	while theList[lastId]['count']<0:
		lastId=lastId-1
	lastId=slotId+lastId
	for p in theList:
		if p['count']<0:continue
		desc=getItemDescription(p['id'], slotId, p['count']);
		if(slotId!=lastId or not(watchForLast)):
			desc[-1]=desc[-1]+','
		for ln in desc:
			theFile.write('\t\t\t'+ln+'\n')
		slotId=slotId+1

########
# Main Process
for m in markets:
	print('\nMarket: '+m['marketId']+', '+m['npc']+'('+m['place']+', '+m['role']+')');
	print('\tBuy/Sell: '+str(m['coefBuy'])+'/'+str(m['coefSell'])+', items: '+str(len(m['Buy']))+'/'+str(len(m['Sell']))+'\n')
	price1 = []
	price2 = []
	reward = []
	for i in m['Sell']:
		if i[0:4]=='exch':
			out = calcExchange(i.lower(), m['coefSell'], m['coefBuy'])			
		else:
			out = calcTrade(i.lower(), 'Sell', m['coefSell'])
		reward.append(out['reward'])
		price1.append(out['price1'])
		price2.append(out['price2'])
	for i in m['Buy']:
		if i[0:4]=='exch':
			out = calcExchange(i.lower(), m['coefSell'], m['coefBuy'])			
		else:
			out = calcTrade(i.lower(), 'Buy', m['coefBuy'])
		reward.append(out['reward'])
		price1.append(out['price1'])
		price2.append(out['price2'])
	m['rewards']=reward
	m['price1']=price1
	m['price2']=price2
	
if canPrint==False: exit()

for m in markets:
	f=open('markets_out/'+m['marketId']+'_'+m['npc']+'.json','w')
	f.write('{\n');
	f.write('\t"TraderCurrency": {\n')
	f.write('\t\t"NpcMiscInv": [\n')
	printItemsToFile(0, m['price1'], f, False)
	printItemsToFile(18, m['price2'], f, True)
	f.write('\t\t]\n')
	f.write('\t},\n')
	f.write('\t"TraderIgnoreDamage": 0b,\n')
	f.write('\t"TraderIgnoreNBT": 0b,\n')
	f.write('\t"TraderSold": {\n')
	f.write('\t\t"NpcMiscInv": [\n')
	printItemsToFile(0, m['rewards'], f, True)
	f.write('\t\t]\n')
	f.write('\t}\n')
	f.write('}\n')	
	f.close()