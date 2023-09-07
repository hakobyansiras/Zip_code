### prepate data for blast, 
#from P201812-2_assembly_full-6_named.fa select contigs which are in MIA_match_unique_contigs.txt file (MIA match minus MIA cell line and MIA mismatch)
grep -w -A1 -f result/assembly_blast/MIA_match_unique_contigs.txt data/fasta/P201812-2_assembly_full-6_named.fa > data/fasta/MIA_match_unique_contigs_P201812_2_assembly.fa
awk '!/^(--)/'  data/fasta/MIA_match_unique_contigs_P201812_2_assembly.fa > data/fasta/MIA_match_unique_contigs_P201812_2_assembly_1.fa
mv data/fasta/MIA_match_unique_contigs_P201812_2_assembly_1.fa data/fasta/MIA_match_unique_contigs_P201812_2_assembly.fa 

######################################################################################
################################### creat blast db and perform BALST #################
######################################################################################

filename="$1"
while read -r line; do
        # read files
        name="$line"
        echo "Name read from file - $name"
		
		echo "start creating blast db for $name"
		makeblastdb \
		-in /storage/insertion_detection_pamir/data/fasta/$name'_assembly-6_named.fa' \
		-parse_seqids \
		-blastdb_version 5 \
		-title "assembly_$name" \
		-dbtype nucl \
		-out data/assembly_blast/assembly_$name
		
		echo "start blast for $name"
		blastn \
		-query data/fasta/MIA_match_unique_contigs_P201812_2_assembly.fa  \
		-db /storage/insertion_detection_pamir/data/assembly_blast/assembly_$name \
		-num_threads 30 \
		-evalue 0.05 \
		-outfmt 6 \
		-sorthits 3 \
		-html \
		-out result/assembly_blast/MIA_matchet_assembly_blast_$name.txt
		echo "finished blast for $name"

done < "$filename"





