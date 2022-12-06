FILE=../data/bcr-abl_SEC_WRAcc_PAD.lat
OUTPUT=../data/
SDF=../src/ABL1_ChEMBL_MW_800_linux.sdf

for I1 in {1..25}
do
  I2=$(($I1 + 25))
  I3=$(($I1 + 50))
  I4=$(($I1 + 75))
  
  echo -e SGPEx_WTRFS -a $FILE $OUTPUT"WRAcc_trace_absolute-"$I1.csv 3 6 2 1 100;
  SGPEx_WTRFS -a $FILE $OUTPUT"WRAcc_trace_absolute-"$I1.csv 3 6 2 1 100&
  PIDS=($!)
  sleep 0.5
  
  
  echo -e SGPEx_WTRFS -a $FILE $OUTPUT"WRAcc_trace_absolute-"$I2.csv 3 6 2 1 100;
  SGPEx_WTRFS -a $FILE $OUTPUT"WRAcc_trace_absolute-"$I2.csv 3 6 2 1 100&
  PIDS+=($!)
  sleep 0.5
  
  
  echo -e SGPEx_WTRFS -a $FILE $OUTPUT"WRAcc_trace_absolute-"$I3.csv 3 6 2 1 100;
  SGPEx_WTRFS -a $FILE $OUTPUT"WRAcc_trace_absolute-"$I3.csv 3 6 2 1 100&
  PIDS+=($!)
  sleep 0.5
  
  
  echo -e SGPEx_WTRFS -a $FILE $OUTPUT"WRAcc_trace_absolute-"$I4.csv 3 6 2 1 100;
  SGPEx_WTRFS -a $FILE $OUTPUT"WRAcc_trace_absolute-"$I4.csv 3 6 2 1 100&
  PIDS+=($!)
  
  for PID in ${PIDS[@]}
  do
    echo -e waiting for $PID
    wait $PID
  done
done
python3 compute-mean-csv.py $OUTPUT"BCR-ABL_trace_absolute.csv" $OUTPUT"WRAcc_trace_absolute-"*.csv
rm $OUTPUT"WRAcc_trace_absolute-"*.csv


for I1 in {1..25}
do
  I2=$(($I1 + 25))
  I3=$(($I1 + 50))
  I4=$(($I1 + 75))
  
  echo -e SGPEx_WTRFS -p $FILE $OUTPUT"BCR-ABL_trace_probabilistic-"$I1.csv 3 6 2 1 100;
  SGPEx_WTRFS -p $FILE $OUTPUT"BCR-ABL_trace_probabilistic-"$I1.csv 3 6 2 1 100 &
  PIDS=($!)
  sleep 0.5
  
  echo -e SGPEx_WTRFS -p $FILE $OUTPUT"BCR-ABL_trace_probabilistic-"$I2.csv 3 6 2 1 100;
  SGPEx_WTRFS -p $FILE $OUTPUT"BCR-ABL_trace_probabilistic-"$I2.csv 3 6 2 1 100 &
  PIDS+=($!)
  sleep 0.5
  
  echo -e SGPEx_WTRFS -p $FILE $OUTPUT"BCR-ABL_trace_probabilistic-"$I3.csv 3 6 2 1 100;
  SGPEx_WTRFS -p $FILE $OUTPUT"BCR-ABL_trace_probabilistic-"$I3.csv 3 6 2 1 100 &
  PIDS+=($!)
  sleep 0.5
  
  echo -e SGPEx_WTRFS -p $FILE $OUTPUT"BCR-ABL_trace_probabilistic-"$I4.csv 3 6 2 1 100;
  SGPEx_WTRFS -p $FILE $OUTPUT"BCR-ABL_trace_probabilistic-"$I4.csv 3 6 2 1 100 &
  PIDS+=($!)
  
  for PID in ${PIDS[@]}
  do
    echo -e waiting for $PID
    wait $PID
  done
done
python3 compute-mean-csv.py $OUTPUT"BCR-ABL_trace_probabilistic.csv" $OUTPUT"BCR-ABL_trace_probabilistic-"*.csv
rm $OUTPUT"BCR-ABL_trace_probabilistic-"*.csv



for I1 in {1..25}
do
    I2=$(($I1 + 25))
    I3=$(($I1 + 50))
    I4=$(($I1 + 75))
  
    echo -e SGPEx_WTRFS -b $FILE $OUTPUT"BCR-ABL_trace_biased-"$I1.csv 3 6 2 1 100 $SDF;
    SGPEx_WTRFS -b $FILE $OUTPUT"BCR-ABL_trace_biased-"$I1.csv 3 6 2 1 100 $SDF &
    PIDS=($!)
    sleep 0.5
    
    
    echo -e SGPEx_WTRFS -b $FILE $OUTPUT"BCR-ABL_trace_biased-"$I2.csv 3 6 2 1 100 $SDF;
    SGPEx_WTRFS -b $FILE $OUTPUT"BCR-ABL_trace_biased-"$I2.csv 3 6 2 1 100 $SDF &
    PIDS+=($!)
    sleep 0.5
    
    
    echo -e SGPEx_WTRFS -b $FILE $OUTPUT"BCR-ABL_trace_biased-"$I3.csv 3 6 2 1 100 $SDF;
    SGPEx_WTRFS -b $FILE $OUTPUT"BCR-ABL_trace_biased-"$I3.csv 3 6 2 1 100 $SDF &
    PIDS+=($!)
    sleep 0.5
    
    
    echo -e SGPEx_WTRFS -b $FILE $OUTPUT"BCR-ABL_trace_biased-"$I4.csv 3 6 2 1 100 $SDF;
    SGPEx_WTRFS -b $FILE $OUTPUT"BCR-ABL_trace_biased-"$I4.csv 3 6 2 1 100 $SDF &
    PIDS+=($!)
  
  for PID in ${PIDS[@]}
  do
    echo -e waiting for $PID
    wait $PID
  done
