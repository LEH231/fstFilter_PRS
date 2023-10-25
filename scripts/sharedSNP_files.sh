## This script creates continental files containing QC'd biallelic SNPs shared between the NCIG and 1kGP cohorts.
## It first extracts the 1kGP biallelic SNPs retained in the /2504_samples/ directory from the filtered concatenated NCIG VCF (n=161), then uses the remaining SNPs found in both datasets to create new 1kGP files.


## Extract 1kGP biallelic SNPs present in the NCIG cohort

plink \
        --vcf NCIG_biallelicSNPs_161subset.vcf.gz \
        --extract 1kGP_biallelicSNPs.txt \
        --make-bed \
        --out OCE_sharedSNPs


cut -f2 OCE_sharedSNPs.bim > shared_SNPs.txt


## Create 1kGP files of biallelic SNPs shared with NCIG

for POP in 1kGP AFR AMR EAS EUR SAS; do
plink \
        --bfile ${POP}_biallelicSNPs \
        --extract shared_SNPs.txt \
	      --make-bed \
        --out ${POP}_sharedSNPs
done

