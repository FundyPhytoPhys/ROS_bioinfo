# Script to join eggNOG annotations with ROS enzyme EC numbers
# Brian Beardsall

suppressPackageStartupMessages(library(tidyverse))

print("Joining eggNOG annotations with ROS enzyme ids...")

# Get snakemake object input/output locations
eggNOGfile <- snakemake@input[["eggNOGannotations"]]
ROSEcFile <- snakemake@input[["ROSinfo"]]
outputCsv <- snakemake@output[["JoinedHitAttributes"]]

# Read columns headers from first file
EggnogHeader <- pull(read_csv(eggNOGfile[1], n_max = 4))[4] %>%
  str_split("\\t") %>%
  unlist() %>%
  map_chr(~str_replace_all(., "#", ""))

# Read eggNOG annotation file
eggNOGData <- read_tsv(eggNOGfile, skip = 5, col_names = EggnogHeader) %>%
  # split the hit name into the genome name and gene ID
  separate(col = "query_name", into = c("Ome", "GeneId"), 
           sep = "___", remove = FALSE)

# Read ROS enzyme info tsv file
ROSEC <- read_tsv(ROSEcFile)

# Convert data to long (expand on EC #), since multiple EC #'s per enzyme
LongROSEC <- ROSEC %>%
  separate_rows(EC)

LongEggNogData <- eggNOGData %>%
  separate_rows(EC)

genomeName <- str_remove(eggNOGfile, ".emapper.annotations")


# Add ROS EC #'s to eggNOG annotations
JoinedHitAttributes <- left_join(LongEggNogData, 
                                 LongROSEC, by = "EC") %>%
  mutate(genome = genomeName)

write_csv(JoinedHitAttributes, outputCsv)

print("Done.")
print(paste("Saved", sum(!is.na(JoinedHitAttributes$ROSEnzymeName)), "ROS hits."))


