######################################################################################
################################### Consensus boulding ###################################
######################################################################################
####### P20181-2 (Done)
bcftools mpileup  \
--threads 30 \
-f data/fasta/mia_ctdna_uniq_contigs_consensus.fa \
data/sam_bam/MIA_uniq_contigs_P20181-2.filtered.bam \
-O v \
-o data/consensus_fasta/MIA_uniq_contigs_P20181-2.vcf
# call the variants
bcftools call -c \
data/consensus_fasta/MIA_uniq_contigs_P20181-2.vcf > \
data/consensus_fasta/MIA_uniq_contigs_P20181-2_called.vcf

vcfutils.pl vcf2fq \
data/consensus_fasta/MIA_uniq_contigs_P20181-2_called.vcf > \
data/consensus_fasta/contigs_P20181-2_filtered_consensus.fastq
#from fastq to fasta 
/shared/seqtk/seqtk seq -aQ64 -q20 -n 0 \
data/consensus_fasta/contigs_P20181-2_filtered_consensus.fastq > \
data/consensus_fasta/contigs_P20181-2_filtered_consensus.fasta

####### P201810-2
bcftools mpileup  \
--threads 30 \
-f data/fasta/mia_ctdna_uniq_contigs_consensus.fa \
data/sam_bam/MIA_uniq_contigs_P201810-2.filtered.bam \
-O v \
-o data/consensus_fasta/MIA_uniq_contigs_P201810-2.vcf
# call the variants
bcftools call -c \
data/consensus_fasta/MIA_uniq_contigs_P201810-2.vcf > \
data/consensus_fasta/MIA_uniq_contigs_P201810-2_called.vcf

vcfutils.pl vcf2fq \
data/consensus_fasta/MIA_uniq_contigs_P201810-2_called.vcf > \
data/consensus_fasta/contigs_P201810-2_filtered_consensus.fastq
#from fastq to fasta 
/shared/seqtk/seqtk seq -aQ64 -q20 -n 0 \
data/consensus_fasta/contigs_P201810-2_filtered_consensus.fastq > \
data/consensus_fasta/contigs_P201810-2_filtered_consensus.fasta

####### P201812-2 
bcftools mpileup  \
--threads 30 \
-f data/fasta/mia_ctdna_uniq_contigs_consensus.fa \
data/sam_bam/MIA_uniq_contigs_P201812-2.filtered.bam \
-O v \
-o data/consensus_fasta/MIA_uniq_contigs_P201812-2.vcf
# call the variants
bcftools call -c \
data/consensus_fasta/MIA_uniq_contigs_P201812-2.vcf > \
data/consensus_fasta/MIA_uniq_contigs_P201812-2_called.vcf

vcfutils.pl vcf2fq \
data/consensus_fasta/MIA_uniq_contigs_P201812-2_called.vcf > \
data/consensus_fasta/contigs_P201812-2_filtered_consensus.fastq
#from fastq to fasta 
/shared/seqtk/seqtk seq -aQ64 -q20 -n 0 \
data/consensus_fasta/contigs_P201812-2_filtered_consensus.fastq > \
data/consensus_fasta/contigs_P201812-2_filtered_consensus.fasta

####### P201813-2 
bcftools mpileup  \
--threads 30 \
-f data/fasta/mia_ctdna_uniq_contigs_consensus.fa \
data/sam_bam/MIA_uniq_contigs_P201813-2.filtered.bam \
-O v \
-o data/consensus_fasta/MIA_uniq_contigs_P201813-2.vcf
# call the variants
bcftools call -c \
data/consensus_fasta/MIA_uniq_contigs_P201813-2.vcf > \
data/consensus_fasta/MIA_uniq_contigs_P201813-2_called.vcf

vcfutils.pl vcf2fq \
data/consensus_fasta/MIA_uniq_contigs_P201813-2_called.vcf > \
data/consensus_fasta/contigs_P201813-2_filtered_consensus.fastq
#from fastq to fasta 
/shared/seqtk/seqtk seq -aQ64 -q20 -n 0 \
data/consensus_fasta/contigs_P201813-2_filtered_consensus.fastq > \
data/consensus_fasta/contigs_P201813-2_filtered_consensus.fasta

####### P201814-2 
bcftools mpileup  \
--threads 30 \
-f data/fasta/mia_ctdna_uniq_contigs_consensus.fa \
data/sam_bam/MIA_uniq_contigs_P201814-2.filtered.bam \
-O v \
-o data/consensus_fasta/MIA_uniq_contigs_P201814-2.vcf
# call the variants
bcftools call -c \
data/consensus_fasta/MIA_uniq_contigs_P201814-2.vcf > \
data/consensus_fasta/MIA_uniq_contigs_P201814-2_called.vcf

vcfutils.pl vcf2fq \
data/consensus_fasta/MIA_uniq_contigs_P201814-2_called.vcf > \
data/consensus_fasta/contigs_P201814-2_filtered_consensus.fastq
#from fastq to fasta 
/shared/seqtk/seqtk seq -aQ64 -q20 -n 0 \
data/consensus_fasta/contigs_P201814-2_filtered_consensus.fastq > \
data/consensus_fasta/contigs_P201814-2_filtered_consensus.fasta


