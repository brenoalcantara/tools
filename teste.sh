data="`date +%y%m%d`"
let i=0
for value in $(mysql -P 3306 -D lasa -A -h 52.31.153.157 -u carga_flash -pc4r6a84s3 -s -N -e \
    "SELECT centro FROM stock_order.deposito")
do
    arr[$i]="/nfs/ibmsap04_statx_bi/psoa_outbound_${value}_$data*.csv"
    let "i+=1"
 done

# echo "${#arr[@]}"
# echo "${arr[1]}"

for i in "${arr[@]}"
do
    echo "$(ls -1t $i  | head -n 1 >> /home/brealcantara/scripts/teste.txt 2> /dev/null)"
done