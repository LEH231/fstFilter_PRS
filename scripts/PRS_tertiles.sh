## This script generates tertile-filtered PRS for the UKB diseases and traits used in the script PRS_control.sh.
	## SNPs were divided into three even FST tertiles.
## Clumping is performed in the 1kGP EUR cohort using default plink 1.9 parameters, and the resulting index SNPs are used to calculate PRS for all ancestries.
## The target cohort comprises 2504 and 161 from the 1kGP and NCIG databases, respectively.


for code in APOEA APOEB BMI ACALMD DOA EGCR EGCY HBA1C_DF HDL HEIGHT LDL_SF OTFA OSFA PDCL PHG PFA RMNC RHR SGM TCH TFA TTG AST HT T2D; do

for q in q1 q2 q3; do

PHENOTYPE="${code}_UKB_${q}_p0.0001"
sum_stat="/summary_statistics/tertile_sumstats/${code}_UKB_${q}.txt"

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
done
