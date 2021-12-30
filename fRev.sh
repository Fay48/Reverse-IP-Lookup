#!/bin/bash

#Don't change anything or the script maybe not working
#VIP API Endpoint? contact => https://fb.me/fayyy.id or https://t.me/sosialismageran

list=$1
haaa(){
	RD="\e[91m"
	GR="\e[92m"
	CY="\e[96m"
	YL="\e[93m"
	BL="\e[94m"
	NC="\e[0m"
	target="$1"
	rev=$(curl -s -m 30 -H "Connection: close" -H "User-Agent: FayReverse" "http://reverse.fay.gg:18/?ip=$target" | jq -r '.data')
	if [[ $(echo $rev | jq -r '.total') -gt 0 ]]; then
		echo $rev | jq -r '.domain[]' >> reverse.txt
		echo -e "[${YL}`date +"%H:%M:%S"`${NC}] ${CY}$target ${NC}=>\t${GR}$(echo $rev | jq -r '.total') ${NC}result"
	else
		echo -e "[${YL}`date +"%H:%M:%S"`${NC}] ${CY}$target ${NC}=>\t${RD}0 ${NC}result"
	fi
}
export -f haaa
clear
echo -e "Target load : $(cat $list | wc -l)"
sort -u $list | xargs -P 10 -n1 bash -c 'haaa "$@"' _ 2>/dev/null
