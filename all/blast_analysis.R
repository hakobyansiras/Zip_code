library(biomaRt)

setwd("/storage/insertion_detection_pamir")

### calculate vcf stat
mia_match_vcf <- read.table("data/MIA_matched_with_ref.vcf", as.is = T)
mm1s_match_vcf <- read.table("data/MM1S_matchet_with_ref.vcf", as.is = T)

mia_mismatch_vcf <- read.table("data/MIA_mismatch_with_ref.vcf", as.is = T)
mm1s_mismatch_vcf <- read.table("data/MM1S_mismatch_with_ref.vcf", as.is = T)

mia_cell_vcf <- read.table("data/MIA_cell_line_with_ref.vcf", as.is = T )
mm1s_cell_vcf <- read.table("data/MM1S_cell_line_with_ref.vcf", as.is = T )

#
colnames(mia_match_vcf) <- c("CHROM",  "POS",     "ID",      "REF",     "ALT",     "QUAL",    "FILTER",  "INFO",    "FORMAT",   "GENOTYPE")
colnames(mm1s_match_vcf) <- c("CHROM",  "POS",     "ID",      "REF",     "ALT",     "QUAL",    "FILTER",  "INFO",    "FORMAT",   "GENOTYPE")

colnames(mia_mismatch_vcf) <- c("CHROM",  "POS",     "ID",      "REF",     "ALT",     "QUAL",    "FILTER",  "INFO",    "FORMAT",   "GENOTYPE")
colnames(mm1s_mismatch_vcf) <- c("CHROM",  "POS",     "ID",      "REF",     "ALT",     "QUAL",    "FILTER",  "INFO",    "FORMAT",   "GENOTYPE")

colnames(mia_cell_vcf) <- c("CHROM",  "POS",     "ID",      "REF",     "ALT",     "QUAL",    "FILTER",  "INFO",    "FORMAT",   "GENOTYPE")
colnames(mm1s_cell_vcf) <- c("CHROM",  "POS",     "ID",      "REF",     "ALT",     "QUAL",    "FILTER",  "INFO",    "FORMAT",   "GENOTYPE")

# add length of the insertions
mia_match_vcf$ins_length <- sapply(mia_match_vcf$ALT, nchar)
mm1s_match_vcf$ins_length <- sapply(mm1s_match_vcf$ALT, nchar)

mia_mismatch_vcf$ins_length <- sapply(mia_mismatch_vcf$ALT, nchar)
mm1s_mismatch_vcf$ins_length <- sapply(mm1s_mismatch_vcf$ALT, nchar)

mia_cell_vcf$ins_length <- sapply(mia_cell_vcf$ALT, nchar)
mm1s_cell_vcf$ins_length <- sapply(mm1s_cell_vcf$ALT, nchar)

# insertion_stat <- data.frame(sample = c("mm1s_match", "mm1s_mismatch","mm1s_cell",
#                                         "mia_match", "mia_mismatch","mia_cell"),
#                              insertion_length = c(nrow(mm1s_match_vcf)))

nrow(mm1s_match_vcf)
nrow(mm1s_mismatch_vcf)
nrow(mm1s_cell_vcf)

nrow(mia_match_vcf)
nrow(mia_mismatch_vcf)
nrow(mia_cell_vcf)
###
range(mm1s_match_vcf$ins_length)
range(mm1s_mismatch_vcf$ins_length)
range(mm1s_cell_vcf$ins_length)

range(mia_match_vcf$ins_length)
range(mia_mismatch_vcf$ins_length)
range(mia_cell_vcf$ins_length)

## boxplot for insertion length
combined_ins_length <- data.frame(alignment_length = NA,
                                  group = NA)
combined_ins_length <- rbind(combined_ins_length, data.frame(alignment_length =mm1s_match_vcf$ins_length,
                                                             group = "mm1s_match"))
