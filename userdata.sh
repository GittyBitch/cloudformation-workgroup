#!/bin/bash
#python3 zu installieren (yum)
#StarChaser Projekt runter zu laden (github)
#s3 bucket connecten
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

#bucket connecten
wget $bucket

#starchaser runterladen
wget $url

#datei entpacken
pip install -r requirements.txt

#script mit python ausführen
python3 $startdatei