## This script generates FST-filtered PRS for 25 UKB phenotypes.
	### Filtered = tertile 3 SNPs are excluded.
## PRS are calculated using default parameters, with an index SNP p value threshold of 0.0001.
## Clumping is performed in the 1kGP EUR cohort, and the resulting index SNPs are used to calculate PRS for all ancestries.
## The target cohort comprises 2504 and 161 individuals from the 1kGP and NCIG databases, respectively.


for code in APOEA APOEB BMI ACALMD DOA EGCR EGCY HBA1C_DF HDL HEIGHT LDL_SF OTFA OSFA PDCL PHG PFA RMNC RHR SGM TCH TFA TTG AST HT T2D; do

PHENOTYPE="${code}_UKB_q3_excluded_p0.0001"
sum_stat="/summary_statistics/q3_excluded/${code}_UKB_q3excluded.txt"

plink \
        --bfile EUR_sharedSNPs \
        --clump $sum_stat \
        --clump-p1 0.0001 \
        --clump-r2 0.5 \
        --clump-kb 250 \
        --clump-snp-field SNP \
        --clump-field P \
        --out EUR_LD_p0.0001

awk 'NR!=1{print $3}' EUR_LD_p0.0001.clumped > EUR_LD_index_p0.0001.snp

for POP_CODE in AFR AMR EAS EUR SAS OCE; do
plink \
        --bfile ${POP_CODE}_sharedSNPs \
        --score $sum_stat 3 4 9 header \
        --extract EUR_LD_index_p0.0001.snp \
        --out PRS_${POP_CODE}_${PHENOTYPE}
done
done
