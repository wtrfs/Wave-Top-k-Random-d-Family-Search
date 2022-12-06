for DIR in ../**/
do
  if [ "$DIR" != "../scripts/" ]; then
    cd $DIR
    BASE=$(basename ${DIR})
    ABS=$(realpath ${BASE})
    #~ echo $ABS
    OUTPUT=$ABS"_trace_comparaison"
    #~ echo $OUTPUT
    echo Rscript ../scripts/compute_comparaison_visualisation.R $ABS*trace*.csv $OUTPUT
    Rscript ../scripts/compute_comparaison_visualisation.R $ABS*trace*.csv $OUTPUT

  fi
done
