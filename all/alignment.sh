#!/bin/bash
#
#SBATCH --job-name=alignment
#SBATCH --output=log/alignment_slarm.log
#
#SBATCH --nodes=10
#SBATCH --mem=50gb

echo "starting alignment"

bwa mem -t 10 \
/storage2/proj/kodikaz/small_sample_alignment/hg38/hg38.fa \
/storage2/proj/kodikaz/quality_and_adapter_trimming/MM1S-cells-with-772-2_R1_paired.fastq.gz \
/storage2/proj/kodikaz/quality_and_adapter_trimming/MM1S-cells-with-772-2_R2_paired.fastq.gz | \
samtools sort -@2 -o data/sam_bam/MM1S-cells-with-772-2.bam

echo "Finished alignment"

