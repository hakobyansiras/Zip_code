awk ' NR > 17 {print ">"$3"\n"$5}' data/vcf/MIA_cell_line_with_ref.vcf > data/fasta/MIA_cell_line_with_ref.fa

awk ' NR > 17 {print ">"$3"\n"$5}' data/vcf/MIA_matched_with_ref.vcf > data/fasta/MIA_matched_with_ref.fa

awk ' NR > 17 {print ">"$3"\n"$5}' data/vcf/MIA_mismatch_with_ref.vcf > data/fasta/MIA_mismatch_with_ref.fa

awk ' NR > 17 {print ">"$3"\n"$5}' data/vcf/MM1S_cell_line_with_ref.vcf > data/fasta/MM1S_cell_line_with_ref.fa

awk ' NR > 17 {print ">"$3"\n"$5}' data/vcf/MM1S_matchet_with_ref.vcf > data/fasta/MM1S_matchet_with_ref.fa

awk ' NR > 17 {print ">"$3"\n"$5}' data/vcf/MM1S_mismatch_with_ref.vcf > data/fasta/MM1S_mismatch_with_ref.fa