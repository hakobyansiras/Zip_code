1.Detection of de novo insertions in cell line samples
All cell line samples were aligned to the human reference genome(hg38) with bwa-mem software (v 0.7.17). After the alignment step de novo insertions detection was performed with the Pamir too

2.Selection of cancer-specific insertions
To select cancer type-specific inserts, full-length contigs were converted to BLAST databases. Next insertions identified in the match-, mismatch- and no-culture samples for corresponding cell line samples (MM1S or MIA) were blasted against the corresponding sample full-length assembly contig database (772 for MM1S cells and P201812-2 for MIA cells).

3.MSA and alignment-based contig reassembly and Transposon identification
To define if the selected unique contigs are present in all samples, we have created a BLAST database for all samples and blasted the unique contigs against each database. The myeloma database consisted of contigs from 5 MM patients, for pancreatic cancer the database consisted of 10 PC patients. Unique contigs from each cancer type were blasted against the corresponding database. Then, we have selected the contigs, with alignment length >= 650bp and BLAST identity ≥90%. As the aligned contigs did not fully cover the whole full assembly contigs (772 and P201812-2), we have used consensus sequences, obtained in the previous step, as a reference to align fastq reads on it. The alignment was performed with the bwa-mem algorithm

4.transcriptional_element_alignment
Single-end RNA-seq data for MM (n=60) and PC (n=22) samples were processed with the STAR aligner and TE transcripts pipeline. Mutation in TE transcripts were defined by  comparison of nucleotides at each position in the  sequence alignment with the “Biostrings” R package/.
