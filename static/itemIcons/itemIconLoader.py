import urllib.request
import requests
from os.path import exists

r = requests.get("https://ddragon.leagueoflegends.com/api/versions.json")
patch = r.json()[0]

baseUrl = "https://ddragon.leagueoflegends.com/cdn/{}/img/item/".format(patch)

itemDict = {}

r = requests.get("https://ddragon.leagueoflegends.com/cdn/{}/data/en_US/item.json".format(patch))
itemRaw = r.json()

for k in itemRaw["data"].keys():
    itemDict[str(k)] = itemRaw["data"][k]["image"]["full"]


for i in itemDict.keys():
    print(baseUrl + itemDict[i])
    full_path =  itemDict[i]
    if exists(itemDict[i]) == False:
        urllib.request.urlretrieve(baseUrl + itemDict[i], full_path)
