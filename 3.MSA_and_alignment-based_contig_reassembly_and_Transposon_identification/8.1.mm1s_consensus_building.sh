#### create consensus genome
# 2024 genome
bcftools mpileup  \
--threads 30 \
-f data/fasta/mm1s_ctdna_uniq_contigs_consensus.fa \
data/sam_bam/MM1S_uniq_contigs_2024_filtered.bam \
-O v \
-o data/consensus_fasta/MM1S_uniq_contigs_224.vcf
# call the variants
bcftools call -c data/consensus_fasta/MM1S_uniq_contigs_224.vcf > data/consensus_fasta/MM1S_uniq_contigs_224_called.vcf
vcfutils.pl vcf2fq data/consensus_fasta/MM1S_uniq_contigs_224_called.vcf  > data/consensus_fasta/contigs_2024_filtered_consensus.fastq
#from fastq to fasta 
./shared/seqtk/seqtk seq -aQ64 -q20 -n N data/consensus_fasta/contigs_2024_filtered_consensus.fastq > data/consensus_fasta/contigs_2024_filtered_consensus.fasta

## 2015 genome
echo "start 2025"
bcftools mpileup  \
--threads 30 \
-f data/fasta/mm1s_uniq_contigs.fa \
data/sam_bam/MM1S_uniq_contigs_2025_filtered.bam  \
-O v \
-o data/consensus_fasta/MM1S_uniq_contigs_2025.vcf
# call the variants
bcftools call -c data/consensus_fasta/MM1S_uniq_contigs_2025.vcf > data/consensus_fasta/MM1S_uniq_contigs_2025_called.vcf
vcfutils.pl vcf2fq data/consensus_fasta/MM1S_uniq_contigs_2025_called.vcf  > data/consensus_fasta/contigs_2025_filtered_consensus.fastq
#from fastq to fasta 
/shared/seqtk/seqtk seq -aQ64 -q20 -n N data/consensus_fasta/contigs_2025_filtered_consensus.fastq > data/consensus_fasta/contigs_2025_filtered_consensus.fasta
echo "finish 2025"

##39652 genome
echo "start 39652"
bcftools mpileup  \
--threads 30 \
-f data/fasta/mm1s_uniq_contigs.fa \
data/sam_bam/MM1S_uniq_contigs_39652_filtered.bam  \
-O v \
-o data/consensus_fasta/MM1S_uniq_contigs_39652.vcf
# call the variants
bcftools call -c data/consensus_fasta/MM1S_uniq_contigs_39652.vcf > data/consensus_fasta/MM1S_uniq_contigs_39652_called.vcf
vcfutils.pl vcf2fq data/consensus_fasta/MM1S_uniq_contigs_39652_called.vcf  > data/consensus_fasta/contigs_39652_filtered_consensus.fastq
#from fastq to fasta 
/shared/seqtk/seqtk seq -aQ64 -q20 -n N data/consensus_fasta/contigs_39652_filtered_consensus.fastq > data/consensus_fasta/contigs_39652_filtered_consensus.fasta
echo "finish 39652"
##772 genome
echo "start 772"
bcftools mpileup  \
--threads 30 \
-f data/fasta/mm1s_uniq_contigs.fa \
data/sam_bam/MM1S_uniq_contigs_772_filtered.bam  \
-O v \
-o data/consensus_fasta/MM1S_uniq_contigs_772.vcf
# call the variants
bcftools call -c data/consensus_fasta/MM1S_uniq_contigs_772.vcf > data/consensus_fasta/MM1S_uniq_contigs_772_called.vcf
vcfutils.pl vcf2fq data/consensus_fasta/MM1S_uniq_contigs_772_called.vcf  > data/consensus_fasta/contigs_772_filtered_consensus.fastq
#from fastq to fasta 
/shared/seqtk/seqtk seq -aQ64 -q20 -n N data/consensus_fasta/contigs_772_filtered_consensus.fastq > data/consensus_fasta/contigs_772_filtered_consensus.fasta
echo "finish 772"
##910 genome
echo "start 910"
bcftools mpileup  \
--threads 30 \
-f data/fasta/mm1s_uniq_contigs.fa \
data/sam_bam/MM1S_uniq_contigs_910_filtered.bam  \
-O v \
-o data/consensus_fasta/MM1S_uniq_contigs_910.vcf
# call the variants
bcftools call -c data/consensus_fasta/MM1S_uniq_contigs_910.vcf > data/consensus_fasta/MM1S_uniq_contigs_910_called.vcf
vcfutils.pl vcf2fq data/consensus_fasta/MM1S_uniq_contigs_910_called.vcf  > data/consensus_fasta/contigs_910_filtered_consensus.fastq
#from fastq to fasta 
/shared/seqtk/seqtk seq -aQ64 -q20 -n N data/consensus_fasta/contigs_910_filtered_consensus.fastq > data/consensus_fasta/contigs_910_filtered_consensus.fasta
echo "finish 910"








