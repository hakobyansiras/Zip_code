# filter gtf file
#grep -w AluY data/gtf/repeatmasker_hg38.gtf > data/gtf/repeatmasker_hg38_aluy.gtf

# filter ALuy 

#filename="$1"
#while read -r line; do
#        # read files
#        name="$line"
#		## filter bed files by alu
#		echo "start filtering $name"
#		bedtools intersect  \
#		-a data/te_bam/$name.bam \
#		-b  data/gtf/repeatmasker_hg38_aluy.gtf -wa > data/te_bam/$name'_aluy.bam' 
#
#		echo "finish filtering $name"
#
#done < "$filename"

# From ban convert to fastq
#filename="$1"

#while read -r line; do
#        # read files
#        name="$line"
#		## filter bed files by alu
#		echo "start bamtofastq $name"
#		
#		echo "bedtools bamtofastq \
#		-i  data/te_bam/$name'_aluy.bam' \
#		-fq data/te_fastq/$name'_aluy.fastq'"
#		
#		bedtools bamtofastq \
#		-i  data/te_bam/$name'_aluy.bam' \
#		-fq data/te_fastq/$name'_aluy.fastq' 
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
#--genomeDir data/ct_dna_full_star_index/ \
#--genomeFastaFiles data/consensus_fasta/mm1s_ctdna_repeats_consensus.fa

#test alignment
#filename="$1"
#while read -r line; do
#        # read files
#        name="$line"
#		## filter bed files by alu
#		echo "start Alignment $name"
#		/shared/STAR-2.7.8a/bin/Linux_x86_64/STAR \
#		--runThreadN 50 --genomeDir data/ct_dna_star_index/ \
#		--readFilesIn data/te_fastq/$name'_aluy.fastq'  \
#		--outFileNamePrefix result/te_aluy_alignment/$name'_aluy'
#		
#		echo "Sorting $name"
#		samtools view -S -b \
#		result/te_aluy_alignment/$name'_aluyAligned.out.sam' | \
#		samtools sort -@5 > \
#		result/te_aluy_alignment/$name'_aluyAligned.out_sorted.bam'
#		
#		samtools index $name'_aluyAligned.out_sorted.bam'
#
#		echo "finish Alignment $name"
#done < "$filename"

#combine MMRC_merged.bam
samtools merge \
-f -p \
result/te_aluy_alignment/MMRC_merged_aluy.bam \
result/te_aluy_alignment/MMRC-001-003_P66F6_mergedAligned_aluyAligned.out_sorted.bam \
result/te_aluy_alignment/MMRC-001-006-1_P6A6_mergedAligned_aluyAligned.out_sorted.bam \
result/te_aluy_alignment/MMRC-001-008_2_P65F5_mergedAligned_aluyAligned.out_sorted.bam \
result/te_aluy_alignment/MMRC-001-008_2_P77G5_mergedAligned_aluyAligned.out_sorted.bam \
result/te_aluy_alignment/MMRC-001-009-1_P53E5_mergedAligned_aluyAligned.out_sorted.bam \
result/te_aluy_alignment/MMRC-001-009-2_P41D5_mergedAligned_aluyAligned.out_sorted.bam \
result/te_aluy_alignment/MMRC-001-010-1_P17B5_mergedAligned_aluyAligned.out_sorted.bam \
result/te_aluy_alignment/MMRC-001-010_P29C5_mergedAligned_aluyAligned.out_sorted.bam \
result/te_aluy_alignment/MMRC-001-011_P5A5_mergedAligned_aluyAligned.out_sorted.bam \
result/te_aluy_alignment/MMRC-001-013_P76G4_mergedAligned_aluyAligned.out_sorted.bam \
result/te_aluy_alignment/MMRC-001-014_P64F4_mergedAligned_aluyAligned.out_sorted.bam \
result/te_aluy_alignment/MMRC-001-015_P52E4_mergedAligned_aluyAligned.out_sorted.bam \
result/te_aluy_alignment/MMRC-001-016_P40D4_mergedAligned_aluyAligned.out_sorted.bam \
result/te_aluy_alignment/MMRC-002-001_2_P16B4_mergedAligned_aluyAligned.out_sorted.bam \
result/te_aluy_alignment/MMRC-002-001_2_P28C4_mergedAligned_aluyAligned.out_sorted.bam \
result/te_aluy_alignment/MMRC-002-002-2_P87H3_mergedAligned_aluyAligned.out_sorted.bam \
result/te_aluy_alignment/MMRC-002-003_P75G3_mergedAligned_aluyAligned.out_sorted.bam \
result/te_aluy_alignment/MMRC-003-001_P63F3_mergedAligned_aluyAligned.out_sorted.bam \
result/te_aluy_alignment/MMRC-003-002-1_P39D3_mergedAligned_aluyAligned.out_sorted.bam \
result/te_aluy_alignment/MMRC-003-002_P51E3_mergedAligned_aluyAligned.out_sorted.bam \
result/te_aluy_alignment/MMRC-003-003_P27C3_mergedAligned_aluyAligned.out_sorted.bam \
result/te_aluy_alignment/MMRC-004-001-1_P3A3_mergedAligned_aluyAligned.out_sorted.bam \
result/te_aluy_alignment/MMRC-004-002-1_P86H2_mergedAligned_aluyAligned.out_sorted.bam \
result/te_aluy_alignment/MMRC-004-008_P38D2_mergedAligned_aluyAligned.out_sorted.bam \
result/te_aluy_alignment/MMRC-004-009_P26C2_mergedAligned_aluyAligned.out_sorted.bam

