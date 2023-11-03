#!/bin/bash
#python3 zu installieren (yum)
#StarChaser Projekt runter zu laden (github)
#s3 bucket connecten
#installieren der Pakete aus requirements.txt
#python3 Script ausführen

#url zum download 
URL="https://testzh11.s3.eu-central-1.amazonaws.com/LPI-Learning-Material.pdf"
ARCHIV=starchaser.zip

# haupt datei
startdatei=main.py

# alle updates instalieren
#yum update -y

#python3 installieren 
#yum install -y python3

#bucket connecten
#wget $bucket

#starchaser runterladen
wget $URL 
exit 
#datei entpacken
unzip $archiv
pip install -r requirements.txt

#script mit python ausführen
python3 $startdatei