combined_ins_length <- rbind(combined_ins_length, data.frame(alignment_length =mm1s_cell_vcf$ins_length,
                                                             group = "mm1s_cell_line"))
combined_ins_length <- rbind(combined_ins_length, data.frame(alignment_length =mia_match_vcf$ins_length,
                                                             group = "mia_match"))
combined_ins_length <- rbind(combined_ins_length, data.frame(alignment_length =mia_cell_vcf$ins_length,
                                                             group = "mia_cell_line"))
combined_ins_length <- rbind(combined_ins_length, data.frame(alignment_length =mm1s_mismatch_vcf$ins_length,
                                                             group = "mm1s_mismatch"))
combined_ins_length <- rbind(combined_ins_length, data.frame(alignment_length =mia_mismatch_vcf$ins_length,
                                                             group = "mia_mismatch"))
combined_ins_length <- na.omit(combined_ins_length)

boxplot(combined_ins_length$alignment_length ~ combined_ins_length$group, main = "Insertion length",
        xlab = "group", ylab = "Insertion length")

#########BALST############
mm1s_match <- read.table("result/assembly_blast/MM1S_matchet_assembly_777_blast.txt")
mia_match <- read.table("result/assembly_blast/MIA_matched_P201812-2_blast.txt")

mm1s_mismatch <- read.table("result/assembly_blast/MM1S_mismatch_P201812-2_blast.txt")
mia_mismatch <- read.table("result/assembly_blast/MIA_mismatch_assembly_777_blast.txt")

mm1s_cell_line <- read.table("result/assembly_blast/MM1S_cell_line_assembly_777_blast.txt")
mia_cell_line <- read.table("result/assembly_blast/MIA_cell_line_P201812-2_blast.txt")

colnames(mm1s_match) <- c("query", "subject", "%_identity", "alignment_length", "mismatches", "gap_opens",
                          "q_start", "q_end", "s_start", "s_end", "evalue", "bit_score")
colnames(mia_match) <- c("query", "subject", "%_identity", "alignment_length", "mismatches", "gap_opens",
                          "q_start", "q_end", "s_start", "s_end", "evalue", "bit_score")

colnames(mm1s_cell_line) <- c("query", "subject", "%_identity", "alignment_length", "mismatches", "gap_opens",
                         "q_start", "q_end", "s_start", "s_end", "evalue", "bit_score")

colnames(mia_cell_line) <- c("query", "subject", "%_identity", "alignment_length", "mismatches", "gap_opens",
                         "q_start", "q_end", "s_start", "s_end", "evalue", "bit_score")
colnames(mm1s_mismatch) <- c("query", "subject", "%_identity", "alignment_length", "mismatches", "gap_opens",
                             "q_start", "q_end", "s_start", "s_end", "evalue", "bit_score")
colnames(mia_mismatch) <- c("query", "subject", "%_identity", "alignment_length", "mismatches", "gap_opens",
                             "q_start", "q_end", "s_start", "s_end", "evalue", "bit_score")

####
length(unique(mm1s_match$query))
length(unique(mm1s_mismatch$query))
length(unique(mm1s_cell_line$query))

length(unique(mia_match$query))
length(unique(mia_mismatch$query))
length(unique(mia_cell_line$query))


mm1s_match$subject <- as.character(mm1s_match$subject)
mm1s_mismatch$subject <- as.character(mm1s_mismatch$subject)
mm1s_cell_line$subject <- as.character(mm1s_cell_line$subject)

mia_match$subject <- as.character(mia_match$subject)
mia_mismatch$subject <- as.character(mia_mismatch$subject)
mia_cell_line$subject <- as.character(mia_cell_line$subject)


combined_aln_length <- data.frame(alignment_length = NA,
                                  group = NA)
combined_aln_length <- rbind(combined_aln_length, data.frame(alignment_length =mm1s_match$alignment_length,
                                                             group = "mm1s_match"))
combined_aln_length <- rbind(combined_aln_length, data.frame(alignment_length =mm1s_cell_line$alignment_length,
                                                             group = "mm1s_cell_line"))
