#!/bin/bash
#python3 zu installieren (yum)
#StarChaser Projekt runter zu laden (github)
#installieren der Pakete aus requirements.txt
#python3 Script ausführen

#url zum download 
url = http

# haupt datei
startdatei = main.py

# alle updates instalieren
yum update -y

#python3 installieren 
yum install -y python3

#starchaser runterladen
wget $url

#datei entpacken
pip install -r requirements.txt

#script mit python ausführen
python3 $startdatei