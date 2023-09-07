
mm1s_trans_muts <- lapply(list.files("/storage2/proj/kodikaz/insertion_detection_pamir/result/files_for_siras/mm1s_mutations/joined_tables/", full.names = T)[grep("_merged.tsv", list.files("/storage2/proj/kodikaz/insertion_detection_pamir/result/files_for_siras/mm1s_mutations/joined_tables/", full.names = T))], function(x) {
  
  trans_table <- fread(x, fill = T, data.table = F)
  
  if(ncol(trans_table) == 14){
    trans_table[,13] <- paste0(trans_table[,13], "_", trans_table[,14])
    trans_table <- trans_table[,-14]
  }
  
  trans_table <- trans_table[,c(1, 2, 6, 13, 3, 4)]
  
  colnames(trans_table) <- c("ID", "position_in_alignment", "position_in_transposon", "direction", "nucleotide_in_contig", "nucleotide_in_repeat")
  
  trans_table$id_pos <- paste0(trans_table$ID, "_", trans_table$position_in_alignment)
  
  rownames(trans_table) <- trans_table$id_pos
  
  trans_table
})

names(mm1s_trans_muts) <- gsub("_merged.tsv", "", list.files("/storage2/proj/kodikaz/insertion_detection_pamir/result/files_for_siras/mm1s_mutations/joined_tables/")[grep("_merged.tsv", list.files("/storage2/proj/kodikaz/insertion_detection_pamir/result/files_for_siras/mm1s_mutations/joined_tables/"))])

  
mm1s_trans_mut_counts <- lapply(list.files("/storage2/proj/kodikaz/insertion_detection_pamir/result/te_aluy_alignment_full/nucleotide_counts_per_sample", full.names = T), function(x) {
  
  mut_counts <- fread(file = x, sep = "\t", stringsAsFactors = F, data.table = F)
  
  mut_counts$id_pos <- paste0(mut_counts$chr, "_", mut_counts$position)
  
  rownames(mut_counts) <- mut_counts$id_pos
  
  mut_counts
  
})

names(mm1s_trans_mut_counts) <- gsub("_mergedAligned_fullAligned.out_sorted_mut_counts_by_nucs.tsv", "", list.files("/storage2/proj/kodikaz/insertion_detection_pamir/result/te_aluy_alignment_full/nucleotide_counts_per_sample"))


count_transformer <- function(mm1s_trans_muts, mm1s_trans_mut_counts, folder) {
  lapply(names(mm1s_trans_muts), function(x) {
    
    combined_samles <- lapply(names(mm1s_trans_mut_counts), function(y) {
      
      sample_trans_nuc_count <- t(sapply(rownames(mm1s_trans_muts[[x]]), function(z) {
        if(z %in% rownames(mm1s_trans_mut_counts[[y]])) {
          nuc_1 <- paste0(toupper(mm1s_trans_muts[[x]][z,"nucleotide_in_contig"]), ":count")
          nuc_2 <- paste0(toupper(mm1s_trans_muts[[x]][z,"nucleotide_in_repeat"]), ":count")
          
          rest_nucs <- paste0(setdiff(c("A", "T", "G", "C"), unique(c(toupper(mm1s_trans_muts[[x]][z,"nucleotide_in_contig"]), toupper(mm1s_trans_muts[[x]][z,"nucleotide_in_repeat"])))), ":count")
          
          mm1s_trans_mut_counts[[y]][z,c(nuc_1, nuc_2, rest_nucs)]
        } else {
          c("A:0", "C:0", "G:0", "T:0")
        }
      }))
      
      colnames(sample_trans_nuc_count) <- paste0(y, "_", 1:4)
      sample_trans_nuc_count
      
    })
    
    combined_samples_data <- cbind(mm1s_trans_muts[[x]][ ,c("ID", "position_in_alignment", "position_in_transposon", "direction", "nucleotide_in_contig", "nucleotide_in_repeat")], Reduce(cbind, combined_samles))
    
    combined_samples_data <- apply(combined_samples_data,2,as.character)
    
    write.table(combined_samples_data, file = paste0(folder, x, "_by_samples_counts.tsv"), sep = "\t", row.names = F, quote = F)
  })
}

