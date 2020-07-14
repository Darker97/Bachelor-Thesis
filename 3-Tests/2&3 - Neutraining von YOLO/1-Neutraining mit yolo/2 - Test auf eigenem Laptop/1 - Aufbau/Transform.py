import sys
import requests
import tarfile
import json
import numpy as np
from os import path
from PIL import Image
from PIL import ImageFont, ImageDraw
from glob import glob
from matplotlib import pyplot as plt
import cv2

import random
from tqdm import tqdm

import re


"""# def"""

# text ("1"), title ("2"), list ("3"), table ("4"), figure ("5")

Kat = {
    "1": "text",
    "2": "title",
    "3": "list",
    "4": "table",
    "5": "figure"
}


def WriteToFile(Name, InhaltInArrayForm):
  file = open(Name, 'w')
  for i in InhaltInArrayForm:
    file.write(i)
    file.write("\n")
  file.close()

def openTar(Name):
  tar = tarfile.open(Name)
  tar.extractall()
  tar.close()
  print(Name + " entpacked")

StringToJson = 'publaynet/val.json'
StringToFolder = 'publaynet/val/'

Labels = []

with open(StringToJson, 'r') as fp:
    samples = json.load(fp)
# Index images
images = {}
for image in tqdm(samples['images']):
    images[image['id']] = {'file_name': image['file_name'], 'annotations': []}
for ann in tqdm(samples['annotations']):
    images[ann['image_id']]['annotations'].append(ann)

InhaltFürTrain = []
PathToTrain = 'data/train.txt'

XGröße = 600
YGröße = 792

for i, (_, image) in tqdm(enumerate(images.items())):
  FileName = image['file_name']
  

  SpeicherUnter = 'data/train/'
  # ES FEHLT NOCH:
  # BILDFILE LADEN UND NEU ABSPEICHERN
  # StringToFolder + FileName

  file = Image.open(StringToFolder + FileName)
  file.save(SpeicherUnter + FileName)

  DataFileName = SpeicherUnter + FileName.split('.')[0] + '.txt'

  Inhalt = []
  
  annotations = image['annotations']
  for pictures in annotations:
    Box = pictures['bbox']
    Category = int(pictures['category_id']) - 1
    #x
    TempString = str(Category)
    TempString += " " + str(Box[0] / XGröße)
    TempString += " " + str(Box[1] / YGröße)
    TempString += " " + str(Box[2] / XGröße)
    TempString += " " + str(Box[3] / XGröße)

    Inhalt.append(TempString)
    # print(FileName + "     " + TempString)
    
  InhaltFürTrain.append('data/train/' + FileName)
  WriteToFile(DataFileName, Inhalt)

WriteToFile(PathToTrain, InhaltFürTrain)

Name = 'obj.names'
Zusatz = 'data/'
FileName = Zusatz + Name
Inhalt = []

for i in range(1,6):
  Inhalt.append(Kat[str(i)])

WriteToFile(FileName, Inhalt)


Inhalt = [
          'classes = 5',
          'train = data/train.txt',
          'names = data/obj.names',
          'backup = ../backup/'
]
PathToObjData = 'data/obj.data'

WriteToFile(PathToObjData, Inhalt)
