#!/bin/bash
#Eddie/S10/cfc2407/James
#This script is to run different scans and attacks in a given network or host.

#	1. "inst" function is to install the relevant tool/ applications such as:
#		nmap, masscan, hydra and responder

#	2. "exe" functions is to allow the use to choose different scans and attacks save results in to a log file



function inst()
{
## To install nmap
	sudo apt-get install nmap
## To install masscan
	sudo apt-get install masscan
## To install hydra
	sudo apt-get install hydra

}

function exe()
{
## To prompt the output on to the terminal and save the input as variable.
read -p "Would you like to a) Execute a scan or b) Execute an attack ?: " choices

case $choices in 

	a)
			read -p " a) Nmap  or b) Masscan: " scans
			
			case $scans in
				
				a) 
					## To save Nmap IP address as a variable "nmapip"
					echo " Target's IP Address: "
					read nmapipS
					## To execute 'Nmap' and save the results file
					sudo nmap "$nmapip" -F >> nmap_results.txt
					## To append scans in to the log file
					echo "$(date): $(whoami): Nmap: $nmapip" >> log_file.log
				;;
				
				b)	
					## To save Masscan IP address as a variable "masscanip"
					echo " Target's IP address: "
					read masscanip
					## To save port number as a variable "portn"
					echo " Input port number or a range of ports numbers: "
					read portn
					## To execute 'Masscan' and save the results file
					sudo masscan "$masscanip" -p "$portn" >> masscan_results.txt
					## To append scans in to the log file
					echo "$(date): $(whoami): Masscan: $masscanip" >> log_file.log
					
				;;
				esac
	;;
					
	b)
	## To prompt the output on to the terminal and save the input as variable.
			read -p " a) Hydra or b) Exit " attacks
			
			case $attacks in
				
				a)
					## To save Hydra IP address as a variable "hydranip"
					echo " Target's IP address: "
					read hydraip
					## To save port name as a variable "servicename"
					echo " Input service portocal name "
					read servicename
					## To execute 'Hydra' and save the results file
					sudo hydra -L user.lst -P pass.lst "$hydraip" "$servicename" -vV >> hydra_results.txt
					## To append hydra atacks in to the log file
					echo "$(date): $(whoami): Hydra: $hydraip" >> log_file.log
					
				;;
					
				b)
					# Option to exit 
					exit

					
				;;
				esac
			
	;;
	esac		

}


inst
exe


}


inst
exe
