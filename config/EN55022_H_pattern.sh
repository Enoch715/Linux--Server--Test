for ((i=1;i<=20000;i=i+1))
do
 echo -n H
done

# if sleep=0.5s, 100,000*0.5=50,000s =13 hours ..

for ((i=1;i<=100000;i=i+1))
do
 echo -n H
 sleep 1s
done

