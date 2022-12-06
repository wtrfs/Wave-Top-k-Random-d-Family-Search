export OMP_SCHEDULE=dynamic,1
export OMP_NUM_THREADS=4

SGPEx_Converter ../src/ABL1_ChEMBL_MW_800_linux.sdf ../src/extractionPh*.txt ../data/bcr-abl.lat

SGPEx_Clusterize -s ../data/bcr-abl.lat

SGPEx_WRAcc -c ../data/bcr-abl_SEC.lat

SGPEx_PAD -c ../data/bcr-abl_SEC_WRAcc.lat
