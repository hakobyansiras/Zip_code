1.converting_pamir_vcf_to_fasta.sh
To perform downstream analysis, the sequences corresponding to the insertions should be converted into FASTA format.

2.blast_reads_on_full_assembly.sh
To select cancer type-specific inserts, full-length contigs were converted to BLAST databases. Next insertions identified in the match-, mismatch- and no-culture samples for corresponding cell line samples (MM1S or MIA) were blasted against the corresponding sample full-length assembly contig database (772 for MM1S cells and P201812-2 for MIA cells).

3.define_specific_insertions.Rmd
Define cancer-specific insertions for MM1S and MIA. An insert was considered cancer-specific if: 
	1) it was present in the matching co-culture sample, but not in mismatch co-culture and no-culture samples; 
	2) it was aligned to the corresponding ct-DNA sample database with identity at least 70% (to maximize hits for further processing).
		
