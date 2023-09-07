### prepate data for blast, 
# from 772_assembly_full-contigs.fa select contigs which are in MM1A_match_unique_contigs.txt file (MM1S match minus MM1S cell line and MM1S mismatch)

grep -w -A 1 -f result/assembly_blast/MM1S_match_unique_contigs.txt data/fasta/772_assembly_full-6_named.fa > data/fasta/MM1S_match_unique_contigs_772_assembly.fa
awk '!/^(--)/'  data/fasta/MM1S_match_unique_contigs_772_assembly.fa > data/fasta/MM1S_match_unique_contigs_772_assembly_1.fa
mv data/fasta/MM1S_match_unique_contigs_772_assembly_1.fa data/fasta/MM1S_match_unique_contigs_772_assembly.fa 

######################################################################################
################################### creat blast db and perform BLAST ################
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
		-query data/fasta/MM1S_match_unique_contigs_P201812_2_assembly.fa  \
		-db /storage/insertion_detection_pamir/data/assembly_blast/assembly_$name \
		-num_threads 30 \
		-evalue 0.05 \
		-outfmt 6 \
		-sorthits 3 \
		-html \
		-out result/assembly_blast/MM1S_matchet_assembly_blast_$name.txt
		echo "finished blast for $name"

done < "$filename"





