# Convert TUData in order to be compatible with quick_gspan.

for DIR in ../**/
do
  if [ "$DIR" != "../scripts/" ]; then
    python3 TUData_to_gaston_format.py $DIR*graph_indicator.txt $DIR*node_labels.txt $DIR*A.txt $DIR*edge_labels.txt
  fi
done
