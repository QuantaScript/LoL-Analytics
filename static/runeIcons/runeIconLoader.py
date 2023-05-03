import urllib.request
import requests
from os.path import exists


baseUrl = "https://ddragon.leagueoflegends.com/cdn/img"

shardDict = {"5001":"StatModsHealthScalingIcon.png", "5002":"StatModsArmorIcon.png", "5003":"StatModsMagicResIcon.png", "5005":"StatModsAttackSpeedIcon.png", "5007":"StatModsCDRScalingIcon.png", "5008":"StatModsAdaptiveForceIcon.png"}
shardExtension = "/perk-images/StatMods/"

for i in shardDict.keys():
    print(baseUrl + shardExtension + shardDict[i])
    full_path =  i + '.png'
    if exists(i + '.png') == False:
        urllib.request.urlretrieve(baseUrl + shardExtension + shardDict[i], full_path)


runeDict = {}
r = requests.get("https://ddragon.leagueoflegends.com/api/versions.json")
patch = r.json()[0]


r = requests.get("https://ddragon.leagueoflegends.com/cdn/{}/data/en_US/runesReforged.json".format(patch))
runeRaw = r.json()
for k in runeRaw:
    runeDict[str(k["id"])] = k["icon"]
    for l in k["slots"]:
        for m in l["runes"]:
            runeDict[str(m["id"])] = m["icon"]

for i in runeDict.keys():
    print(baseUrl + runeDict[i])
    full_path =  i + '.png'
    if exists(i + '.png') == False:
        urllib.request.urlretrieve(baseUrl + "/" + runeDict[i], full_path)
