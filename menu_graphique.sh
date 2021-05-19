#!/bin/sh

Afficher_sauvgarder()
{


yad --center --width=250 --height=100 --title="MENU1"  --text "Veuillez choisir : 
                1) lshw
                2) lsusb
                3) Enregistrer" --button="<b><span color='black'>1</span></b>":1 --button="<b><span color='black'>2</span></b>":2 --button="<b><span color='black'>3</span></b>"



case $? in
                1)
                        function1;;
                2)
                        function2;;
                3)
                        function3;;
                
            
esac
}

quit()
{
 yad --center --width=250 --height=100 --image dialog-question --text "Voulez-vous quitte?" text-align=center \
--button="<b><span color='black'>No</span></b>"!gtk-no:1 --button="<b><span color='black'>Yes</span></b>"!gtk-yes:0
if [ $? = 0 ] ; then
 exit 
fi
}


function1()
{
yad --center --width=400 --height=300 --text-info --title="1" --back=black --fore=white<funtion1
	echo `sudo lshw > funtion1`
}


function2()
{
yad --center --width=400 --height=300 --text-info --title="2" --back=black --fore=white<funtion2
	echo `lsusb > funtion2`
}


function3()
{
yad --center --width=400 --height=300 --text-info --title="4" --back=black --fore=white<save.txt
	echo `sudo lshw > save.txt | lsusb >> save.txt`
	
}



helpp()
{
yad --center --width=400 --height=300 --text-info --title="help" --back=black --fore=white<help
cat /etc/help.txt
}


Version_Auteur()
{
yad --center --width=400 --height=300 --text-info --title="Version & Auteurs" --back=black --fore=white<version_auteur
echo "Version 1.0.0 - Authors: Wassim ben romdhane & Bacim oueslati"
}


while [ "$choix" != "0" ]
do
yad --center --width=400 --height=300 --title="Aplication Shell" --image="acceuil.jpg"  \
--button="<b><span color='black'> lshw / lsusb / save</span></b>":1 \
--button="<b><span color='black'> Version et Auteurs </span></b>":2 \
--button="<b><span color='black'> Help </span></b>":3 \
--button="<b><span color='black'>Quit</span></b>"!gtk-quit:0 \
--buttons-layout=center \

case $? in
        0) quit ;;
        1) Afficher_sauvgarder ;;
	2) Version_Auteur;;
        3) helpp ;;
esac

done