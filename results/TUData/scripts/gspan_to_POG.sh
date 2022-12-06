for DIR in ../**/
do
  if [ "$DIR" != "../scripts/" ]; then
    TMP=${DIR%/*}
    echo SGPEx_Converter -tu $DIR${TMP##*/}_graph_labels.txt $DIR${TMP##*/}.fp $DIR${TMP##*/}.lat;
    SGPEx_Converter -tu $DIR${TMP##*/}_graph_labels.txt $DIR${TMP##*/}.fp $DIR${TMP##*/}.lat
  fi
done
