### list of requred softwares: parallel, fastqc, multiqc, trimmomatic, abyss, pamir, samtools, kmergenie, bbnorm


#### Quality contorl with fastqc and merged report with multiqc ####
ls *fastq.gz | parallel --verbose -j 32 "fastqc {}"

multiqc .

#### Trimming and quality filtering with trimmomatic ####
## paired end
ls .. | grep "fastq.gz" | awk '{print substr($1, 1, length($1) - 16)}' \
| sort | uniq | parallel --verbose -j 2 \
"java -jar /storage2/proj/kodikaz/softwares/Trimmomatic-0.39/trimmomatic-0.39.jar PE -threads 20 ../{}_R1_001.fastq.gz ../{}_R2_001.fastq.gz {}_R1_paired.fastq.gz {}_R1_unpaired.fastq.gz {}_R2_paired.fastq.gz {}_R2_unpaired.fastq.gz ILLUMINACLIP:/storage2/proj/kodikaz/softwares/Trimmomatic-0.39/adapters/All_adapters_sgrna.fa:2:30:10:2:keepBothReads LEADING:3 TRAILING:3 MINLEN:75"

## single end
ls .. | grep "fastq.gz" | awk '{print substr($1, 1, length($1) - 16)}' \
| sort | uniq | grep 202 | parallel --verbose -j 2 \
"java -jar /storage2/proj/kodikaz/softwares/Trimmomatic-0.39/trimmomatic-0.39.jar SE -threads 20 ../{}_R1_001.fastq.gz {}_R1_trimmed.fastq.gz ILLUMINACLIP:/storage2/proj/kodikaz/softwares/Trimmomatic-0.39/adapters/All_adapters_sgrna.fa:2:30:10:2:keepBothReads LEADING:3 TRAILING:3 MINLEN:75"


#### Sample depth normalization with bbnorm ####
ls | grep "fastq.gz" | awk '{gsub("_R1_paired.fastq.gz", "", $0); gsub("_R2_paired.fastq.gz", "", $0); print $0}' | sort | uniq | parallel --verbose -j 1 | "bbnorm.sh in={}_R1_paired.fastq.gz in2={}_R2_paired.fastq.gz out={}_R1_paired_detph_normalized.fastq.gz out2={}_R2_paired_depth_normalized.fastq.gz target=10 min=2 threads=30"


#### Best kmer size prediction with kmergenie ####
ls -1 *.fastq.gz > seq_files.txt
kmergenie -t 20 seq_files.txt


################## Example scripts provided below are for the analysis of single sample (hardcoded file names)

#### Assembly of depth normalized smaples with predicted best kmer value with ABYSS assembler ####
abyss-pe name=P201812-2_assembly k=31 B=100G in='P201812-2_paired_detph_normalized_5_R1.fastq.gz P201812-2_paired_depth_normalized_5_R2.fastq.gz'


#### bwa mem alignment of samples for pamir insertion detection ####
bwa mem -t 10 hg38.fa MM1S-cells-with-772-2_R1_paired.fastq.gz MM1S-cells-with-772-2_R2_paired.fastq.gz | samtools sort -@2 -o data/sam_bam/MM1S-cells-with-772-2.bam


#### filtering bam files to only select reads with fixed 150 bp length ####
samtools view -h ../matched_samples_alignment_to_ref_genome/MIA_cells_with_ref.bam | awk 'NR<458{print $0; next} {if(length($10) == 150) {print $0}}' | samtools view -bS - > ../matched_samples_alignment_to_ref_genome/MIA_cells_with_ref_150_lengths.bam

#### running pamir on aligned and processed bam file with yaml config ####

## yaml config of pamir job ##

path:
    /storage2/proj/kodikaz/pamir_job/pamir_myeloma_job
raw-data:
    ../../matched_samples_alignment_to_ref_genome/
reference:
    /storage2/proj/kodikaz/matched_samples_alignment_to_ref_genome/hg38/hg38.fa
population:
    my-pop
input:
 "MM1S_cell_line_with_ref":
  - MM1S_cells_with_ref_150_lengths.bam


## pamir running script ##
/shared/pamir/pamir.sh --configfile pancreatic_cell_line.yaml -j30