count_transformer(mm1s_trans_muts = mm1s_trans_muts, mm1s_trans_mut_counts = mm1s_trans_mut_counts, folder = "/storage2/proj/kodikaz/insertion_detection_pamir/result/files_for_siras/mm1s_tables/")




### mia processing

mia_trans_muts <- lapply(list.files("/storage2/proj/kodikaz/insertion_detection_pamir/result/files_for_siras/mia_mutations/joined_tables", full.names = T)[grep("_merged.tsv", list.files("/storage2/proj/kodikaz/insertion_detection_pamir/result/files_for_siras/mia_mutations/joined_tables", full.names = T))], function(x) {
  
  trans_table <- fread(x, fill = T, data.table = F)
  
  if(ncol(trans_table) == 14){
    trans_table[,13] <- paste0(trans_table[,13], "_", trans_table[,14])
    trans_table <- trans_table[,-14]
  }
  
  trans_table <- trans_table[,c(1, 2, 6, 13, 3, 4)]
  
  colnames(trans_table) <- c("ID", "position_in_alignment", "position_in_transposon", "direction", "nucleotide_in_contig", "nucleotide_in_repeat")
  
  trans_table$id_pos <- paste0(trans_table$ID, "_", trans_table$position_in_alignment)
  
  rownames(trans_table) <- trans_table$id_pos
  
  trans_table
})

names(mia_trans_muts) <- gsub("_merged.tsv", "", list.files("/storage2/proj/kodikaz/insertion_detection_pamir/result/files_for_siras/mia_mutations/joined_tables")[grep("_merged.tsv", list.files("/storage2/proj/kodikaz/insertion_detection_pamir/result/files_for_siras/mia_mutations/joined_tables"))])


mia_trans_mut_counts <- lapply(list.files("/storage2/proj/kodikaz/insertion_detection_pamir/result/mia_te_alignment/nucleotide_counts_per_sample", full.names = T), function(x) {
  
  mut_counts <- fread(file = x, sep = "\t", stringsAsFactors = F, data.table = F)
  
  mut_counts$id_pos <- paste0(mut_counts$chr, "_", mut_counts$position)
  
  rownames(mut_counts) <- mut_counts$id_pos
  
  mut_counts
  
})

names(mia_trans_mut_counts) <- gsub("_PDAC_TUM_T_RSQ1_fullAligned.out_sorted_mut_counts_by_nucs.tsv", "", list.files("/storage2/proj/kodikaz/insertion_detection_pamir/result/mia_te_alignment/nucleotide_counts_per_sample"))


count_transformer(mm1s_trans_muts = mia_trans_muts, mm1s_trans_mut_counts = mia_trans_mut_counts, folder = "/storage2/proj/kodikaz/insertion_detection_pamir/result/files_for_siras/mia_tables/")




### mm1s 14_772_4370313_AluY processing

mm1s_trans_muts <- lapply(list.files("/storage2/proj/kodikaz/insertion_detection_pamir/result/files_for_siras/mm1s_mutations/joined_tables/", full.names = T)[grep("_merged.tsv", list.files("/storage2/proj/kodikaz/insertion_detection_pamir/result/files_for_siras/mm1s_mutations/joined_tables/", full.names = T))], function(x) {
  
  trans_table <- fread(x, fill = T, data.table = F)
  
  if(ncol(trans_table) == 14){
    trans_table[,13] <- paste0(trans_table[,13], "_", trans_table[,14])
    trans_table <- trans_table[,-14]
  }
  
  trans_table <- trans_table[,c(1, 2, 6, 13, 3, 4)]
  
  colnames(trans_table) <- c("ID", "position_in_alignment", "position_in_transposon", "direction", "nucleotide_in_contig", "nucleotide_in_repeat")
  
  trans_table$id_pos <- paste0(trans_table$ID, "_", trans_table$position_in_alignment)
  
  rownames(trans_table) <- trans_table$id_pos
  
  trans_table
})

