export OMP_SCHEDULE=dynamic,1
export OMP_NUM_THREADS=4

for DIR in ../**/
do
  if [ "$DIR" != "../scripts/" ]; then
    TMP=${DIR%/*}
    echo SGPEx_Clusterize -s $DIR${TMP##*/}.lat;
    SGPEx_Clusterize -s $DIR${TMP##*/}.lat
  fi
done
