##The genomes with matched germline was used to test the specificity of the filtering piepline.


ggplot2::
scales::
ggrepel::
ggthemes::

Test_Filtering_Genome <- read.csv("~/Desktop/Data_Analysis/Filtering_pipeline/Test_Filtering_Genome.csv")
View(Test_Filtering_Genome)
X <- ggplot(Test_Filtering_Genome, aes(x = Test_Filtering_Genome$Tumor, y = Test_Filtering_Genome$Variants))
X + geom_bar(stat = "identity", aes(fill = Test_Filtering_Genome$Filter)) +theme_minimal() + theme(axis.text.x = element_text(face = "bold", color = "black", size = 6, angle = 90))+
  scale_fill_brewer(palette = "Set1") 
TOtal_variants_Genome_filtering <- read.csv("~/Desktop/Data_Analysis/Filtering_pipeline/TOtal_variants_Genome_filtering.csv")
Y <- ggplot(TOtal_variants_Genome_filtering, aes(x = TOtal_variants_Genome_filtering$Filter, y = TOtal_variants_Genome_filtering$Variants))
Y + geom_bar(stat = "identity", aes(fill = TOtal_variants_Genome_filtering$Filter)) +theme_minimal() + scale_fill_brewer(palette = "Set1")
