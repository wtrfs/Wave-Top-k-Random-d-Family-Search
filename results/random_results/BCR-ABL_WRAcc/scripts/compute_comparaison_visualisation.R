# save comp. of the evolution of discovered labels.

library(readr)
library(ggplot2)
library(stringr)

args <- commandArgs(trailingOnly = TRUE)

print(paste("--- Trace file: ", args[1:length(args)-1]," ---"))
print(paste("--- Output file: ", args[length(args)]," ---"))

files <- args[1:length(args)-1]
output_preffix <- args[length(args)]
var_width <- 12
dataName <- ""

megadata <- data.frame(matrix(
  vector(), 0, 8, dimnames=list(c(), c("Time", "Layer", "Type", "Rejecteded", "Uninterested", "Unsure", "Interested", "Accepteded"))),
  stringsAsFactors=F)

n<-0
for (file in files) {
  gtrace <- read_delim(file, delim=',')
  n <- n + 1
  tmpvec <- strsplit(files[n], split = "/")
  print(tmpvec)
  tmp <- tmpvec[[1]][length(tmpvec[[1]])]
  print(tmp)
  tmpvec <- strsplit(tmp, split = "_")
  tmp <- tmpvec[[1]][3]
  if (dataName=="") dataName <- tmpvec[[1]][1]
  tmp <- gsub(".csv", "", tmp)
  # print(strsplit(files[n], split = "_"))
  print(paste("Name:", tmp))
  gtrace$Id <- n
  gtrace$Name <- str_wrap(tmp, width=var_width)
  megadata <- rbind(megadata, gtrace)
}

print(megadata)

megadataLift <- megadata[megadata$Type=="Lift", ]
megadataOracleLift <- megadata[megadata$Type=="OracleLift", ]
# megadataRappel <- megadata[megadata$Type=="Rappel", ]
megadataSampleDistribution <- megadata[megadata$Type=="SampleDistribution", ]
megadataOracleDistribution <- megadata[megadata$Type=="OracleDistribution", ]
megadataHiddenLabels <- megadata[megadata$Type=="HiddenLabels", ]
megadataDiscoveredLabels <- megadata[megadata$Type=="DiscoveredLabels", ]

ggplot2::ggplot(megadataHiddenLabels, aes(x=Time)) +
  geom_line(aes(y=Rejected, color="Rejected")) +
  geom_line(aes(y=Uninterested, color="Uninterested")) +
  geom_line(aes(y=Unsure, color="Unsure")) +
  geom_line(aes(y=Interested, color="Interested")) +
  geom_line(aes(y=Accepted, color="Accepted")) +
  scale_color_manual(values = c("darkgreen", "steelblue", "darkred", "orange", "purple"), guide="none") +
#  scale_fill_manual(values = c("darkgreen", "steelblue", "darkred", "orange", "purple"), guide="none") +
  facet_grid(rows=vars(Name), cols=vars(Layer)) +
  labs(x="Number of questions asked", y="Mean Recall", caption=paste("Dataset: ", dataName)) +
  theme(axis.text.x = element_text(angle = 90,
                                   vjust = 0.5,
                                   hjust = 0.5))
ggsave(paste(output_preffix, "recall_comp.png", sep="_"))


ggplot2::ggplot(megadataDiscoveredLabels, aes(x=Time)) +
  geom_line(aes(y=Rejected, color="Rejected")) +
  geom_line(aes(y=Uninterested, color="Uninterested")) +
  geom_line(aes(y=Unsure, color="Unsure")) +
  geom_line(aes(y=Interested, color="Interested")) +
  geom_line(aes(y=Accepted, color="Accepted")) +
  scale_color_manual(values = c("darkgreen", "steelblue", "darkred", "orange", "purple"), guide="none") +
#  scale_fill_manual(values = c("darkgreen", "steelblue", "darkred", "orange", "purple"), guide="none") +
  facet_grid(rows=vars(Name), cols=vars(Layer)) +
  labs(x="Number of questions asked", y="Distribution in discovered labels", caption=paste("Dataset: ", dataName)) +
  theme(axis.text.x = element_text(angle = 90,
                                   vjust = 0.5,
                                   hjust = 0.5))
