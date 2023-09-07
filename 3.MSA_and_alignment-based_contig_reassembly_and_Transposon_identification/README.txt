1.1.blast_ctdna_mia.sh
1.2.blast_ctdna_mm1s.sh
To define if the selected unique contigs are present in all samples, we have created a BLAST database for all samples and blasted the unique contigs against each database. The myeloma database consisted of contigs from 5 MM patients, for pancreatic cancer the database consisted of 10 PC patients.

!!!!Repeats should be moved here

2.define_top_insertions.R
Scrip performs:
	1. Import of pamir analyzed vcf files(Two matched, two mismatched, two cell lines) into R
	2. Filtering of vcf files via intersecting matched and mismatched samples with their cell lines
	3. Sorting filtered insertions by reads coverage supporting the insertion contig
	4. Taking top 1000 insertions and filtering with >= 100 length
	5. Wrting insertions into fasta files


3.RepeatMasker_for_top_insertions.sh
RepeatMasker was used to identify repeat for the filtered insertions

4.insertion_repeats_annotation.rmd
For each type of insertions mm1s&mia (MIA_match_filtered, MIA_mismatch_filtered, MIA_intersect, MM1S_match_filtered,MM1S_mismatch_filtered, MM1S_intersect ) the covarage is defined from vcf files. Then the insertion and transposone coverage is defined. 
 -partly_insertion - insertion and transposon are partly overlap
 -full_insertion - transposon is fully overlap with insertion (note - insertion is not fully overlap)
 
The insertion, consensuses and repeats are visualized with UGENE and manually annotated

5.mutation_identification_in_insertions
Mutations in TE sequences were identified by comparison of nucleotides at each position in the  sequence alignment with the “Biostrings” R package


6.1.MM1S_MSA.rmd
6.2.MIA MSA.rmd
we have selected the contigs, with alignment length >= 650bp and BLAST identity ≥90%. As a result, we have defined the unique contig sets, which were present in all samples belonging to one cancer type. In the next step, we have aligned contigs in all samples with the corresponding insertion and repeats (from RepeatMasker  library), using MAFFT

7.1.alignment_mia_uniq_contigs.sh
7.2.alignment_mm1s_uniq_contigs.sh
As the aligned contigs did not fully cover the whole full assembly contigs (772 and P201812-2), we have used consensus sequences, obtained in the previous step, as a reference to align fastq reads on it. 

8.1.mm1s_consensus_building.sh
8.1mia_consensus_building.sh
final consensus was obtained for each unique contig.