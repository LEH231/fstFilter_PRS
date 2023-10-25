## This script calculates genetic distance (WC FST) between the studied populations using plink2.0.
  ### Derived from the biallelic MAF 0.01 SNP set shared with the NCIG cohort.
## The first part compares EUR vs other superpopulations, while the second compares the GBR subset to the other subpopulations.


## Part 1: EUR vs others

plink2 \
	--bfile merged_set \
	--fst CATPHENO method=wc base=EUR \
	--within merged_superpop_clusterFile.txt \
	--out EURvsOTHER


## Part 2: GBR vs subpops

plink2 \
        --bfile merged_set \
        --fst CATPHENO method=wc base=GBR \
        --within merged_subpop_clusterFile.txt \
        --out GBRvsOTHER
