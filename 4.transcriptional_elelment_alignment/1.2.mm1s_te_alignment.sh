###########################################################
######################## Alignment ########################
###########################################################

# creat index
#/shared/STAR-2.7.8a/bin/Linux_x86_64/STAR \
#--runMode genomeGenerate \
#--runThreadN 30 \
#--genomeDir data/ct_dna_full_star_index/ \
#--genomeFastaFiles data/consensus_fasta/mm1s_ctdna_repeats_consensus.fa

filename="$1"
while read -r line; do
        # read files
         name="$line"
		 
		filter bam with repeats
		echo "start filtering $name"
		bedtools intersect  \
		-a data/te_bam/$name.bam \
		-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/$name'_filtered.bam' 
		echo "Finished filtering $name"
		#convert bed to fastq
		echo "start bamtofastq $name"
		
		bedtools bamtofastq \
		-i data/te_bam/$name'_filtered.bam'  \
		-fq data/te_fastq/$name'_filtered_full.fastq'
	    echo "Finish bamtofastq $name"
		

		echo "start Alignment $name"
		/shared/STAR-2.7.8a/bin/Linux_x86_64/STAR \
		--runThreadN 50 --genomeDir data/ct_dna_full_star_index/ \
		--readFilesIn data/te_fastq/$name'_filtered_full.fastq'  \
		--outFileNamePrefix result/te_aluy_alignment_full/$name'_full'
		
		echo "Sorting $name"
		samtools view -S -b \
		result/te_aluy_alignment_full/$name'_fullAligned.out.sam' | \
		samtools sort -@10 > \
		result/te_aluy_alignment_full/$name'_fullAligned.out_sorted.bam'
		
		samtools index result/te_aluy_alignment_full/$name'_fullAligned.out_sorted.bam'
		echo "finish Alignment $name"
		
		echo "start variant calling $name"
		
		bcftools mpileup  \
		--threads 30 \
		--annotate FORMAT/AD,FORMAT/ADF,FORMAT/ADR,FORMAT/DP,FORMAT/SP,INFO/AD,INFO/ADF,INFO/ADR \
		--min-BQ 0 \
		-f data/consensus_fasta/mm1s_ctdna_repeats_consensus.fa \
		result/te_aluy_alignment_full/$name'_fullAligned.out_sorted.bam' \
		-O v \
		-o result/te_vcf/$name.vcf
		echo "Finish variant calling $name"
		
		echo "Start variant calling $name"
		bcftools call -c \
		result/te_vcf/$name.vcf > \
		result/te_vcf/$name'_called.vcf'
		echo "Finish variant calling $name"
		
done < "$filename"

echo "Full Finished"
