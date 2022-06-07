# Script to join eggNOG hits from all files

suppressPackageStartupMessages(library(tidyverse))

# Get snakemake object input/output locations
JoinedEggIsoformSpROSEggNOGFiles <- snakemake@input[["JoinROSEggNOG"]]
combinedHitsFile <- snakemake@output[["combinedHits"]]
log <- file(snakemake@log[["CombineAllHitsLog"]], open="wt")
sink(log)
sink(log, type = "message")

combinedHits <- map_df(JoinedEggIsoformSpROSEggNOGFiles,
                                   read_csv, col_types = cols(.default = "c")) %>%
  type_convert()

#combinedHits <- bind_rows(JoinedEgIsoformSpROSEggNOGFiles)

write_csv(combinedHits, combinedHitsFile)

print("done")

