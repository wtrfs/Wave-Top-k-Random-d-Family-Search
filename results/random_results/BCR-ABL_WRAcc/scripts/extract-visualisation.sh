
FILE=../data/bcr-abl_SEC_WRAcc_PAD.lat
OUTPUT=../data/
SDF=../src/ABL1_ChEMBL_MW_800_linux.sdf


echo Rscript compute_comparaison_visualisation.R $OUTPUT*"trace"*".csv" $OUTPUT"BCR-ABL_WRAcc_trace_comparaison"
Rscript compute_comparaison_visualisation.R $OUTPUT*"trace"*".csv" $OUTPUT"BCR-ABL_WRAcc_trace_comparaison"

