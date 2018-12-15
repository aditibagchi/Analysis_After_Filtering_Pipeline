#Initial visualization of the varaints afollowing the filtering strategy is applied.
maftools::
  ggplot2::
  Genome <- read.maf(maf = "~/Desktop/Data_Analysis/Filtering_pipeline/30_Genomes_pipeline_filtered.maf.txt") 
X <-  mafSummary(Genome)
Data_Frame_Genome_Test_filtering <- read_csv("~/Desktop/Data_Analysis/Filtering_pipeline/Data_Frame_Genome_Test_filtering.csv")
Data_Frame_Genome_Test_Filtering_other <- read_csv("~/Desktop/Data_Analysis/Filtering_pipeline/Data_Frame_Genome_Test_Filtering_other.csv")
str(Data_Frame_Genome_Test_filtering)
Data_Frame2 <- as.data.frame(Data_Frame_Genome_Test_Filtering_other)
#Use ggplot2 to make a bar plot for the varaibles generated using the respective filtering strategy , pipeline or germline. 
X <- ggplot(Data_Frame2, aes(x = Data_Frame2$Tumor, y = Data_Frame2$Variants)
X + geom_bar(stat = "identity", aes(fill = Data_Frame2$Filter, color = Data_Frame2$TYPE)) + scale_fill_brewer("grey", "green")+
            theme(axis.text.x = element_text(face = "bold", color = "black", size = 6, angle = 90)) +scale_color_brewer(palette = "Set1")+
             xlab("Tumors") +ylab("Variants") 
Data_Frame_Hypermut_Genome_Test_Filterin <- read_csv("~/Desktop/Data_Analysis/Filtering_pipeline/Data_Frame_Hypermut_Genome_Test_Filterin.csv")
Data_Frame3 <-as.data.frame(Data_Frame_Hypermut_Genome_Test_Filterin)
Y <- ggplot(Data_Frame3, aes(x = Data_Frame3$Tumor, y = Data_Frame3$Variants))
Y + geom_bar(stat = "identity", aes(fill = Data_Frame3$Filter, color = Data_Frame3$Type), width = 0.75) + 
  theme_minimal() + scale_fill_brewer("grey", "green")+ theme(axis.text.x = element_text(face = "bold", color = "black", size = 6, angle = 90)) +
  scale_color_brewer(palette = "Set1")+ xlab("Tumors") +ylab("Variants") + 
  theme(aspect.ratio = 5/1)