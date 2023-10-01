import urllib.request
import requests
from os.path import exists
from pathlib import Path
from PIL import Image
import os

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
    if exists(i + '.png') == False or exists(i + '.webp'):
        urllib.request.urlretrieve(baseUrl + champDict[i], full_path)



for i in os.listdir():
    if i[-4:] == ".png":
        convert_to_webp(Path(i))
