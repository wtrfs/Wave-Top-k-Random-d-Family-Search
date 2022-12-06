for DIR in ../**/
do
  if [ "$DIR" != "../scripts/" ]; then
    TMP=${DIR%/*}
    echo SGPEx_WRAcc -c $DIR${TMP##*/}_SEC.lat;
    SGPEx_WRAcc -c $DIR${TMP##*/}_SEC.lat
    echo SGPEx_PAD -c $DIR${TMP##*/}_SEC_WRAcc.lat;
    SGPEx_PAD -c $DIR${TMP##*/}_SEC_WRAcc.lat
  fi
done