samtools sort -@10 result/te_aluy_alignment/MMRC_merged_aluy.bam > \
result/te_aluy_alignment/MMRC_merged_aluy_sorted.bam
samtools index result/te_aluy_alignment/MMRC_merged_aluy_sorted.bam

bcftools mpileup  \
--threads 30 \
--annotate FORMAT/AD,FORMAT/ADF,FORMAT/ADR,FORMAT/DP,FORMAT/SP,INFO/AD,INFO/ADF,INFO/ADR \
--min-BQ 0 \
-f data/consensus_fasta/mm1s_14_772_4370313_consensus.fa \
result/te_aluy_alignment/MMRC_merged_aluy_sorted.bam \
-O v \
-o result/te_vcf/MMRC_merged_aluy.vcf

bcftools call -c \
result/te_vcf/MMRC_merged_aluy.vcf > \
result/te_vcf/MMRC_merged_aluy_called.vcf

#full alignment
filename="$1"
while read -r line; do
        # read files
         name="$line"
		 
		#filter bam with repeats
		#echo "start filtering $name"
		#bedtools intersect  \
		#-a data/te_bam/$name.bam \
		#-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/$name'_filtered.bam' 
		#echo "Finished filtering $name"
		##convert bed to fastq
		#echo "start bamtofastq $name"
		#
		#bedtools bamtofastq \
		#-i data/te_bam/$name'_filtered.bam'  \
		#-fq data/te_fastq/$name'_filtered_full.fastq'
	    #echo "Finish bamtofastq $name"
		

		#echo "start Alignment $name"
		#/shared/STAR-2.7.8a/bin/Linux_x86_64/STAR \
		#--runThreadN 50 --genomeDir data/ct_dna_full_star_index/ \
		#--readFilesIn data/te_fastq/$name'_filtered_full.fastq'  \
		#--outFileNamePrefix result/te_aluy_alignment_full/$name'_full'
		#
		#echo "Sorting $name"
		#samtools view -S -b \
		#result/te_aluy_alignment_full/$name'_fullAligned.out.sam' | \
		#samtools sort -@10 > \
		#result/te_aluy_alignment_full/$name'_fullAligned.out_sorted.bam'
		#
		#samtools index result/te_aluy_alignment_full/$name'_fullAligned.out_sorted.bam'
		#echo "finish Alignment $name"
		#
		#echo "start variant calling $name"
		
		#bcftools mpileup  \
		#--threads 30 \
		#--annotate FORMAT/AD,FORMAT/ADF,FORMAT/ADR,FORMAT/DP,FORMAT/SP,INFO/AD,INFO/ADF,INFO/ADR \
		#--min-BQ 0 \
		#-f data/consensus_fasta/mm1s_ctdna_repeats_consensus.fa \
		#result/te_aluy_alignment_full/$name'_fullAligned.out_sorted.bam' \
		#-O v \
		#-o result/te_vcf/$name.vcf
		#echo "Finish variant calling $name"
		
		echo "Start variant calling $name"
		bcftools call -c \
		result/te_vcf/$name.vcf > \
		result/te_vcf/$name'_called.vcf'
		echo "Finish variant calling $name"
		
