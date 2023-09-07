## data import and new id generation
vcf_files <- lapply(list.files("../data/pamir_vcf/", full.names = T), function(x) {
  vcf_data <- vcfR::read.vcfR(file = x)
  
  vcf_data@fix <- cbind(vcf_data@fix, paste(vcf_data@fix[,"CHROM"], vcf_data@fix[,"POS"], vcf_data@fix[,"ALT"], sep = "_"))
  colnames(vcf_data@fix)[ncol(vcf_data@fix)] <- "id_new"
  vcf_data
})

names(vcf_files) <- gsub(".vcf.gz", "", list.files("../data/pamir_vcf/"))

## vcf filtering between cell line and matched, mismatched samples
MIA_match_filtered <- vcf_files$MIA_matched_with_ref@fix[which(!(vcf_files$MIA_matched_with_ref@fix[,"id_new"] %in% vcf_files$MIA_cell_line_with_ref@fix[,"id_new"])),]
MIA_mismatch_filtered <- vcf_files$MIA_mismatch_with_ref@fix[which(!(vcf_files$MIA_mismatch_with_ref@fix[,"id_new"] %in% vcf_files$MIA_cell_line_with_ref@fix[,"id_new"])),]
MIA_intersect <- MIA_match_filtered[which(MIA_match_filtered[,"id_new"] %in% MIA_mismatch_filtered[,"id_new"]),]
MIA_match_filtered <- MIA_match_filtered[which(!(MIA_match_filtered[,"id_new"] %in% MIA_intersect[,"id_new"])), ]
MIA_mismatch_filtered <- MIA_mismatch_filtered[which(!(MIA_mismatch_filtered[,"id_new"] %in% MIA_intersect[,"id_new"])), ]

MM1S_match_filtered <- vcf_files$MM1S_matchet_with_ref@fix[which(!(vcf_files$MM1S_matchet_with_ref@fix[,"id_new"] %in% vcf_files$MM1S_cell_line_with_ref@fix[,"id_new"])),]
MM1S_mismatch_filtered <- vcf_files$MM1S_mismatch_with_ref@fix[which(!(vcf_files$MM1S_mismatch_with_ref@fix[,"id_new"] %in% vcf_files$MM1S_cell_line_with_ref@fix[,"id_new"])),]
MM1S_intersect <- MM1S_match_filtered[which(MM1S_match_filtered[,"id_new"] %in% MM1S_mismatch_filtered[,"id_new"]),]
MM1S_match_filtered <- MM1S_match_filtered[which(!(MM1S_match_filtered[,"id_new"] %in% MM1S_intersect[,"id_new"])), ]
MM1S_mismatch_filtered <- MM1S_mismatch_filtered[which(!(MM1S_mismatch_filtered[,"id_new"] %in% MM1S_intersect[,"id_new"])), ]


## coverage and lengt filtering function
sorting_by_cov <- function(vcf_object) {
  supporting_read_count <- as.integer(unname(
    sapply(vcf_object[,"INFO"], function(x) {
      gsub("Support=", "", unlist(strsplit(x, split = ";"))[2])
    })
  ))
  
  cov_filtered_vcf <- vcf_object[order(supporting_read_count, decreasing = T)[1:1000],]
  cov_filtered_vcf <- cov_filtered_vcf[which(nchar(cov_filtered_vcf[, "ALT"]) >= 100),]
  
  return(cov_filtered_vcf)
}

## running function on all 6 vcfs
cov_filtered_inserts <- lapply(ls()[grep("MIA|MM1S", ls())], function(x) {
  sorting_by_cov(get(x))
})

names(cov_filtered_inserts) <- ls()[grep("MIA|MM1S", ls())]

### generating fasta files from filtered vcfs
lapply(names(cov_filtered_inserts), function(x) {
  
  sapply(1:nrow(cov_filtered_inserts[[x]]), function(y) {
    write(paste0(">", cov_filtered_inserts[[x]][y,"ID"]), file = paste0("/storage2/proj/kodikaz_project/data/top_insertions/", x, ".fa"), append = T)
    write(cov_filtered_inserts[[x]][y,"ALT"], file = paste0("/storage2/proj/kodikaz_project/data/top_insertions/", x, ".fa"), append = T)
  })
  
})
