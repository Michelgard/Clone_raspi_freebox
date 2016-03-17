# Clone_raspi_freebox
Clone image Raspberry à la volé sur une Freebox

Installation de la fonction mail
sudo apt-get install mailutils mpack ssmtp

Editer la configuration de ssmtp pour paramétrer la passerelle smtp
sudo nano /etc/ssmtp/ssmtp.conf

Tester l’envoi d'un mail :
echo "Contenu du mail" | mail -s "Titre du mail" AdresseDestinataire@gmail.com

Autoriser l’exécution de ce script CloneSD.sh :
sudo chmod u+x /home/user/CloneSD.sh

Planifier l’exécution du script (chaque Mercredi à 9h dans l’exemple)
sudo crontab -e

Ajouter la ligne suivante puis enregistrer :
00 9 * * 3 sh /home/user/CloneSD.sh

Retrouver le bolg ici http://rasp-pi.fr.nf

