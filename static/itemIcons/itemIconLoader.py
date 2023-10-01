import urllib.request
import requests
from os.path import exists
from pathlib import Path
from PIL import Image
import os

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
    if exists(itemDict[i][:-3] + "webp") == False:
        urllib.request.urlretrieve(baseUrl + itemDict[i], full_path)

def convert_to_webp(source):
    """Convert image to WebP.

    Args:
        source (pathlib.Path): Path to source image

    Returns:
        pathlib.Path: path to new image
    """
    destination = source.with_suffix(".webp")

    image = Image.open(source)  # Open image
    image.save(destination, format="webp")  # Convert image to webp
    os.remove(source)



for i in os.listdir():
    if i[-4:] == ".png":
        convert_to_webp(Path(i))
