for DIR in ../**/
do
  if [ $DIR != ../scripts/ ]; then
    TMP=${DIR%/*}
    for I1 in {1..25}
    do
      I2=$(($I1 + 25))
      I3=$(($I1 + 50))
      I4=$(($I1 + 75))
      
      echo -e SGPEx_WTRFS -a $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_absolute-$I1.csv 3 7 2 1 100;
      SGPEx_WTRFS -a $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_absolute-$I1.csv 3 7 2 1 100&
      PIDS=($!)
      sleep 0.5
      
      
      echo -e SGPEx_WTRFS -a $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_absolute-$I2.csv 3 7 2 1 100;
      SGPEx_WTRFS -a $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_absolute-$I2.csv 3 7 2 1 100&
      PIDS+=($!)
      sleep 0.5
      
      
      echo -e SGPEx_WTRFS -a $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_absolute-$I3.csv 3 7 2 1 100;
      SGPEx_WTRFS -a $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_absolute-$I3.csv 3 7 2 1 100&
      PIDS+=($!)
      sleep 0.5
      
      
      echo -e SGPEx_WTRFS -a $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_absolute-$I4.csv 3 7 2 1 100;
      SGPEx_WTRFS -a $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_absolute-$I4.csv 3 7 2 1 100&
      PIDS+=($!)
      
      for PID in ${PIDS[@]}
      do
        echo -e waiting for $PID
        wait $PID
      done
    done
    python3 compute-mean-csv.py $DIR${TMP##*/}_trace_absolute.csv $DIR${TMP##*/}_trace_absolute-*.csv
    rm $DIR${TMP##*/}_trace_absolute-*.csv









    for I1 in {1..25}
    do
      I2=$(($I1 + 25))
      I3=$(($I1 + 50))
      I4=$(($I1 + 75))
      
      echo -e SGPEx_WTRFS -p $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_probabilistic-$I1.csv 3 7 2 1 100;
      SGPEx_WTRFS -p $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_probabilistic-$I1.csv 3 7 2 1 100 &
      PIDS=($!)
      sleep 0.5
      
      echo -e SGPEx_WTRFS -p $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_probabilistic-$I2.csv 3 7 2 1 100;
      SGPEx_WTRFS -p $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_probabilistic-$I2.csv 3 7 2 1 100 &
      PIDS+=($!)
      sleep 0.5
      
      echo -e SGPEx_WTRFS -p $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_probabilistic-$I3.csv 3 7 2 1 100;
      SGPEx_WTRFS -p $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_probabilistic-$I3.csv 3 7 2 1 100 &
      PIDS+=($!)
      sleep 0.5
      
      echo -e SGPEx_WTRFS -p $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_probabilistic-$I4.csv 3 7 2 1 100;
      SGPEx_WTRFS -p $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_probabilistic-$I4.csv 3 7 2 1 100 &
      PIDS+=($!)
      
      for PID in ${PIDS[@]}
      do
        echo -e waiting for $PID
        wait $PID
      done
    done
    python3 compute-mean-csv.py $DIR${TMP##*/}_trace_probabilistic.csv $DIR${TMP##*/}_trace_probabilistic-*.csv
    rm $DIR${TMP##*/}_trace_probabilistic-*.csv









    for I1 in {1..25}
    do
      I2=$(($I1 + 25))
      I3=$(($I1 + 50))
      I4=$(($I1 + 75))
      
      echo -e SGPEx_WTRFS -b $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_biased-$I1.csv 3 7 2 1 100 $DIR${TMP##*/}_graph_labels.txt;
      SGPEx_WTRFS -b $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_biased-$I1.csv 3 7 2 1 100 $DIR${TMP##*/}_graph_labels.txt &
      PIDS=($!)
      sleep 0.5
      
      
      echo -e SGPEx_WTRFS -b $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_biased-$I2.csv 3 7 2 1 100 $DIR${TMP##*/}_graph_labels.txt;
      SGPEx_WTRFS -b $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_biased-$I2.csv 3 7 2 1 100 $DIR${TMP##*/}_graph_labels.txt &
      PIDS+=($!)
      sleep 0.5
      
      
      echo -e SGPEx_WTRFS -b $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_biased-$I3.csv 3 7 2 1 100 $DIR${TMP##*/}_graph_labels.txt;
      SGPEx_WTRFS -b $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_biased-$I3.csv 3 7 2 1 100 $DIR${TMP##*/}_graph_labels.txt &
      PIDS+=($!)
      sleep 0.5
      
      
      echo -e SGPEx_WTRFS -b $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_biased-$I4.csv 3 7 2 1 100 $DIR${TMP##*/}_graph_labels.txt;
      SGPEx_WTRFS -b $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_biased-$I4.csv 3 7 2 1 100 $DIR${TMP##*/}_graph_labels.txt &
      PIDS+=($!)
      
      for PID in ${PIDS[@]}
      do
        echo -e waiting for $PID
        wait $PID
      done
    done
    python3 compute-mean-csv.py $DIR${TMP##*/}_trace_biased.csv $DIR${TMP##*/}_trace_biased-*.csv
    rm $DIR${TMP##*/}_trace_biased-*.csv








    for I1 in {1..25}
    do
      I2=$(($I1 + 25))
      I3=$(($I1 + 50))
      I4=$(($I1 + 75))
      
      echo -e SGPEx_WTRFS -l $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_local-$I1.csv 3 7 2 1 100;
      SGPEx_WTRFS -l $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_local-$I1.csv 3 7 2 1 100 &
      PIDS=($!)
      sleep 0.5
      
      
      echo -e SGPEx_WTRFS -l $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_local-$I2.csv 3 7 2 1 100;
      SGPEx_WTRFS -l $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_local-$I2.csv 3 7 2 1 100 &
      PIDS+=($!)
      sleep 0.5
      
      
      echo -e SGPEx_WTRFS -l $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_local-$I3.csv 3 7 2 1 100;
      SGPEx_WTRFS -l $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_local-$I3.csv 3 7 2 1 100 &
      PIDS+=($!)
      sleep 0.5
      
      
      echo -e SGPEx_WTRFS -l $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_local-$I4.csv 3 7 2 1 100;
      SGPEx_WTRFS -l $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_local-$I4.csv 3 7 2 1 100 &
      PIDS+=($!)
      
      for PID in ${PIDS[@]}
      do
        echo -e waiting for $PID
        wait $PID
      done
    done
    python3 compute-mean-csv.py $DIR${TMP##*/}_trace_local.csv $DIR${TMP##*/}_trace_local-*.csv
    rm $DIR${TMP##*/}_trace_local-*.csv


    for I1 in {1..25}
    do
      I2=$(($I1 + 25))
      I3=$(($I1 + 50))
      I4=$(($I1 + 75))
      
      echo -e SGPEx_WTRFS -s $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_surprised-$I1.csv 3 7 2 1 100;
      SGPEx_WTRFS -s $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_surprised-$I1.csv 3 7 2 1 100 &
      PIDS=($!)
      sleep 0.5
      
      
      echo -e SGPEx_WTRFS -s $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_surprised-$I2.csv 3 7 2 1 100;
      SGPEx_WTRFS -s $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_surprised-$I2.csv 3 7 2 1 100 &
      PIDS+=($!)
      sleep 0.5
      
      
      echo -e SGPEx_WTRFS -s $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_surprised-$I3.csv 3 7 2 1 100;
      SGPEx_WTRFS -s $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_surprised-$I3.csv 3 7 2 1 100 &
      PIDS+=($!)
      sleep 0.5
      
      
      echo -e SGPEx_WTRFS -s $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_surprised-$I4.csv 3 7 2 1 100;
      SGPEx_WTRFS -s $DIR${TMP##*/}_SEC_WRAcc_PAD.lat $DIR${TMP##*/}_trace_surprised-$I4.csv 3 7 2 1 100 &
      PIDS+=($!)
      
      for PID in ${PIDS[@]}
      do
        echo -e waiting for $PID
        wait $PID
      done
    done
    python3 compute-mean-csv.py $DIR${TMP##*/}_trace_surprised.csv $DIR${TMP##*/}_trace_surprised-*.csv
    rm $DIR${TMP##*/}_trace_surprised-*.csv
    echo -e \n;
  fi
done