done < "$filename"

echo "Full Finished"


### merge bam files
samtools merge \
-f -p \
result/te_aluy_alignment_full/MMRC_full_merged.bam \
result/te_aluy_alignment_full/MMRC-001-008_2_P65F5_mergedAligned_fullAligned.out_sorted.bam \
result/te_aluy_alignment_full/MMRC-001-008_2_P77G5_mergedAligned_fullAligned.out_sorted.bam \
result/te_aluy_alignment_full/MMRC-001-009-1_P53E5_mergedAligned_fullAligned.out_sorted.bam \
result/te_aluy_alignment_full/MMRC-001-009-2_P41D5_mergedAligned_fullAligned.out_sorted.bam \
result/te_aluy_alignment_full/MMRC-001-010-1_P17B5_mergedAligned_fullAligned.out_sorted.bam \
result/te_aluy_alignment_full/MMRC-001-010_P29C5_mergedAligned_fullAligned.out_sorted.bam \
result/te_aluy_alignment_full/MMRC-001-011_P5A5_mergedAligned_fullAligned.out_sorted.bam \
result/te_aluy_alignment_full/MMRC-001-013_P76G4_mergedAligned_fullAligned.out_sorted.bam \
result/te_aluy_alignment_full/MMRC-001-014_P64F4_mergedAligned_fullAligned.out_sorted.bam \
result/te_aluy_alignment_full/MMRC-001-015_P52E4_mergedAligned_fullAligned.out_sorted.bam \
result/te_aluy_alignment_full/MMRC-001-016_P40D4_mergedAligned_fullAligned.out_sorted.bam \
result/te_aluy_alignment_full/MMRC-002-001_2_P16B4_mergedAligned_fullAligned.out_sorted.bam \
result/te_aluy_alignment_full/MMRC-002-001_2_P28C4_mergedAligned_fullAligned.out_sorted.bam \
result/te_aluy_alignment_full/MMRC-002-002-2_P87H3_mergedAligned_fullAligned.out_sorted.bam \
result/te_aluy_alignment_full/MMRC-002-003_P75G3_mergedAligned_fullAligned.out_sorted.bam \
result/te_aluy_alignment_full/MMRC-003-001_P63F3_mergedAligned_fullAligned.out_sorted.bam \
result/te_aluy_alignment_full/MMRC-003-002-1_P39D3_mergedAligned_fullAligned.out_sorted.bam \
result/te_aluy_alignment_full/MMRC-003-002_P51E3_mergedAligned_fullAligned.out_sorted.bam \
result/te_aluy_alignment_full/MMRC-003-003_P27C3_mergedAligned_fullAligned.out_sorted.bam \
result/te_aluy_alignment_full/MMRC-004-001-1_P3A3_mergedAligned_fullAligned.out_sorted.bam \
result/te_aluy_alignment_full/MMRC-004-002-1_P86H2_mergedAligned_fullAligned.out_sorted.bam \
result/te_aluy_alignment_full/MMRC-004-008_P38D2_mergedAligned_fullAligned.out_sorted.bam \
result/te_aluy_alignment_full/MMRC-004-009_P26C2_mergedAligned_fullAligned.out_sorted.bam
# sort
samtools sort -@10 \
result/te_aluy_alignment_full/MMRC_full_merged.bam > result/te_aluy_alignment_full/MMRC_full_merged_sorted.bam
samtools index result/te_aluy_alignment_full/MMRC_full_merged_sorted.bam
## variant calling
bcftools mpileup  \
--threads 30 \
--annotate FORMAT/AD,FORMAT/ADF,FORMAT/ADR,FORMAT/DP,FORMAT/SP,INFO/AD,INFO/ADF,INFO/ADR \
--min-BQ 0 \
-f data/consensus_fasta/mm1s_ctdna_repeats_consensus.fa \
result/te_aluy_alignment_full/MMRC_full_merged_sorted.bam  \
-O v \
-o result/te_vcf/MMRC_full_merged.vcf

bcftools call -c \
result/te_vcf/MMRC_full_merged.vcf > \
result/te_vcf/MMRC_full_merged_called.vcf



