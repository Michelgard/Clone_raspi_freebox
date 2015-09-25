#!/bin/bash

DATE=$(date +"%Y-%m-%d")

BoxToClone=Jasper

SdImgSize=16021192704

FileName=SD-Backup_$BoxToClone\_$DATE.img

File=/mnt/freebox/Backup_Pi/SD_Backup/$FileName

/bin/mount -t cifs //mafreebox.freebox.fr/disque\ dur/ /mnt/freebox/ -o guest,iocharset=utf8,file_mode=0777,dir_mode=0777

sudo dd if=/dev/mmcblk0 bs=4M of=$File && sync

FileStat=$(wc -c "$File" | cut -f 1 -d ' ')

if [ $? -eq 0 ]; then
        if [ $FileStat -ge $SdImgSize ]; then
                Objet="($DATE) SD-Backup $BoxToClone : ERREUR"
                Message="Taille du fichier $FileName incorrecte"
        else
                #taille OK
                Objet="($DATE) SD-Backup $BoxToClone : OK"
                Message="Clonage OK"
                find /mnt/freebox/Backup_Pi/SD_backup/ -type f -mtime +10 -exec rm -f {} \;
        fi
else
        if [ -e $File ]; then
                sudo rm $File
        fi
        Objet="($DATE) SD-Backup $BoxToClone : ECHEC"
        Message="Echec du Clonage : fichier inexistant."
        fi

/bin/umount /mnt/freebox

echo "$Message" | mail -s "$Objet"  mon_mail@gmail.com
