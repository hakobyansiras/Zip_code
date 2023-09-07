#filter the repeat files and select repeats mannualy
#awk '{print $10}' result/mm1s_uniq_contigs_repeat_mask/mm1s_ctdna_uniq_contigs_consensus.fa.out > result/mm1s_uniq_contigs_repeat_mask/mm1s_ctdna_uniq_contigs_consensus_repeats.txt



#grep -w -f result/mm1s_uniq_contigs_repeat_mask/mm1s_ctdna_uniq_contigs_consensus_repeats.txt \
#data/gtf/repeatmasker_hg38.gtf > data/gtf/repeatmasker_mm1s.gtf


##### starting
echo "start"
bedtools intersect \
-a /media/analysis/MMRC-001-008_2276/FCH2KGNDSXY_L4_HKRDHUMfowEABCRAAPEI-P77G5_mergedAligned.out.bam_sorted \
-b data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/MMRC-001-008_2_P77G5_mergedAligned.bam

bedtools intersect \
-a /media/analysis/MMRC-002-002-2/FCH32FVDSXY_L4_HKRDHUMfowEAANRAAPEI-P87H3_mergedAligned.out.bam_sorted \
-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/MMRC-002-002-2_P87H3_mergedAligned.bam

bedtools intersect \
-a /media/analysis/MMRC-002-001_2264/FCH32FVDSXY_L4_HKRDHUMfowEAAQRAAPEI-P28C4_mergedAligned.out.bam_sorted \
-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/MMRC-002-001_2_P28C4_mergedAligned.bam

bedtools intersect \
-a /media/analysis/MMRC-001-010/FCH32FVDSXY_L4_HKRDHUMfowEAAYRAAPEI-P29C5_mergedAligned.out.bam_sorted \
-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/MMRC-001-010_P29C5_mergedAligned.bam

bedtools intersect  \
-a /media/analysis/MMRC-004-009/FCH32FVDSXY_L4_HKRDHUMfowEAAARAAPEI-P26C2_mergedAligned.out.bam_sorted \
-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/MMRC-004-009_P26C2_mergedAligned.bam

bedtools intersect  \
-a /media/analysis/MMRC-004-002-1/FCH32FVDSXY_L4_HKRDHUMfowEAAFRAAPEI-P86H2_mergedAligned.out.bam_sorted \
-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/MMRC-004-002-1_P86H2_mergedAligned.bam

bedtools intersect  \
-a /media/analysis/MMRC-003-002/FCH32FVDSXY_L4_HKRDHUMfowEAAKRAAPEI-P51E3_mergedAligned.out.bam_sorted \
-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/MMRC-003-002_P51E3_mergedAligned.bam

bedtools intersect  \
-a /media/analysis/MMRC-001-008_2275/FCH2KGNDSXY_L4_HKRDHUMfowEABBRAAPEI-P65F5_mergedAligned.out.bam_sorted \
-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/MMRC-001-008_2_P65F5_mergedAligned.bam

bedtools intersect  \
-a /media/analysis/MMRC-003-002-1/FCH32FVDSXY_L4_HKRDHUMfowEAAJRAAPEI-P39D3_mergedAligned.out.bam_sorted \
-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/MMRC-003-002-1_P39D3_mergedAligned.bam   

bedtools intersect  \
-a /media/analysis/MMRC-001-014/FCH32FVDSXY_L4_HKRDHUMfowEAATRAAPEI-P64F4_mergedAligned.out.bam_sorted  \
-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/MMRC-001-014_P64F4_mergedAligned.bam   

bedtools intersect  \
-a /media/analysis/MMRC-001-013/FCH32FVDSXY_L4_HKRDHUMfowEAAURAAPEI-P76G4_mergedAligned.out.bam_sorted \
-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/MMRC-001-013_P76G4_mergedAligned.bam   
   
bedtools intersect  \
-a /media/analysis/MMRC-003-003/FCH32FVDSXY_L4_HKRDHUMfowEAAIRAAPEI-P27C3_mergedAligned.out.bam_sorted \
-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/MMRC-003-003_P27C3_mergedAligned.bam 
                                  