ggsave(paste(output_preffix, "discovered_labels_comp.png", sep="_"))
# 
# ggplot2::ggplot(megadataSampleDistribution, aes(x=Time)) +
#   geom_line(aes(y=Rejected, color="Rejected")) +
#   geom_line(aes(y=Uninterested, color="Uninterested")) +
#   geom_line(aes(y=Unsure, color="Unsure")) +
#   geom_line(aes(y=Interested, color="Interested")) +
#   geom_line(aes(y=Accepted, color="Accepted")) +
#   scale_color_manual(values = c("darkgreen", "steelblue", "darkred", "orange", "purple"), guide="none") +
# #  scale_fill_manual(values = c("darkgreen", "steelblue", "darkred", "orange", "purple"), guide="none") +
#   facet_grid(rows=vars(Name), cols=vars(Layer)) +
#   labs(x="Number of questions asked", y="Mean Ground Truth Sample Distribution", caption=paste("Dataset: ", dataName)) +
#   theme(axis.text.x = element_text(angle = 90,
#                                    vjust = 0.5,
#                                    hjust = 0.5))
# ggsave(paste(output_preffix, "layered_sample_distribution.png", sep="_"))
# 
# ggplot2::ggplot(megadataOracleDistribution, aes(x=Time)) +
#   geom_line(aes(y=Rejected, color="Rejected")) +
#   geom_line(aes(y=Uninterested, color="Uninterested")) +
#   geom_line(aes(y=Unsure, color="Unsure")) +
#   geom_line(aes(y=Interested, color="Interested")) +
#   geom_line(aes(y=Accepted, color="Accepted")) +
#   scale_color_manual(values = c("darkgreen", "steelblue", "darkred", "orange", "purple"), guide="none") +
# #  scale_fill_manual(values = c("darkgreen", "steelblue", "darkred", "orange", "purple"), guide="none") +
#   facet_grid(rows=vars(Name), cols=vars(Layer)) +
#   labs(x="Number of questions asked", y="Mean Oracle Sample Distribution", caption=paste("Dataset: ", dataName)) +
#   theme(axis.text.x = element_text(angle = 90,
#                                    vjust = 0.5,
#                                    hjust = 0.5))
# ggsave(paste(output_preffix, "layered_oracle_distribution.png", sep="_"))


ggplot2::ggplot(megadataLift, aes(x=Time)) +
  geom_line(aes(y=Rejected, color="Rejected")) +
  geom_line(aes(y=Uninterested, color="Uninterested")) +
  geom_line(aes(y=Unsure, color="Unsure")) +
  geom_line(aes(y=Interested, color="Interested")) +
  geom_line(aes(y=Accepted, color="Accepted")) +
  scale_color_manual(values = c("darkgreen", "steelblue", "darkred", "orange", "purple"), guide="none") +
#  scale_fill_manual(values = c("darkgreen", "steelblue", "darkred", "orange", "purple"), guide="none") +
  facet_grid(rows=vars(Name), cols=vars(Layer), scale="free_y") +
  labs(x="Number of questions asked", y="Mean Ground Truth Lift", caption=paste("Dataset: ", dataName)) +
  theme(axis.text.x = element_text(angle = 90,
                                   vjust = 0.5,
                                   hjust = 0.5))
ggsave(paste(output_preffix, "layered_groundtruth_lift.png", sep="_"))


# ggplot2::ggplot(megadataOracleLift, aes(x=Time)) +
#   geom_line(aes(y=Rejected, color="Rejected")) +
#   geom_line(aes(y=Uninterested, color="Uninterested")) +
#   geom_line(aes(y=Unsure, color="Unsure")) +
#   geom_line(aes(y=Interested, color="Interested")) +
#   geom_line(aes(y=Accepted, color="Accepted")) +
#   scale_color_manual(values = c("darkgreen", "steelblue", "darkred", "orange", "purple"), guide="none") +
# #  scale_fill_manual(values = c("darkgreen", "steelblue", "darkred", "orange", "purple"), guide="none") +
#   facet_grid(rows=vars(Name), cols=vars(Layer), scale="free_y") +
#   labs(x="Number of questions asked", y="Mean Oracle Lift", caption=paste("Dataset: ", dataName)) +
#   theme(axis.text.x = element_text(angle = 90,
#                                    vjust = 0.5,
#                                    hjust = 0.5))
# ggsave(paste(output_preffix, "layered_oracle_lift.png", sep="_"))

# ggplot2::ggplot(megadataRappel, aes(x=Time)) +
#   geom_line(aes(y=Rejected, color="Rejected")) +
#   geom_line(aes(y=Uninterested, color="Uninterested")) +
#   geom_line(aes(y=Unsure, color="Unsure")) +
#   geom_line(aes(y=Interested, color="Interested")) +
#   geom_line(aes(y=Accepted, color="Accepted")) +
#   scale_color_manual(values = c("darkgreen", "steelblue", "darkred", "orange", "purple"), guide="none") +
#   scale_fill_manual(values = c("darkgreen", "steelblue", "darkred", "orange", "purple"), guide="none") +
#   facet_grid(rows=vars(Name), cols=vars(Layer), scale="free_y") +
#   labs(x="Number of questions asked", y="Mean  Ground Truth Rappel", caption=paste("Dataset: ", dataName)) +
#   theme(axis.text.x = element_text(angle = 90,
#                                    vjust = 0.5,
#                                    hjust = 0.5))
# ggsave(paste(output_preffix, "layered_rappel.png", sep="_"))