####### P201818-2
bcftools mpileup  \
--threads 30 \
-f data/fasta/mia_ctdna_uniq_contigs_consensus.fa \
data/sam_bam/MIA_uniq_contigs_P201818-2.filtered.bam \
-O v \
-o data/consensus_fasta/MIA_uniq_contigs_P201818-2.vcf
# call the variants
bcftools call -c \
data/consensus_fasta/MIA_uniq_contigs_P201818-2.vcf > \
data/consensus_fasta/MIA_uniq_contigs_P201818-2_called.vcf

vcfutils.pl vcf2fq \
data/consensus_fasta/MIA_uniq_contigs_P201818-2_called.vcf > \
data/consensus_fasta/contigs_P201818-2_filtered_consensus.fastq
#from fastq to fasta 
/shared/seqtk/seqtk seq -aQ64 -q20 -n 0 \
data/consensus_fasta/contigs_P201818-2_filtered_consensus.fastq > \
data/consensus_fasta/contigs_P201818-2_filtered_consensus.fasta



####### P201823-2 
bcftools mpileup  \
--threads 30 \
-f data/fasta/mia_ctdna_uniq_contigs_consensus.fa \
data/sam_bam/MIA_uniq_contigs_P201823-2.filtered.bam \
-O v \
-o data/consensus_fasta/MIA_uniq_contigs_P201823-2.vcf
# call the variants
bcftools call -c \
data/consensus_fasta/MIA_uniq_contigs_P201823-2.vcf > \
data/consensus_fasta/MIA_uniq_contigs_P201823-2_called.vcf

vcfutils.pl vcf2fq \
data/consensus_fasta/MIA_uniq_contigs_P201823-2_called.vcf > \
data/consensus_fasta/contigs_P201823-2_filtered_consensus.fastq
#from fastq to fasta 
/shared/seqtk/seqtk seq -aQ64 -q20 -n 0 \
data/consensus_fasta/contigs_P201823-2_filtered_consensus.fastq > \
data/consensus_fasta/contigs_P201823-2_filtered_consensus.fasta

####### P20183-2
bcftools mpileup  \
--threads 30 \
-f data/fasta/mia_ctdna_uniq_contigs_consensus.fa \
data/sam_bam/MIA_uniq_contigs_P20183-2.filtered.bam \
-O v \
-o data/consensus_fasta/MIA_uniq_contigs_P20183-2.vcf
# call the variants
bcftools call -c \
data/consensus_fasta/MIA_uniq_contigs_P20183-2.vcf > \
data/consensus_fasta/MIA_uniq_contigs_P20183-2_called.vcf

vcfutils.pl vcf2fq \
data/consensus_fasta/MIA_uniq_contigs_P20183-2_called.vcf > \
data/consensus_fasta/contigs_P20183-2_filtered_consensus.fastq
#from fastq to fasta 
/shared/seqtk/seqtk seq -aQ64 -q20 -n 0 \
data/consensus_fasta/contigs_P20183-2_filtered_consensus.fastq > \
data/consensus_fasta/contigs_P20183-2_filtered_consensus.fasta

####### P20187-2
bcftools mpileup  \
--threads 30 \
-f data/fasta/mia_ctdna_uniq_contigs_consensus.fa \
data/sam_bam/MIA_uniq_contigs_P20187-2.filtered.bam \
-O v \
-o data/consensus_fasta/MIA_uniq_contigs_P20187-2.vcf
# call the variants
bcftools call -c \
data/consensus_fasta/MIA_uniq_contigs_P20187-2.vcf > \
data/consensus_fasta/MIA_uniq_contigs_P20187-2_called.vcf

vcfutils.pl vcf2fq \
data/consensus_fasta/MIA_uniq_contigs_P20187-2_called.vcf > \
data/consensus_fasta/contigs_P20187-2_filtered_consensus.fastq
#from fastq to fasta 
/shared/seqtk/seqtk seq -aQ64 -q20 -n 0 \
data/consensus_fasta/contigs_P20187-2_filtered_consensus.fastq > \
data/consensus_fasta/contigs_P20187-2_filtered_consensus.fasta

####### P20189-2
bcftools mpileup  \
--threads 30 \
-f data/fasta/mia_ctdna_uniq_contigs_consensus.fa \
data/sam_bam/MIA_uniq_contigs_P20189-2.filtered.bam \
-O v \
-o data/consensus_fasta/MIA_uniq_contigs_P20189-2.vcf
# call the variants
bcftools call -c \
data/consensus_fasta/MIA_uniq_contigs_P20189-2.vcf > \
data/consensus_fasta/MIA_uniq_contigs_P20189-2_called.vcf

vcfutils.pl vcf2fq \
data/consensus_fasta/MIA_uniq_contigs_P20189-2_called.vcf > \
data/consensus_fasta/contigs_P20189-2_filtered_consensus.fastq
#from fastq to fasta 
/shared/seqtk/seqtk seq -aQ64 -q20 -n 0 \
data/consensus_fasta/contigs_P20189-2_filtered_consensus.fastq > \
data/consensus_fasta/contigs_P20189-2_filtered_consensus.fasta



