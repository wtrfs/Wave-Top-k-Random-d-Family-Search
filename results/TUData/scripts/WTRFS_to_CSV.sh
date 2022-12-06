cd /home/lehembr211/Documents/lehembrethese/Workspace/BCR-ABL/Norns_Lattice/

make -j4 Norns_lattice_tocsv

cd /home/lehembr211/Documents/lehembrethese/Workspace/TUDataset/scripts/
for DIR in ../**/
do
  if [ "$DIR" != "../scripts/" ]; then
    TMP=${DIR%/*}
    echo /home/lehembr211/Documents/lehembrethese/Workspace/BCR-ABL/Norns_Lattice/Norns_lattice_tocsv -tu $DIR${TMP##*/}.lat;
    /home/lehembr211/Documents/lehembrethese/Workspace/BCR-ABL/Norns_Lattice/Norns_lattice_tocsv -tu $DIR${TMP##*/}.lat
    echo /home/lehembr211/Documents/lehembrethese/Workspace/BCR-ABL/Norns_Lattice/Norns_lattice_tocsv -c -tu $DIR${TMP##*/}_SEC_WRAcc_PAD_WTRFS.lat;
    /home/lehembr211/Documents/lehembrethese/Workspace/BCR-ABL/Norns_Lattice/Norns_lattice_tocsv -c -tu $DIR${TMP##*/}_SEC_WRAcc_PAD_WTRFS.lat
  fi
done

cd /home/lehembr211/Documents/lehembrethese/Workspace/BCR-ABL/Norns_Lattice/

make clean