names(mm1s_trans_muts) <- gsub("_merged.tsv", "", list.files("/storage2/proj/kodikaz/insertion_detection_pamir/result/files_for_siras/mm1s_mutations/joined_tables/")[grep("_merged.tsv", list.files("/storage2/proj/kodikaz/insertion_detection_pamir/result/files_for_siras/mm1s_mutations/joined_tables/"))])


mm1s_trans_mut_counts_14_772_4370313_AluY <- lapply(list.files("/storage2/proj/kodikaz/insertion_detection_pamir/result/te_aluy_alignment/nucleotide_counts_per_sample_14_772_4370313_AluY", full.names = T), function(x) {
  
  mut_counts <- fread(file = x, sep = "\t", stringsAsFactors = F, data.table = F)
  
  mut_counts$chr <- gsub("14_772_4370313_consensus", "14_772_4370313_AluY", mut_counts$chr)
  
  mut_counts$id_pos <- paste0(mut_counts$chr, "_", mut_counts$position)
  
  rownames(mut_counts) <- mut_counts$id_pos
  
  mut_counts
  
})

names(mm1s_trans_mut_counts_14_772_4370313_AluY) <- gsub("_mergedAligned_aluyAligned.out_sorted_mut_counts_by_nucs.tsv", "", list.files("/storage2/proj/kodikaz/insertion_detection_pamir/result/te_aluy_alignment/nucleotide_counts_per_sample_14_772_4370313_AluY"))


count_transformer(mm1s_trans_muts = mm1s_trans_muts$`14_772_4370313_AluY`, mm1s_trans_mut_counts = mm1s_trans_mut_counts_14_772_4370313_AluY, folder = "/storage2/proj/kodikaz/insertion_detection_pamir/result/files_for_siras/mia_tables/")

x <- "14_772_4370313_AluY"
z <- "14_772_4370313_AluY_308"
  
combined_samles_14_772_4370313_AluY <- lapply(names(mm1s_trans_mut_counts_14_772_4370313_AluY), function(y) {
  
  if(z %in% rownames(mm1s_trans_mut_counts_14_772_4370313_AluY[[y]])) {
    nuc_1 <- paste0(toupper(mm1s_trans_muts[[x]][z,"nucleotide_in_contig"]), ":count")
    nuc_2 <- paste0(toupper(mm1s_trans_muts[[x]][z,"nucleotide_in_repeat"]), ":count")
    
    rest_nucs <- paste0(setdiff(c("A", "T", "G", "C"), unique(c(toupper(mm1s_trans_muts[[x]][z,"nucleotide_in_contig"]), toupper(mm1s_trans_muts[[x]][z,"nucleotide_in_repeat"])))), ":count")
    
    sample_trans_nuc_count <- as.data.frame(matrix(mm1s_trans_mut_counts_14_772_4370313_AluY[[y]][z,c(nuc_1, nuc_2, rest_nucs)], ncol = 4))
  } else {
    sample_trans_nuc_count <- as.data.frame(matrix(c("A:0", "C:0", "G:0", "T:0"), ncol = 4))
  }
  
  colnames(sample_trans_nuc_count) <- paste0(y, "_", 1:4)
  sample_trans_nuc_count
  
})
  
combined_samples_data_14_772_4370313_AluY <- cbind(mm1s_trans_muts[[x]][ ,c("ID", "position_in_alignment", "position_in_transposon", "direction", "nucleotide_in_contig", "nucleotide_in_repeat")], Reduce(cbind, combined_samles_14_772_4370313_AluY))
  
combined_samples_data_14_772_4370313_AluY_matrix <- t(apply(combined_samples_data_14_772_4370313_AluY,2,as.character))
  
write.table(combined_samples_data_14_772_4370313_AluY_matrix, file = paste0("/storage2/proj/kodikaz/insertion_detection_pamir/result/files_for_siras/mm1s_tables/", x, "_by_samples_counts.tsv"), sep = "\t", row.names = F, quote = F)