combined_aln_length <- rbind(combined_aln_length, data.frame(alignment_length =mia_match$alignment_length,
                                                             group = "mia_match"))
combined_aln_length <- rbind(combined_aln_length, data.frame(alignment_length =mia_cell_line$alignment_length,
                                                             group = "mia_cell_line"))
combined_aln_length <- rbind(combined_aln_length, data.frame(alignment_length =mm1s_mismatch$alignment_length,
                                                             group = "mm1s_mismatch"))
combined_aln_length <- rbind(combined_aln_length, data.frame(alignment_length =mia_mismatch$alignment_length,
                                                             group = "mia_mismatch"))
combined_aln_length <- na.omit(combined_aln_length)

boxplot(combined_aln_length$alignment_length ~ combined_aln_length$group, main = "Alignment length",
        xlab = "group", ylab = "Alignment length")


## define uniqe hits for mm1s_match compared with mm1s cell line

mm1s_match_uniq <- mm1s_match[-which(mm1s_match$subject %in% intersect(mm1s_match$subject, mm1s_cell_line$subject)),]
hist(mm1s_match_uniq$alignment_length, main = "mm1s_match unique hits", xlab = "Alignment length")

## define uniqe hits for mm1s_match compared with mia cell line
mia_match_uniq <- mia_match[-which(mia_match$subject %in% intersect(mia_match$subject, mia_cell_line$subject)),]
hist(mia_match_uniq$alignment_length, main = "mia_match unique hits", xlab = "Alignment length")

## define uniqe hits for mm1s_mismatch compared with  mm1s cell line

mm1s_mismatch_uniq <- mm1s_mismatch[-which(mm1s_mismatch$subject %in% intersect(mm1s_mismatch$subject, mm1s_cell_line$subject)),]
hist(mm1s_mismatch_uniq$alignment_length, main = "mm1s_mismatch unique hits", xlab = "Alignment length")

## define uniqe hits for mia_mismatch compared with  mia cell line
mia_mismatch_uniq <- mia_mismatch[-which(mia_mismatch$subject %in% intersect(mia_mismatch$subject, mia_cell_line$subject)),]
hist(mia_mismatch_uniq$alignment_length, main = "mia_mismatch unique hits", xlab = "Alignment length")


## compare unique mm1S match with unique mia mismatch
# mm1s_match_mia_mismatch_uniq <- mm1s_match_uniq[which(mm1s_match_uniq$subject %in% intersect(mm1s_match_uniq$subject, mia_mismatch_uniq$subject)),]
# 
# ## compare unique mia match with unique mm1s mismatch
# mia_match_mm1s_mismatch_uniq <- mia_match_uniq[which(mia_match_uniq$subject %in% intersect(mia_match_uniq$subject, mm1s_mismatch_uniq$subject)),]


## compare unique mm1S match with mm1s mismatch, define mm1S match unique
mm1s_match_mm1s_mismatch_uniq <- mm1s_match_uniq[-which(mm1s_match_uniq$subject %in% intersect(mm1s_match_uniq$subject, mm1s_mismatch$subject)),]

## compare unique mia match with mia mismatch, define mia match unique
mia_match_mia_mismatch_uniq <- mia_match_uniq[-which(mia_match_uniq$subject %in% intersect(mia_match_uniq$subject, mia_mismatch$subject)),]


length(mia_match_mia_mismatch_uniq$subject)
length(unique(mm1s_match_mm1s_mismatch_uniq$subject))


length(mia_match_mia_mismatch_uniq$subject[mia_match_mia_mismatch_uniq$`%_identity` == 100 ])
length(unique(mia_match_mia_mismatch_uniq$subject[mia_match_mia_mismatch_uniq$`%_identity` == 100]))

summary(mm1s_match_mm1s_mismatch_uniq$alignment_length)
summary(mia_match_mia_mismatch_uniq$alignment_length)

