import urllib.request
import requests
from os.path import exists

r = requests.get("https://ddragon.leagueoflegends.com/api/versions.json")
patch = r.json()[0]

baseUrl = "https://ddragon.leagueoflegends.com/cdn/{}/img/champion/".format(patch)

runeDict = {}

champDict = {}
r = requests.get("https://ddragon.leagueoflegends.com/cdn/{}/data/en_US/champion.json".format(patch))
champRaw = r.json()
for k in champRaw["data"]:
    row = champRaw['data'][k]
    champDict[row['key']] = row['id'] + ".png"

for i in champDict.keys():
    print(baseUrl + champDict[i])
    full_path =  i + '.png'
    if exists(i + '.png') == False:
        urllib.request.urlretrieve(baseUrl + champDict[i], full_path)
