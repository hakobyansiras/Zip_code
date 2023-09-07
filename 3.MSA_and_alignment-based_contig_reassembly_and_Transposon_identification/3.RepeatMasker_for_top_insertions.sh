# input of the data FASTA files with all insertion sequences, which are specific to each cell type
# Repeat Mask
echo "RepeatMarsk start"
filename="$1"
while read -r line; do
        # read files
        name="$line"
        echo "Name read from file - $name"
		/storage2/proj/kodikaz_project/programs/RepeatMasker/RepeatMasker \
		/storage2/proj/kodikaz_project/data/top_insertions/$line \
		-species human \
		-no_is \
		-dir /storage2/proj/kodikaz_project/result/insertion_repeatmasker \
		-a 
        echo "finished RepeatMask for $name"

done < "$filename"

echo "RepeatMarsk fincish"

