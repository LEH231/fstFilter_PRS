This document describes the contents of the bash and R scripts used in the thesis in the order that data preparation and analysis was conducted.

# Target data preparation

1kgp_filePrep.sh: Concatenates 1kGP VCFs and converts the merged file into plink 1.9 format.

Sorting_1KGP_Pedigree.Rmd: Sorts 2504 unrelated 1kGP individuals into five ancestral groups.

targetData_prep.Rmd: Identifies multi-allelic SNPs in the 1kGP dataset. The remaining biallelic SNPs that overlapped with the NCIG cohort are also identified.

1kgp_PRSfiles.sh: Extracts biallelic SNPs from the 1kGP plink file and creates ancestral subsets.

ncig_filePrep.sh: Concatenates NCIG VCFs, extracts biallelic SNPs, and reformats variant IDs.

sharedSNP_files.sh: Creates plink files for the six ancestral groups (1kGP + NCIG) containing shared biallelic SNPs.

genetic_distance.sh: Calculates genetic distance (FST) between 1kGP EUR vs other ancestries and 1kGP GBR vs other subpopulations.


# UK Biobank summary statistic preparation

control_UKBsumstat_prep.Rmd: Creates the control summary statistic subset (no FST filter)

1kgpSNPs_FST.sh: Calculates FST for UK Biobank SNPs in the 1kGP cohort.

fstFiltered_UKBsumstat_prep.Rmd: Creates the tertile and FST-filtered PRS summary statistic subsets.


# Polygenic risk score calculation and analysis

PRS_control.sh: plink commands for generating the control PRS.

PRS_tertiles.sh: plink commands for generating the FST tertile-filtered PRS.

PRS_T3_excluded.sh: plink commands for generating the FST-filtered PRS (tertile 3 excluded).

PRS_ancestral_analysis.Rmd: Analyses PRS subsets on an ancestral level, including visualisation, statistical tests, and analysis of other factors (e.g. index SNP retention). 

PRS_subpop_analysis.Rmd: Analysis PRS (control and FST-filtered subsets) on the subpopulation level.