############ barcode analysis  ####################

# mm1a sample (uniq samples), mm1s_match_uniq
mm1s_match_vcf <- read.table("data/MM1S_matchet_with_ref.vcf", as.is = T)
colnames(mm1s_match_vcf) <- c("CHROM",  "POS",     "ID",      "REF",     "ALT",     "QUAL",    "FILTER",  "INFO",    "FORMAT",   "GENOTYPE")
#mm1s_match_vcf <- mm1s_match_vcf[which(mm1s_match_vcf$ID %in% mm1s_match_mia_mismatch_uniq$query[which(mm1s_match_mia_mismatch_uniq$alignment_length >= 200)]),]
mm1s_match_vcf <- mm1s_match_vcf[which(mm1s_match_vcf$ID %in% mm1s_match_mm1s_mismatch_uniq$query[which(mm1s_match_mm1s_mismatch_uniq$alignment_length >= 200)]),]
#mm1s_match_vcf <- mm1s_match_vcf[which(mm1s_match_vcf$ID %in% mm1s_match_uniq$query[which(mm1s_match_uniq$alignment_length >= 200)]),]

# mia sample (uniq samples), mia_match_uniq
mia_match_vcf <- read.table("data/MIA_matched_with_ref.vcf", as.is = T)
colnames(mia_match_vcf) <- c("CHROM",  "POS",     "ID",      "REF",     "ALT",     "QUAL",    "FILTER",  "INFO",    "FORMAT",   "GENOTYPE")
#mia_match_vcf <- mia_match_vcf[which(mia_match_vcf$ID %in% mia_match_uniq$query[which(mia_match_uniq$alignment_length >= 200)]),]
mia_match_vcf <- mia_match_vcf[which(mia_match_vcf$ID %in% mia_match_mia_mismatch_uniq$query[which(mia_match_mia_mismatch_uniq$alignment_length >= 200)]),]
#mia_match_vcf <- mia_match_vcf[which(mia_match_vcf$ID %in% mia_match_mm1s_mismatch_uniq$query[which(mia_match_mm1s_mismatch_uniq$alignment_length >= 200)]),]


barcode_1 <- c("GCGCTCTGTGTGCT") #14 chars 
barcode_2 <- c("AGCACACAGAGCGC")

#kmers 10
barcode_1_10kmers <- c(substr(barcode_1, start = 1, stop = 10),
                       substr(barcode_1, start = 2, stop = 11),
                       substr(barcode_1, start = 3, stop = 12),
                       substr(barcode_1, start = 4, stop = 13),
                       substr(barcode_1, start = 5, stop = 14))

barcode_2_10kmers <- c(substr(barcode_2, start = 1, stop = 10),
                       substr(barcode_2, start = 2, stop = 11),
                       substr(barcode_2, start = 3, stop = 12),
                       substr(barcode_2, start = 4, stop = 13),
                       substr(barcode_2, start = 5, stop = 14))
#mm1s
ind_barcodes <- c()
for (i in 1:length(barcode_1_10kmers)) 
  {
  ind_barcodes <- c(ind_barcodes, grep(barcode_1_10kmers[i], mm1s_match_vcf$ALT))
  ind_barcodes <- c(ind_barcodes, grep(barcode_2_10kmers[i], mm1s_match_vcf$ALT))
}
mm1s_match_vcf_barcode <- mm1s_match_vcf[ind_barcodes,]



#kmers 9
barcode_1_9kmers <- c(substr(barcode_1, start = 1, stop = 9),
                       substr(barcode_1, start = 2, stop = 10),
                       substr(barcode_1, start = 3, stop = 11),
                       substr(barcode_1, start = 4, stop = 12),
                       substr(barcode_1, start = 5, stop = 13),
                       substr(barcode_1, start = 6, stop = 14))

