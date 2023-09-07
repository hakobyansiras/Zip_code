1. In this step quality control and trimming of fastq reads were performed with fastqc, multiqc, and Trimmomatic tools.
2. After quality trimming samples were depth normalized for the assembly with bbnorm. Afterward best kmer size for the assembly was predicted with kmergenie tool.
3. Depth normalized samples were assembled with abyss.
4. Co-cultured cell line sequnces were aligned to the human reference genome with bwa mem, then aligned bam files were used to predict de novo insertions with pamir tool.
