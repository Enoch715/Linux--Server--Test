ifconfig |grep 'flags=4163' |cut -d ' ' -f1 > Ethernetcard
num=`ifconfig |grep 'flags=4163' -c`
for ((i=1; i<=${num} ;i++))
do
	card=`cat Ethernetcard | sed 's/://g' | sed -n ''$i'p'`
	ifconfig $card 192.168.$i.1 up
done
for ((i=1; i<=${num} ;i++))
do
	ping 192.168.$i.1 &
done
