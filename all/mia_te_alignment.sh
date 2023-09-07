# creat index for the slignment
#echo "start Creating index"
#/shared/STAR-2.7.8a/bin/Linux_x86_64/STAR \
#--runMode genomeGenerate \
#--runThreadN 30 \
#--genomeSAindexNbases 7 \
#--genomeDir data/mia_ct_dna_full_star_index/ \
#--genomeFastaFiles data/consensus_fasta/mia_ctdna_repeat_consensus.fa

######################## Alignment ########################
# file name /storage2/proj/kodikaz/pcrnaseq/merged_data/pdac_sample_names.txt
#full alignment
filename="$1"
while read -r line; do
        # read files
         name="$line"

		echo "start Alignment $name"
		gunzip /storage2/proj/kodikaz/pcrnaseq/merged_data/$name'_merged_fastq.gz' 
		
		/shared/STAR-2.7.8a/bin/Linux_x86_64/STAR \
		--runThreadN 50 --genomeDir data/mia_ct_dna_full_star_index/ \
		--readFilesIn /storage2/proj/kodikaz/pcrnaseq/merged_data/$name'_merged_fastq'  \
		--outFileNamePrefix result/mia_te_alignment/$name'_full'
		
		gzip /storage2/proj/kodikaz/pcrnaseq/merged_data/$name'_merged_fastq'
		
		echo "Sorting $name"
		samtools view -S -b \
		result/mia_te_alignment/$name'_fullAligned.out.sam' | \
		samtools sort -@10 > \
		result/mia_te_alignment/$name'_fullAligned.out_sorted.bam'
		
		samtools index result/mia_te_alignment/$name'_fullAligned.out_sorted.bam'
		echo "finish Alignment $name"
		#
		echo "start variant calling $name"
		
		bcftools mpileup  \
		--threads 30 \
		--annotate FORMAT/AD,FORMAT/ADF,FORMAT/ADR,FORMAT/DP,FORMAT/SP,INFO/AD,INFO/ADF,INFO/ADR \
		--min-BQ 0 \
		-f data/consensus_fasta/mia_ctdna_repeat_consensus.fa \
		result/mia_te_alignment/$name'_fullAligned.out_sorted.bam' \
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

