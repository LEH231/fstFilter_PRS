## This script generates a single 1kGP VCF containing 3202 samples and 73,554,796 variants from the Byrska-Bishop et al.(2022) set.


module load bcftools parallel

## The 1kGP VCFs for chromsomes 1 to 22 were first concatenated into a single file.

bcftools concat --threads 24 \
    1kGP_high_coverage_Illumina.chr1.filtered.SNV_INDEL_SV_phased_panel.vcf.gz \
    1kGP_high_coverage_Illumina.chr2.filtered.SNV_INDEL_SV_phased_panel.vcf.gz \
    1kGP_high_coverage_Illumina.chr3.filtered.SNV_INDEL_SV_phased_panel.vcf.gz \
    1kGP_high_coverage_Illumina.chr4.filtered.SNV_INDEL_SV_phased_panel.vcf.gz \
    1kGP_high_coverage_Illumina.chr5.filtered.SNV_INDEL_SV_phased_panel.vcf.gz \
    1kGP_high_coverage_Illumina.chr6.filtered.SNV_INDEL_SV_phased_panel.vcf.gz \
    1kGP_high_coverage_Illumina.chr7.filtered.SNV_INDEL_SV_phased_panel.vcf.gz \
    1kGP_high_coverage_Illumina.chr8.filtered.SNV_INDEL_SV_phased_panel.vcf.gz \
    1kGP_high_coverage_Illumina.chr9.filtered.SNV_INDEL_SV_phased_panel.vcf.gz \
    1kGP_high_coverage_Illumina.chr10.filtered.SNV_INDEL_SV_phased_panel.vcf.gz \
    1kGP_high_coverage_Illumina.chr11.filtered.SNV_INDEL_SV_phased_panel.vcf.gz \
    1kGP_high_coverage_Illumina.chr12.filtered.SNV_INDEL_SV_phased_panel.vcf.gz \
    1kGP_high_coverage_Illumina.chr13.filtered.SNV_INDEL_SV_phased_panel.vcf.gz \
    1kGP_high_coverage_Illumina.chr14.filtered.SNV_INDEL_SV_phased_panel.vcf.gz \
    1kGP_high_coverage_Illumina.chr15.filtered.SNV_INDEL_SV_phased_panel.vcf.gz \
    1kGP_high_coverage_Illumina.chr16.filtered.SNV_INDEL_SV_phased_panel.vcf.gz \
    1kGP_high_coverage_Illumina.chr17.filtered.SNV_INDEL_SV_phased_panel.vcf.gz \
    1kGP_high_coverage_Illumina.chr18.filtered.SNV_INDEL_SV_phased_panel.vcf.gz \
    1kGP_high_coverage_Illumina.chr19.filtered.SNV_INDEL_SV_phased_panel.vcf.gz \
    1kGP_high_coverage_Illumina.chr20.filtered.SNV_INDEL_SV_phased_panel.vcf.gz \
    1kGP_high_coverage_Illumina.chr21.filtered.SNV_INDEL_SV_phased_panel.vcf.gz \
    1kGP_high_coverage_Illumina.chr22.filtered.SNV_INDEL_SV_phased_panel.vcf.gz \
    -O z -o 1kGP_autosomes_original.vcf.gz | parallel -j 12

bcftools index -t 1kGP_autosomes_original.vcf.gz


## This file was then converted to plink 1.9 format.

plink \
	--vcf 1kGP_autosomes_original.vcf.gz \
	--make-bed \
	--out 1kGP_allVariants
