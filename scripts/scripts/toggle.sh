
operation=$1
max_value=$2
max_value=$((max_value - 1))
echo $max_value

k=$(get.sh $operation)
k=$((k+1))
if [[ k -gt $max_value ]]; then
  k=0;
fi

set.sh $operation $k

