nvm=`lsblk | grep -c 'nvme'`
cpu=`dmidecode -t processor | grep -c "Version"`
mem=`dmidecode -t memory | grep "Size" | grep -v -c "No Module Installed"`
if [ ${nvm} == 10 ] 
then
	echo "NVME PASS"
else
	echo "NVME FAIL"
	echo " "
	read -n 1 -s -p "Plese call engineer & Press any key to stop script... "
	echo " "
	exit
fi
if [ ${cpu} == 2 ]
then
	echo "CPU PASS"
else
	echo "CPU FAIL"
	echo " "
	read -n 1 -s -p "Plese call engineer & Press any key to stop script... "
	echo " "
	exit
fi
if [ ${mem} == 16 ]
then
	echo "MEMORY PASS"
	echo "wait 5s to start test"
	sleep 5s

	/root/Desktop/EMC-TEST/config/Network_setting.sh &
	/root/Desktop/EMC-TEST/config/ping.sh &
	/root/Desktop/EMC-TEST/config/CPU_MEM_Stress.sh &
	/root/Desktop/EMC-TEST/config/fio.sh
	gnome-terminal -e "/root/Desktop/EMC-TEST/config/EN55022_H_pattern.sh" --full-screen

	read -n 1 -s -p "Press any key to continue... " -t 1000000000		

	killall -e stress &
	killall -e ping &
	killall -e fio
else
	echo "MEMORY FAIL"
	echo " "
	read -n 1 -s -p "Plese call engineer & Press any key to stop script... "
	echo " "
	exit
fi

