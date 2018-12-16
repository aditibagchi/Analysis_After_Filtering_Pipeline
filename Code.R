#Initial visualization of the varaints afollowing the filtering strategy is applied.
#Workflow for genomes 
maftools::
  ggplot2::
  Genome <- read.maf(maf = "~/Desktop/Data_Analysis/Filtering_pipeline/30_Genomes_pipeline_filtered.maf.txt") 
X <-  mafSummary(Genome)
#created a CSV file with all the variants in Genome that are obtained using filtering piepline
Data_Frame_Genome_Test_filtering <- read_csv("~/Desktop/Data_Analysis/Filtering_pipeline/Data_Frame_Genome_Test_filtering.csv")
#dataframe without the hypermutated samples; that was most likely skewing the data
Data_Frame_Genome_Test_Filtering_other <- read_csv("~/Desktop/Data_Analysis/Filtering_pipeline/Data_Frame_Genome_Test_Filtering_other.csv")
str(Data_Frame_Genome_Test_filtering)
Data_Frame2 <- as.data.frame(Data_Frame_Genome_Test_Filtering_other)
#Use ggplot2 to make a bar plot for the varaibles generated using the respective filtering strategy , pipeline or germline. 
X <- ggplot(Data_Frame2, aes(x = Data_Frame2$Tumor, y = Data_Frame2$Variants)
X + geom_bar(stat = "identity", aes(fill = Data_Frame2$Filter, color = Data_Frame2$TYPE)) + scale_fill_brewer("grey", "green")+
     theme(axis.text.x = element_text(face = "bold", color = "black", size = 6, angle = 90)) +scale_color_brewer(palette = "Set1")+
    xlab("Tumors") +ylab("Variants") 
#dataframe with hypermutated samples only
Data_Frame_Hypermut_Genome_Test_Filterin <- read_csv("~/Desktop/Data_Analysis/Filtering_pipeline/Data_Frame_Hypermut_Genome_Test_Filterin.csv")
Data_Frame3 <-as.data.frame(Data_Frame_Hypermut_Genome_Test_Filterin)
Y <- ggplot(Data_Frame3, aes(x = Data_Frame3$Tumor, y = Data_Frame3$Variants))
Y + geom_bar(stat = "identity", aes(fill = Data_Frame3$Filter, color = Data_Frame3$Type), width = 0.75) + 
  theme_minimal() + scale_fill_brewer("grey", "green")+ theme(axis.text.x = element_text(face = "bold", color = "black", size = 6, angle = 90)) +
  scale_color_brewer(palette = "Set1")+ xlab("Tumors") +ylab("Variants") + 
  theme(aspect.ratio = 5/1)
#Workflow for the exomes
`35_Exomes_pipeline_filtered.maf` <- read.delim("~/Desktop/Data_Analysis/Filtering_pipeline/35_Exomes_pipeline_filtered.maf.txt", header=FALSE, comment.char="#")
Exome <- read.maf(maf = "~/Desktop/Data_Analysis/Filtering_pipeline/35_Exomes_pipeline_filtered.maf.txt" )
mafSummary(Exome)
`35_samples_maf` <- read.delim("~/Desktop/Data_Analysis/Data_Files/Exome_Data/35_samples_maf.txt", header=FALSE, comment.char="#")

Exome_unfiltered <- read.maf(maf = "~/Desktop/Data_Analysis/Data_Files/Exome_Data/35_samples_maf.txt" )
mafSummary(Exome_unfiltered)
#Analysis of Mutational Signatures - Exome Data
#Create a Data frame with ; Sample, Chr, Ref, alt, chromosomalposition
Exomes_pipeline_filtered.maf <- read.delim("~/Desktop/Data_Analysis/Filtering_pipeline/35_Exomes_pipeline_filtered.maf.txt", header=TRUE, comment.char="#")
sigs_input_exome <- read_csv("~/Desktop/Data_Analysis/Filtering_pipeline/sigs_input_exome.csv")
str(sigs_input_exome)
sigs_input_exome <- as.data.frame(sigs_input_exome)
sigs_input_exome <- mut.to.sigs.input(sigs_input_exome, sample.id = "sample", chr = "chr", pos = "pos",
                                             ref = "ref", alt = "alt", bsg = BSgenome.Hsapiens.UCSC.hg38)
MB <- whichSignatures(tumor.ref = sigs_input_exome , sample.id = "ABSJ112017MB9",
                               signatures.ref = signatures.nature2013, associated = c(),
                               signatures.limit = NA, signature.cutoff = 0.06, contexts.needed = TRUE,
                               tri.counts.method = "default")
plotSignatures(MB)
makePie(MB, sub = "MB", add.color = NULL)
