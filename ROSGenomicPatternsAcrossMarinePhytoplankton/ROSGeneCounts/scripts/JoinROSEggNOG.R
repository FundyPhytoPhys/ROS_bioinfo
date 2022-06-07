# Script to join eggNOG annotations with ROS enzyme EC numbers
eggNOGfile <- snakemake@input[["eggNOGannotations"]]
outputCsv <- snakemake@output[["JoinedHitAttributes"]]
log <- file(snakemake@log[["JoinROSEggNOGLog"]], open="wt")
sink(log)
sink(log, type = "message")

suppressPackageStartupMessages(library(tidyverse))

print("Joining eggNOG annotations with ROS enzyme ids...")

# Get snakemake object input/output locations



# Read columns headers from first file
EggnogHeader <- pull(read_csv(eggNOGfile[1], n_max = 4))[4] %>%
  str_split("\\t") %>%
  unlist() %>%
  map_chr(~str_replace_all(., "#", ""))

# Read eggNOG annotation file
eggNOGData <- read_tsv(eggNOGfile, skip = 5, col_names = EggnogHeader)

genomeName <- eggNOGfile %>% 
  str_remove(., ".emapper.annotations") %>%
  str_remove(., "output/eggNOG/")


# Add ROS EC #'s to eggNOG annotations
JoinedHitAttributes <- eggNOGData %>%
  separate_rows(EC) %>%
  mutate(genome = genomeName) %>%
  distinct_at(vars(query_name), .keep_all = TRUE)

write_csv(JoinedHitAttributes, outputCsv)

print("Done.")
