######################################################################################
################################### Alignment ###################################
######################################################################################
## Creating BWA index for the reference
bwa index data/fasta/mia_ctdna_uniq_contigs_consensus.fa


filename="$1"
while read -r line; do
        # read files
        name="$line"
        echo "Name read from file - $name"
		echo "start $name alingment"
		bwa mem -t 30 \
		/storage2/proj/kodikaz/insertion_detection_pamir/data/fasta/mia_ctdna_uniq_contigs_consensus.fa \
		/storage2/proj/kodikaz/quality_and_adapter_trimming/$name'_R1_paired.fastq.gz' \
		/storage2/proj/kodikaz/quality_and_adapter_trimming/$name'_R2_paired.fastq.gz' | \
		samtools sort -@30 -o data/sam_bam/MIA_uniq_contigs_$name.bam
		echo "finish $name alingment"
		
		echo "start $name bam filtering"
		samtools view -b -f 2 -F 524 data/sam_bam/MIA_uniq_contigs_$name.bam > data/sam_bam/MIA_uniq_contigs_$name.filtered.bam 
		echo "finish $name bam filtering"
		

done < "$filename"

		
		
		
		