barcode_2_9kmers <- c(substr(barcode_2, start = 1, stop = 9),
                      substr(barcode_2, start = 2, stop = 10),
                      substr(barcode_2, start = 3, stop = 11),
                      substr(barcode_2, start = 4, stop = 12),
                      substr(barcode_2, start = 5, stop = 13),
                      substr(barcode_2, start = 6, stop = 14))

#mm1s
ind_barcodes <- c()
for (i in 1:length(barcode_2_9kmers)) 
{
  ind_barcodes <- c(ind_barcodes, grep(barcode_1_9kmers[i], mm1s_match_vcf$ALT))
  ind_barcodes <- c(ind_barcodes, grep(barcode_2_9kmers[i], mm1s_match_vcf$ALT))
}
mm1s_match_vcf_barcode_1 <- mm1s_match_vcf[unique(ind_barcodes),]



#mia 10kmers
ind_barcodes <- c()
for (i in 1:length(barcode_1_10kmers)) 
{
  ind_barcodes <- c(ind_barcodes, grep(barcode_1_10kmers[i], mia_match_vcf$ALT))
  ind_barcodes <- c(ind_barcodes, grep(barcode_2_10kmers[i], mia_match_vcf$ALT))
}
mia_match_vcf_barcode <- mia_match_vcf[ind_barcodes,]  

#mia 9 kmers
ind_barcodes <- c()
for (i in 1:length(barcode_2_9kmers)) 
{
  ind_barcodes <- c(ind_barcodes, grep(barcode_1_9kmers[i], mia_match_vcf$ALT))
  ind_barcodes <- c(ind_barcodes, grep(barcode_2_9kmers[i], mia_match_vcf$ALT))
}
mia_match_vcf_barcode_1 <- mia_match_vcf[unique(ind_barcodes),]


################### gene report #############################
#genes <- read.table("data/hg48_genes.bed")
# save vcf files as bed
#mm1s
mm1s_match_vcf <- read.table("data/MM1S_matchet_with_ref.vcf", as.is = T)
colnames(mm1s_match_vcf) <- c("CHROM",  "POS",     "ID",      "REF",     "ALT",     "QUAL",    "FILTER",  "INFO",    "FORMAT",   "GENOTYPE")
mm1s_match_vcf <- mm1s_match_vcf[which(mm1s_match_vcf$ID %in% mm1s_match_mm1s_mismatch_uniq$query),]

mm1s_match_bed <- data.frame(chr = mm1s_match_vcf$CHROM,
                             start = mm1s_match_vcf$POS,
                             end = mm1s_match_vcf$POS,
                             id = mm1s_match_vcf$ID)
write.table(mm1s_match_bed, "data/MM1S_matchet_minus_MM1S_cell.bed", sep = "\t",quote = F, col.names = F, row.names = F)
system("bedtools intersect -a data/hg48_genes.bed -b data/MM1S_matchet_minus_MM1S_cell.bed > data/MM1S_matchet_minus_MM1S_cell_genes.bed")

#mia
mia_match_vcf <- read.table("data/MIA_matched_with_ref.vcf", as.is = T)
colnames(mia_match_vcf) <- c("CHROM",  "POS",     "ID",      "REF",     "ALT",     "QUAL",    "FILTER",  "INFO",    "FORMAT",   "GENOTYPE")
mia_match_vcf <- mia_match_vcf[which(mia_match_vcf$ID %in% mia_match_mia_mismatch_uniq$query),]

mia_match_bed <- data.frame(chr = mia_match_vcf$CHROM,
                             start = mia_match_vcf$POS,
                             end = mia_match_vcf$POS,
                             id = mia_match_vcf$ID)
write.table(mia_match_bed, "data/MIA_matchet_minus_MIA_cell.bed", sep = "\t",quote = F, col.names = F, row.names = F)
system("bedtools intersect -a data/hg48_genes.bed -b data/MIA_matchet_minus_MIA_cell.bed > data/MIA_matchet_minus_MIA_cell_genes.bed")


