import urllib.request
import requests
from os.path import exists

r = requests.get("https://ddragon.leagueoflegends.com/api/versions.json")
patch = r.json()[0]

baseUrl = "https://ddragon.leagueoflegends.com/cdn/{}/img/spell/".format(patch)



r = requests.get("https://ddragon.leagueoflegends.com/cdn/{}/data/en_US/summoner.json".format(patch))
sumRaw = r.json()

sumDict = {"S12_SummonerTeleportUpgrade": "SummonerTeleport", "S5_SummonerSmiteDuel":"SummonerSmite", "S5_SummonerSmitePlayerGanker":"SummonerSmite"}
sumDictIcon = {}

for i in sumRaw["data"].keys():
    sumDict[i] = sumRaw["data"][i]["id"]
    sumDictIcon[i] = sumRaw["data"][i]["image"]["full"]

for i in sumDict.keys():
    print(baseUrl + sumDictIcon[sumDict[i]])
    full_path = i + ".png"
    if exists(full_path) == False:
        urllib.request.urlretrieve(baseUrl + sumDictIcon[sumDict[i]], full_path)
