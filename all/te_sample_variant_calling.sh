#mm1a
 # ./scr/te_sample_variant_calling.sh result/te_aluy_alignment_full/mm1s_te_sample_names.txt


filename="$1"
while read -r line; do
        # read files
        name="$line"
		## filter bed files by alu
		echo "start variant calling $name"
		
		bcftools mpileup  \
		--threads 30 \
		--annotate FORMAT/AD,FORMAT/ADF,FORMAT/ADR,FORMAT/DP,FORMAT/SP,INFO/AD,INFO/ADF,INFO/ADR \
		--min-BQ 0 \
		-f data/consensus_fasta/mm1s_ctdna_repeats_consensus.fa \
		result/te_aluy_alignment_full/$name'_mergedAligned_fullAligned.out_sorted.bam' \
		-O v \
		-o result/te_vcf/mm1s_vcf_full/$name.vcf
		
		bcftools call -c \
		result/te_vcf/mm1s_vcf_full/$name.vcf > \
		result/te_vcf/mm1s_vcf_full/$name.called.vcf

done < "$filename"
