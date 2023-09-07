/home/ubuntu/RepeatMasker/RepeatMasker \
/storage/insertion_detection_pamir/data/ctDNA_consensus/mm1s_ctdna_uniq_contigs_consensus.fa \
-species human \
-no_is \
-dir data/alignment_contigs/mm1s_uniq_contigs_repeat_mask -a -small -gff -u

#copy repeat masker file
 head /home/ubuntu/RepeatMasker/Libraries/RepeatMasker.lib
awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' /home/ubuntu/RepeatMasker/Libraries/RepeatMasker.lib > /storage/insertion_detection_pamir/result/mm1s_uniq_contigs_repeat_mask_sequences/RepeatMasker.fa

/home/ubuntu/RepeatMasker/RepeatMasker \
data/alignment_contigs/aligned_unique_contigs_adjustdir_insertion_ctdna/contige_10_772.1730583_ins_ctdna_cons_mafft_aln.fa \
-dir data/alignment_contigs/repeat_mask/contige_10_772.1730583_ins_ctdna_cons_mafft_aln > log/contige_10_772.1730583_ins_ctdna_cons_mafft_aln.log


