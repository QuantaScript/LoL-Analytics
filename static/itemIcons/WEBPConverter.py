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



for i in os.listdir():
    if i[-4:] == ".png":
        convert_to_webp(Path(i))
