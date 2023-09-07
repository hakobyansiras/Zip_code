#!/bin/bash
#
#SBATCH --job-name=alignment
#SBATCH --output=log/MindTheGap.log
#
#SBATCH --nodes=25
#SBATCH --mem=100gb

# GitHub doc: https://github.com/GATB/MindTheGap

#find
#echo "Strting MindTheGap find"
#/home/ubuntu/softwares/miniconda/bin/MindTheGap find \
#-in /storage/insertion_detection_pamir/data/fastq/MM1S-cells-with-772-2_R1_paired.fastq,/storage/insertion_detection_pamir/data/fastq/MM1S-cells-with-772-2_R2_paired.fastq \
#-ref /storage/insertion_detection_pamir/data/hg38/hg38.fa \
#-out /storage/insertion_detection_pamir/result/mindthegap_find \
#-nb-cores 25 \
#-max-memory 100000
#echo "Finished MindTheGap find"

#fill
echo "Strting MindTheGap fill"
/home/ubuntu/softwares/miniconda/bin/MindTheGap fill \
-graph /storage/insertion_detection_pamir/result/mindthegap_find.h5 \
-bkpt /storage/insertion_detection_pamir/result/mindthegap_find.breakpoints \
-out /storage/insertion_detection_pamir/result/mindthegap_find \
-nb-cores 25 \
-max-memory 100000
echo "Finished MindTheGap fill"