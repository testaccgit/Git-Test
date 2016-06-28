		  ####################################################################################################
                  #                                        System Status Info                                        #
                  # 					        !B.B!						     #
                  # 					                                                             #
                  # 					  -------------------                                        #
                  # 					|*	F  &&  L     *|                                      #
                  #                                                                                                  #
                  ####################################################################################################



echo -e "\e[90m --------------------------------------------------\e[0m"
echo -e "\e[90m  Firs System Status \e[0m"
echo -e "\e[90m --------------------------------------------------\e[0m"
#show hostname
echo -e "\e[31m Hostname :\e[0m" `hostname`

#show Kernel version
echo -e "\e[94m Kernel Version :\e[0m" `uname -r`

#show only uptime
echo -e "\e[91m Uptime :\e[0m" `uptime | sed 's/.*up \([^,]*\), .*/\1/'`

#show last system reboot time
echo -e "\e[31m Last Reboot Time :\e[0m" `who -b | awk '{print $3,$4}'` 

echo -e "\e[90m --------------------------------------------------\e[0m"
echo -e "\e[90m  Interenet connection and IP status \e[0m"
echo -e "\e[90m --------------------------------------------------\e[0m"

#start internet status script

wget -q --tries=10 --timeout=20 --spider http://google.com
if [[ $? -eq 0 ]]; then
        echo -e "\e[96m Connection status :\e[0m"  "\e[92m Online \e[0m"
else
        echo -e "\e[96m Connection status :\e[0m"  "\e[91m Offline \e[0m"
fi

#end of status script

echo -e "\e[96m External IP :\e[0m" `curl -s ipecho.net/plain;echo`

echo -e "\e[96m Internl IP :\e[0m" `hostname -I`

echo -e "\e[96m DNS IP :\e[0m" `cat /etc/resolv.conf | awk '{print $2}' | head -2 | tail -1`
				#cat /etc/resolv.conf | awk '{print $2}' | sed -n 2p




echo -e "\e[90m --------------------------------------------------\e[0m"
echo -e "\e[90m  Logged Users \e[0m"
echo -e "\e[90m --------------------------------------------------\e[0m"



echo -e '\E[91m' `who -q | tail -1 | awk '{print $2}' && who >/tmp/logged`
echo -e '\E[93m'" Logged In users :\e[0m" && cat /tmp/logged


echo -e "\e[90m --------------------------------------------------\e[0m"
echo -e "\e[90m  Disk Memoru CPU Check 				  \e[0m"
echo -e "\e[90m --------------------------------------------------\e[0m"
