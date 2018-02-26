# librarys
library(ggplot2)
library(reshape2)
library(scales)

# Load data 
data <- read.table("~/*.txt", header = T )

#Drawing heat map

## HEAT MAP
# take only the depth columns 
dataClean<- data[ , -which(names(data) %in% c(grep("^Depth_", colnames(data), value = T)))]
## ggtable 
data_melt<-melt(dataClean, id.vars = "Protein")
names(data_melt)<-c("protein", "sample", "breath")

# plot one way
ggplot(data_melt, aes(protein, sample )) +
  geom_tile(aes(fill = breath), color = "white") +
  scale_fill_gradientn(colours=c("blue", "lightblue",
                                 "white",
                                 "lightyellow", "yellow"),
                       values=rescale(c(0, .25,
                                        .50,
                                        .75, 1.00))) +
  ylab("proteins") +
  xlab("Samples") +
  theme(legend.title = element_text(size = 10),
        legend.text = element_text(size = 12),
        plot.title = element_text(size=16),
        axis.title=element_text(size=14,face="bold"),
        axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(fill = "Breath of coverage")  + coord_fixed()


# plot other way
ggplot(data_melt, aes(sample,protein )) +
  geom_tile(aes(fill = breath), color = "white") +
  scale_fill_gradientn(colours=c("blue", "lightblue",
                                 "white",
                                 "lightyellow", "yellow"),
                       values=rescale(c(0, .25,
                                        .50,
                                        .75, 1.00))) +
  ylab("Proteins") +
  xlab("Samples") +
  theme(legend.title = element_text(size = 10),
        legend.text = element_text(size = 12),
        plot.title = element_text(size=16),
        axis.title=element_text(size=14,face="bold"),
        axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(fill = "Breath of coverage")  + coord_fixed()
