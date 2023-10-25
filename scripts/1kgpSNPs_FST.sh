## This script calculates WC (1984) FST for all 1kGP SNPs with a MAF > 0.01 across all 1kGP populations (2504 unrelated samples).
## These estimates were then used for the filtration of the UKB summary statistics.

plink \
	--bfile 1kGP_SNPs \
	--fst \
	--within 1kGP_2504samples_clusterFile.txt \
	--out FST_1kGP_SNPs