bedtools intersect  \
-a /media/analysis/MMRC-001-003/FCH2KGNDSXY_L4_HKRDHUMfowEABJRAAPEI-P66F6_mergedAligned.out.bam_sorted \
-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/MMRC-001-003_P66F6_mergedAligned.bam
                                   
bedtools intersect  \
-a /media/analysis/MMRC-003-001/FCH32FVDSXY_L4_HKRDHUMfowEAALRAAPEI-P63F3_mergedAligned.out.bam_sorted \
-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/MMRC-003-001_P63F3_mergedAligned.bam 
                                  
bedtools intersect  \
-a /media/analysis/MMRC-001-006-1/FCH2KGNDSXY_L4_HKRDHUMfowEABERAAPEI-P6A6_mergedAligned.out.bam_sorted \
-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/MMRC-001-006-1_P6A6_mergedAligned.bam 
                                 
bedtools intersect  \
-a /media/analysis/MMRC-001-009-2/FCH32FVDSXY_L4_HKRDHUMfowEAAZRAAPEI-P41D5_mergedAligned.out.bam_sorted \
-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/MMRC-001-009-2_P41D5_mergedAligned.bam 
                                
bedtools intersect  \
-a /media/analysis/MMRC-001-016/FCH32FVDSXY_L4_HKRDHUMfowEAARRAAPEI-P40D4_mergedAligned.out.bam_sorted   \
-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/MMRC-001-016_P40D4_mergedAligned.bam 
                                  
bedtools intersect  \
-a /media/analysis/MMRC-001-002/FCH2KGNDSXY_L4_HKRDHUMfowEABKRAAPEI-P78G6_mergedAligned.out.bam_sorted   \
-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/MMRC-001-002_P78G6_mergedAligned.bam

bedtools intersect  \
-a /media/analysis/MMRC-002-001_2263/FCH32FVDSXY_L4_HKRDHUMfowEAAPRAAPEI-P16B4_mergedAligned.out.bam_sorted \
-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/MMRC-002-001_2_P16B4_mergedAligned.bam

bedtools intersect  \
-a /media/analysis/MMRC-001-010-1/FCH32FVDSXY_L4_HKRDHUMfowEAAXRAAPEI-P17B5_mergedAligned.out.bam_sorted \
-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/MMRC-001-010-1_P17B5_mergedAligned.bam  
                               
bedtools intersect  \
-a /media/analysis/MMRC-004-001-1/FCH32FVDSXY_L4_HKRDHUMfowEAAGRAAPEI-P3A3_mergedAligned.out.bam_sorted \
-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/MMRC-004-001-1_P3A3_mergedAligned.bam  
                                
bedtools intersect  \
-a /media/analysis/MMRC-004-008/FCH32FVDSXY_L4_HKRDHUMfowEAABRAAPEI-P38D2_mergedAligned.out.bam_sorted  \
-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/MMRC-004-008_P38D2_mergedAligned.bam 
                                  
bedtools intersect  \
-a /media/analysis/MMRC-002-003/FCH32FVDSXY_L4_HKRDHUMfowEAAMRAAPEI-P75G3_mergedAligned.out.bam_sorted \
-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/MMRC-002-003_P75G3_mergedAligned.bam

bedtools intersect  \
-a /media/analysis/MMRC-001-009-1/FCH2KGNDSXY_L4_HKRDHUMfowEABARAAPEI-P53E5_mergedAligned.out.bam_sorted \
-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/MMRC-001-009-1_P53E5_mergedAligned.bam

bedtools intersect  \
-a /media/analysis/MMRC-001-015/FCH32FVDSXY_L4_HKRDHUMfowEAASRAAPEI-P52E4_mergedAligned.out.bam_sorted \
-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/MMRC-001-015_P52E4_mergedAligned.bam

bedtools intersect  \
-a /media/analysis/MMRC-001-011/FCH32FVDSXY_L4_HKRDHUMfowEAAWRAAPEI-P5A5_mergedAligned.out.bam_sorted \
-b  data/gtf/repeatmasker_mm1s.gtf -wa > data/te_bam/MMRC-001-011_P5A5_mergedAligned.bam
echo "finish"