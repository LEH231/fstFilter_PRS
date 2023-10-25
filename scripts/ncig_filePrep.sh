## This script generates a single NCIG VCF containing 161 samples, 48,309,954 biallelic SNPs, and updated CPRA IDs to match the 1kGP format.

module load bcftools parallel


## First, the original NCIG VCFs for chromosomes 1 to 22 were concatenated into a single file.

bcftools concat --threads 4 /chr{1..22}.$
-O z -o chr1to22_NCIG.vcf.gz | parallel -j 12

bcftools index -t chr1to22_NCIG.vcf.gz


## The concatenated file was then filtered to retain 161 Indigenous Australian samples and biallelic SNPs.
	### The NCIGsamples.txt file contains the metadata used for this

bcftools view --threads 4 -S NCIGsamples.txt chr1to22_NCIG.vcf.gz \
-m2 -M2 -v snps -O z -o chr1to22_NCIG_biallelicSNPs_161subset.vcf.gz | parallel -j 12

bcftools index -t chr1to22_NCIG_biallelicSNPs_161subset.vcf.gz


## Finally, the variant IDs were updated to match the CPRA format of the 1kGP dataset to ease downstream plink analysis.

bcftools annotate --threads 4 --rename-chrs chromosome_map.txt chr1to22_NCIG_biallelicSNPs_161subset.vcf.gz \
| bcftools annotate --threads 4 --set-id '%CHROM:%POS:%REF:%ALT' -O z -o NCIG_biallelicSNPs_161subset.vcf.gz | parallel -j 12

bcftools index -t NCIG_biallelicSNPs_161subset.vcf.gz


