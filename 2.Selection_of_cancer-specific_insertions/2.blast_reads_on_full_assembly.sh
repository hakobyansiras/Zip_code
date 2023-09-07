################ BLAST analysis of the reads ################

#### creat blast bd for full assembly

# MM1s
echo "start blast bd creation 772_assembly_full"
	makeblastdb \
	-in /storage/insertion_detection_pamir/data/fasta/772_assembly_full-6_named.fa \
	-parse_seqids \
	-blastdb_version 5 \
	-title "772_assembly" \
	-dbtype nucl \
	-out data/assembly_blast/assembly_777
echo "finish blast bd creation 772_assembly_full"

# MIA
echo "start blast bd creation P201812-2_assembly_full"
makeblastdb \
-in /storage/insertion_detection_pamir/data/P201812-2_assembly_full-6_named.fa \
-parse_seqids \
-blastdb_version 5 \
-title "P201812-2_assembly" \
-dbtype nucl \
-out data/assembly_blast/P201812-2_assembly
echo "finish blast bd creation P201812-2_assembly_full"

##### perform blast 

######### MM1S sample  #########
#MM1S_matchet_with_ref_insertions.fa
echo "start blast MM1S_matchet_with_ref_insertions.fa"
blastn \
-query data/fasta/MM1S_cell_line_with_ref.fa \
-db /storage/insertion_detection_pamir/data/assembly_blast/assembly_777 \
-num_threads 10 \
-evalue 0.05 \
-outfmt 6 \
-sorthits 3 \
-html \
-out result/assembly_blast/MM1S_matchet_assembly_777_blast.txt
echo "finish blast MM1S_matchet_with_ref_insertions.fa"

## MM1S_cell_line_with_ref_insertion.fa
echo "start blast MM1S_cell_line_with_ref_insertion.fa"
blastn \
-query data/fasta/MM1S_cell_line_with_ref_insertion.fa \
-db /storage/insertion_detection_pamir/data/assembly_blast/assembly_777 \
-num_threads 10 \
-evalue 0.05 \
-outfmt 6 \
-sorthits 3 \
-html \
-out result/assembly_blast/MM1S_cell_line_assembly_777_blast.txt

echo "finish blast MM1S_cell_line_with_ref_insertion.fa"

# MM1S_mismatch_with_ref.fa
echo "start blast  MM1S_mismatch_with_ref.fa"
blastn \
-query data/fasta/MM1S_mismatch_with_ref.fa \
-db /storage/insertion_detection_pamir/data/assembly_blast/assembly_777 \
-num_threads 10 \
-evalue 0.05 \
-outfmt 6 \
-sorthits 3 \
-html \
-out result/assembly_blast/MM1S_mismatch_assembly_777_blast.txt
echo "finish blast  MM1S_mismatch_with_ref.fa"


########## MIA sample  #########
# MIA_matched_with_ref_insertion.fa
echo "start blast MIA_matched_with_ref_insertion.fa"
blastn \
-query data/MIA_matched_with_ref_insertion.fa \
-db /storage/insertion_detection_pamir/data/assembly_blast/P201812-2_assembly \
-num_threads 10 \
-evalue 0.05 \
-outfmt 6 \
-sorthits 3 \
-html \
-out result/assembly_blast/MIA_matched_P201812-2_blast.txt
echo "finish blast MIA_matched_with_ref_insertion.fa"

# MIA_cell_line_with_ref_insertion.fa
echo "start blast MIA_cell_line_with_ref_insertion.fa"
blastn \
-query data/MIA_cell_line_with_ref_insertion.fa \
-db /storage/insertion_detection_pamir/data/assembly_blast/P201812-2_assembly \
-num_threads 10 \
-evalue 0.05 \
-outfmt 6 \
-sorthits 3 \
-html \
-out result/assembly_blast/MIA_cell_line_P201812-2_blast.txt
echo "finish blast MIA_cell_line_with_ref_insertion.fa"

# MIA_mismatch_with_ref.fa
echo "start blast MIA_mismatch_with_ref.fa"
blastn \
-query data/MIA_mismatch_with_ref.fa \
-db /storage/insertion_detection_pamir/data/assembly_blast/P201812-2_assembly \
-num_threads 10 \
-evalue 0.05 \
-outfmt 6 \
-sorthits 3 \
-html \
-out result/assembly_blast/MIA_mismatch_P201812-2_blast.txt
echo "finish blast MIA_mismatch_with_ref.fa"


