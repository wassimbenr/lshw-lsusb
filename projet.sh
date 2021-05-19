#!/bin/bash

function menu(){
	while true
	do
	echo "+++++++++++++++ Bienvenue ($USER) +++++++++++++++++++"
	echo "1)  : Lancer la commande lshw"
	echo "2)  : Lancer la commande lsusb"
	echo "3)  : HELP"
	echo "4)  : Afficher menu graphique"
	echo "5)  : Afficher menu textuel"
	echo "6)  : Sauvgarder les informations pertinentes"
	echo "7)  : Version et auteurs"
	echo "8)  : Afficher les informations pertinentes"
	echo "9)  : Afficher les lignes contenant le MOT CLE"
	echo "0)  : Quitter"
	echo "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
	echo "Votre choix : "
	read INPUT_STRING
	case $INPUT_STRING in
	1) sudo lshw;;
	2) lsusb;;
	3) help;;
	4) ./menu_graphique.sh;;
	5) menu;;
	6) save_info;;
	7) auteur_version;;
	8) file="${OPTARG}" ;Affichage_InfoPertinantes;;
	9) Affichage_MotClexd;;
	0) exit;;
	*) echo "Choix incorrecte";;
		esac
	done
}



function save_info(){
	echo `sudo lshw > save.txt`
	echo `lsusb >> save.txt`
	sudo cp save.txt /usr/bin/projet/$s
}

function Affichage_InfoPertinantes
{
if [ -e /usr/bin/projet/"${file}" ]
 then {
	if [ -f /usr/bin/projet/"${file}" ]
	 then
	    cat /usr/bin/projet/"${file}"
	 else 
	   echo "L'argument passé en parametre n'est pas un fichier"
	fi
}
fi
fichierMot_Cle=${file}
}

function auteur_version(){
	echo "Version 1.0.0 - Authors: Wassim ben romdhane & Bacim oueslati"
}

function Affichage_MotClexd
{
	cat  | grep -i $Mot_Cle /usr/bin/projet/"$fichierMot_Cle"
}

function help(){
	cat /etc/help.txt
}

if [ "$1" == "" ]
	then
	echo "no argument"
	exit
fi

if [ "$1" == "-help" ]
	then
	help
	exit
fi

while getopts ":hxls:vm:f:go:" option
  do
          case $option in
                h)
			 		help
                    ;;
                x)
                    sudo lshw
					;;
				l)
					lsusb 
					;;
                s)
                    d=$(date +%Y-%m-%d)
                    s="$OPTARG"_$d
                    save_info $s_$d
                    echo "Les informations sont enregistrées dans le fichier /usr/bin/projet/$s"
                    ;;
                g)
                    ./menu_graphique.sh
                    ;;
  	  			v)
					auteur_version 
					;;
				m)	
					menu 	
					;;
                o)
                    file="${OPTARG}" ;Affichage_InfoPertinantes
					;;
	       		f) 
					Mot_Cle="${OPTARG}"; Affichage_MotClexd
					;;
                ?)
					echo "L'option $OPTARG est invalide"
          esac
done
