# filter gtf file
#grep -w Tigger3a data/gtf/repeatmasker_hg38.gtf > data/gtf/repeatmasker_hg38_Tigger3a.gtf

 #filter ALuy 

#filename="$1"
#while read -r line; do
#        # read files
#        name="$line"
#		## filter bed files by Tigger3a
#		echo "start filtering $name"
#		bedtools intersect  \
#		-a data/te_bam/$name.bam \
#		-b  data/gtf/repeatmasker_hg38_Tigger3a.gtf -wa > data/te_bam/$name'_Tigger3a.bam' 
#
#		echo "finish filtering $name"
#
#
#		## filter bed files by Tigger3a
#		echo "start bamtofastq $name"
#		
#		echo "bedtools bamtofastq \
#		-i  data/te_bam/$name'_Tigger3a.bam' \
#		-fq data/te_fastq/$name'_Tigger3a.fastq'"
#		
#		bedtools bamtofastq \
#		-i  data/te_bam/$name'_Tigger3a.bam' \
#		-fq data/te_fastq/$name'_Tigger3a.fastq' 
#
#		echo "finish bamtofastq $name"
#done < "$filename"

######################################################################################################
######################## Alignment ########################

# Align te filtered fastq (only aluy regions) on the consensus ctDNA 14 contig


# creat index
#/shared/STAR-2.7.8a/bin/Linux_x86_64/STAR \
#--runMode genomeGenerate \
#--runThreadN 30 \
#--genomeDir data/ct_dna_star_Tigger3a_index/ \
#--genomeFastaFiles data/consensus_fasta/mm1s_18_772_9100610_Tigger3a.fa


#test alignment
filename="$1"
while read -r line; do
        # read files
        name="$line"
		## filter bed files by alu
		echo "start Alignment $name"
		/shared/STAR-2.7.8a/bin/Linux_x86_64/STAR \
		--runThreadN 50 --genomeDir  data/ct_dna_star_Tigger3a_index/ \
		--readFilesIn data/te_fastq/$name'_Tigger3a.fastq'  \
		--outFileNamePrefix result/te_Tigger3a_alignment/$name'_Tigger3a'
		
		echo "Sorting $name"
		samtools view -S -b \
		result/te_Tigger3a_alignment/$name'_Tigger3aAligned.out.sam' | \
		samtools sort -@5 > \
		result/te_Tigger3a_alignment/$name'_Tigger3aAligned.out_sorted.bam'
		
		echo "finish Alignment $name"
done < "$filename"

## merge files
echo "start variant calling"
samtools merge result/te_Tigger3a_alignment/MMRC_Tigger3a_merged.bam \
result/te_Tigger3a_alignment/MMRC-001-008_2_P65F5_mergedAligned_Tigger3aAligned.out_sorted.bam \
result/te_Tigger3a_alignment/MMRC-001-008_2_P77G5_mergedAligned_Tigger3aAligned.out_sorted.bam \
result/te_Tigger3a_alignment/MMRC-001-009-1_P53E5_mergedAligned_Tigger3aAligned.out_sorted.bam \
result/te_Tigger3a_alignment/MMRC-001-009-2_P41D5_mergedAligned_Tigger3aAligned.out_sorted.bam \
result/te_Tigger3a_alignment/MMRC-001-010-1_P17B5_mergedAligned_Tigger3aAligned.out_sorted.bam \
result/te_Tigger3a_alignment/MMRC-001-010_P29C5_mergedAligned_Tigger3aAligned.out_sorted.bam \
result/te_Tigger3a_alignment/MMRC-001-011_P5A5_mergedAligned_Tigger3aAligned.out_sorted.bam \
result/te_Tigger3a_alignment/MMRC-001-013_P76G4_mergedAligned_Tigger3aAligned.out_sorted.bam \
result/te_Tigger3a_alignment/MMRC-001-014_P64F4_mergedAligned_Tigger3aAligned.out_sorted.bam \
result/te_Tigger3a_alignment/MMRC-001-015_P52E4_mergedAligned_Tigger3aAligned.out_sorted.bam \
result/te_Tigger3a_alignment/MMRC-001-016_P40D4_mergedAligned_Tigger3aAligned.out_sorted.bam \
result/te_Tigger3a_alignment/MMRC-002-001_2_P16B4_mergedAligned_Tigger3aAligned.out_sorted.bam \
result/te_Tigger3a_alignment/MMRC-002-001_2_P28C4_mergedAligned_Tigger3aAligned.out_sorted.bam \
result/te_Tigger3a_alignment/MMRC-002-002-2_P87H3_mergedAligned_Tigger3aAligned.out_sorted.bam \
result/te_Tigger3a_alignment/MMRC-002-003_P75G3_mergedAligned_Tigger3aAligned.out_sorted.bam \
result/te_Tigger3a_alignment/MMRC-003-001_P63F3_mergedAligned_Tigger3aAligned.out_sorted.bam \
result/te_Tigger3a_alignment/MMRC-003-002-1_P39D3_mergedAligned_Tigger3aAligned.out_sorted.bam \
result/te_Tigger3a_alignment/MMRC-003-002_P51E3_mergedAligned_Tigger3aAligned.out_sorted.bam \
result/te_Tigger3a_alignment/MMRC-003-003_P27C3_mergedAligned_Tigger3aAligned.out_sorted.bam \
result/te_Tigger3a_alignment/MMRC-004-001-1_P3A3_mergedAligned_Tigger3aAligned.out_sorted.bam \
result/te_Tigger3a_alignment/MMRC-004-002-1_P86H2_mergedAligned_Tigger3aAligned.out_sorted.bam \
result/te_Tigger3a_alignment/MMRC-004-008_P38D2_mergedAligned_Tigger3aAligned.out_sorted.bam \
result/te_Tigger3a_alignment/MMRC-004-009_P26C2_mergedAligned_Tigger3aAligned.out_sorted.bam

samtools sort -@10  result/te_Tigger3a_alignment/MMRC_Tigger3a_merged.bam > \
result/te_Tigger3a_alignment/MMRC_Tigger3a_merged_sorted.bam
samtools index result/te_Tigger3a_alignment/MMRC_Tigger3a_merged_sorted.bam

bcftools mpileup  \
--threads 30 \
--annotate FORMAT/AD,FORMAT/ADF,FORMAT/ADR,FORMAT/DP,FORMAT/SP,INFO/AD,INFO/ADF,INFO/ADR \
--min-BQ 0 \
-f data/consensus_fasta/mm1s_18_772_9100610_Tigger3a.fa \
result/te_Tigger3a_alignment/MMRC_Tigger3a_merged_sorted.bam \
-O v \
-o result/te_vcf/MMRC_Tigger3a_merged.vcf

bcftools call -c \
result/te_vcf/MMRC_Tigger3a_merged.vcf > \
result/te_vcf/MMRC_Tigger3a_merged_called.vcf
echo "Finished variant calling"

