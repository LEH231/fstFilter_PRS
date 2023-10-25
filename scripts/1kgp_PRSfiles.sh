## This script extracts biallelic SNPs with a MAF > 0.01 from the 1kGP dataset and subsets to 2504 unrelated individuals.
	### This requires a file containing the sample IDs of the individuals to retain.
## It also creates continental plink files for the five ancestral groups.
## Note that R is used to identify biallelic SNPs due to the 1kGP VCF format preventing plink and bcftools from identifying such variants.


## Extract SNPs with MAF > 0.01 and subset to 2504 unrelated samples

plink2 \
	--bfile 1kGP_allVariants \
	--keep unrelated1kGP_2504.txt \
	--maf 0.01 \
	--snps-only just-acgt \
	--max-alleles 2 \
	--min-alleles 2 \
	--make-bed \
	--out 1kGP_SNPs


## Extract biallelic SNPs identified in R

plink \
	--bfile 1kGP_SNPs \
	--extract 1kGP_biallelicSNPs.txt \
  --make-bed \
	--out 1kGP_biallelicSNPs


## Create continental files for biallelic SNP set

for POP in AFR AMR EAS EUR SAS; do
plink \
        --bfile 1kGP_biallelicSNPs \
        --keep ${POP}_unrelatedSamples_2504subset.txt \
        --make-bed \
        --out ${POP}_biallelicSNPs
done
