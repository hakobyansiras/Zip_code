BEGIN{
	FS = "\t"; OFS = "\t";
	nuc_name_and_col_pos["A"] = 5;
	nuc_name_and_col_pos["C"] = 6;
	nuc_name_and_col_pos["G"] = 7;
	nuc_name_and_col_pos["T"] = 8
}
FNR==NR{
	transposon_name = FILENAME; gsub("_merged.tsv", "", transposon_name);
	if($1 != "ID") {
		coord[$1":"$2]=$3"\t"$4
	};
	next
}
FNR==1{
	file_colname = FILENAME;
	gsub("_mergedAligned_fullAligned.out_sorted_mut_counts_by_nucs.tsv", "", file_colname);
	print file_colname"_1", file_colname"_2", file_colname"_3", file_colname"_4"
}
{
	if(coord[$1":"$2]) {
		split(coord[$1":"$2], nucs, "\t"); id_1 = nuc_name_and_col_pos[toupper(nucs[1])]; id_2 = nuc_name_and_col_pos[toupper(nucs[2])];
		printf $id_1"\t"$id_2"\t";
		last_col_num = 0
		for(i in nuc_name_and_col_pos) {
			for(j in nucs) {
				if(i != j) {if(last_col_num < 2) {printf $nuc_name_and_col_pos[i]"\t"} else {printf $nuc_name_and_col_pos[i]"\n"}; last_col_num++}
			}
		}
	} else {
		print "A:0""\t""C:0""\t""G:0""\t""T:0"
	}
}