done
python3 compute-mean-csv.py $OUTPUT"BCR-ABL_trace_biased.csv" $OUTPUT"BCR-ABL_trace_biased-"*.csv
rm $OUTPUT"BCR-ABL_trace_biased-"*.csv


for I1 in {1..25}
do
  I2=$(($I1 + 25))
  I3=$(($I1 + 50))
  I4=$(($I1 + 75))
  
  echo -e SGPEx_WTRFS -l $FILE $OUTPUT"BCR-ABL_trace_local-"$I1.csv 3 6 2 1 100;
  SGPEx_WTRFS -l $FILE $OUTPUT"BCR-ABL_trace_local-"$I1.csv 3 6 2 1 100 &
  PIDS=($!)
  sleep 0.5
  
  
  echo -e SGPEx_WTRFS -l $FILE $OUTPUT"BCR-ABL_trace_local-"$I2.csv 3 6 2 1 100;
  SGPEx_WTRFS -l $FILE $OUTPUT"BCR-ABL_trace_local-"$I2.csv 3 6 2 1 100 &
  PIDS+=($!)
  sleep 0.5
  
  
  echo -e SGPEx_WTRFS -l $FILE $OUTPUT"BCR-ABL_trace_local-"$I3.csv 3 6 2 1 100;
  SGPEx_WTRFS -l $FILE $OUTPUT"BCR-ABL_trace_local-"$I3.csv 3 6 2 1 100 &
  PIDS+=($!)
  sleep 0.5
  
  
  echo -e SGPEx_WTRFS -l $FILE $OUTPUT"BCR-ABL_trace_local-"$I4.csv 3 6 2 1 100;
  SGPEx_WTRFS -l $FILE $OUTPUT"BCR-ABL_trace_local-"$I4.csv 3 6 2 1 100 &
  PIDS+=($!)
  
  for PID in ${PIDS[@]}
  do
    echo -e waiting for $PID
    wait $PID
  done
done
python3 compute-mean-csv.py $OUTPUT"BCR-ABL_trace_local.csv" $OUTPUT"BCR-ABL_trace_local-"*.csv
rm $OUTPUT"BCR-ABL_trace_local-"*.csv


for I1 in {1..25}
do
  I2=$(($I1 + 25))
  I3=$(($I1 + 50))
  I4=$(($I1 + 75))
  
  echo -e SGPEx_WTRFS -s $FILE $OUTPUT"BCR-ABL_trace_surprised-"$I1.csv 3 6 2 1 100;
  SGPEx_WTRFS -s $FILE $OUTPUT"BCR-ABL_trace_surprised-"$I1.csv 3 6 2 1 100 &
  PIDS=($!)
  sleep 0.5
  
  
  echo -e SGPEx_WTRFS -s $FILE $OUTPUT"BCR-ABL_trace_surprised-"$I2.csv 3 6 2 1 100;
  SGPEx_WTRFS -s $FILE $OUTPUT"BCR-ABL_trace_surprised-"$I2.csv 3 6 2 1 100 &
  PIDS+=($!)
  sleep 0.5
  
  
  echo -e SGPEx_WTRFS -s $FILE $OUTPUT"BCR-ABL_trace_surprised-"$I3.csv 3 6 2 1 100;
  SGPEx_WTRFS -s $FILE $OUTPUT"BCR-ABL_trace_surprised-"$I3.csv 3 6 2 1 100 &
  PIDS+=($!)
  sleep 0.5
  
  
  echo -e SGPEx_WTRFS -s $FILE $OUTPUT"BCR-ABL_trace_surprised-"$I4.csv 3 6 2 1 100;
  SGPEx_WTRFS -s $FILE $OUTPUT"BCR-ABL_trace_surprised-"$I4.csv 3 6 2 1 100 &
  PIDS+=($!)
  
  for PID in ${PIDS[@]}
  do
    echo -e waiting for $PID
    wait $PID
  done
done
python3 compute-mean-csv.py $OUTPUT"BCR-ABL_trace_surprised.csv" $OUTPUT"BCR-ABL_trace_surprised-"*.csv
rm $OUTPUT"BCR-ABL_trace_surprised-"*.csv
echo -e \n;
