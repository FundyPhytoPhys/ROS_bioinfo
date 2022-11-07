
Citation(s) of published research derived from these data:
Omar NM, Fleury K, Beardsall B, Prášil O, Campbell DA, 2022, Reactive Oxygen Species Production and Scavenging; Genomic Patterns Across Marine Phytoplankton, in review


Project name and executive summary:
Annotation of Genes encoding Enzymes Across Marine Phytoplankton Genomes

Phytoplankton cells span a large size range, from picoplankton (<2µm), nanoplankton (2 to 20µm), microplankton (20 to 200µm) to macroplankton (200 to <2000µm). Cell size interacts with multiple selective pressures, including cellular metabolic rate, light absorption, nutrient uptake, cell nutrient quotas, trophic interactions and diffusional exchanges with the environment. Beyond simple size, cells of different shapes differ in surface area to volume ratio. For example, more elongated cells, such as pennate diatoms, have a larger surface area to volume ratio compared to more rounded cells, such as centric diatoms, of equivalent biovolume , which can in turn influence diffusional exchanges between cells and their environment.  We assembled metadata on diverse marine phytoplankters, in parallel with genomic or transcriptomic data annotations to identify genes encoding enzymes, to facilitate analyses of genomic patterns of encoded enzymes across diverse taxa, sizes, growth forms and origins of strains.
 
Contact information regarding analyses:
Naaman Omar, nomar@mta.ca

Methods of Data Processing and Analyses; Description of Files:
MetaData.csv contains information on the site and latitude of origin, cell size, genome size, presence of flagella and colony formation assembled for 146 diverse marine phytoplankters from citations listed in MetaData.csv.
We used an automated pipeline implemented through Snakemake to pass gene sequences from the downloaded genomes and/or transciptomes from the 146 phytoplankters, in .fasta format, to the eggNOG 5.0 database.
We then used eggNOG-Mapper 2.0.6  and the DIAMOND algorithm to annotate potential orthologs in each analyzed genome or transcriptome, using the following parameters: seed_ortholog_evalue = 0.001, seed_ortholog_score = 60, tax_scope = "auto", go_evidence = "non-electronic", query_cover = 20 and subject_cover = 0. 

The output of automatically annotated orthologs, from each genome or transcriptome, from the bioinformatic pipeline was compiled into combinedHits.csv.

Definitions of annotations and variable names are listed in CombinedHitsDataDictionary.csv.
Definitions of variable names from MetaData.csv are listed in MetaDataDictionary.csv.

Details for reuse or replication:
In MetaData.csv,  combinedHits.csv, MetaDataDictionary.csv, and CombinedHitsDataDictionary.csv missing values are left blank to facilitate direct import into a dataframe under 'R'.

.csv files are accessible through many software platforms including LibreOffice, but combinedHits.csv is large, so importing directly into 'R' is advisable.

Files and Directory Structures:
GitHub repository: https://github.com/NaamanOmar/ROS_bioinfo/ROSGenomicPatternsAcrossMarinePhytoplankton/
contains the code used to generate:
Omar NM, Fleury K, Beardsall B, Prášil O, Campbell DA, 2022, Reactive Oxygen Species Production and Scavenging; Genomic Patterns Across Marine Phytoplankton, in review

`R/ROSDataImport.Rmd` imports data from the Snakemake pipeline, to generate CombinedHits.csv.

`R/ROSModels.Rmd` imports CombinedHits.csv and MetaData.csv, and generates the Poisson and Quasi-Poisson models used in the manuscript.

`R/ROSGenomicPatternsBySubstrate.Rmd` generates the manuscript.

The metadata catalog containing information about each organism can additionally be found at:
 https://docs.google.com/spreadsheets/d/1kXm0GvMdTRbF12cG5Bps-2e_4MTjgUX7iUOjqiu-_c0/edit#gid=0

The Data Dictionary for the metadata catalog can additionally be found at:
 https://docs.google.com/spreadsheets/d/1Gmg7jbvv8S4MuQ04CrH6Z0Nd2L-1_m38djRzW3W1k84/edit#gid=0.

The Data dictionary for data used `R/ROSGenomicPatternsBySubstate.Rmd` (`DataProcessed/MergedData.csv`) can additionally be found at:
 https://docs.google.com/spreadsheets/d/1lECellT86qCIs4bOzpCBZZPsijzV0MQFv7IQS7TS2HY/edit#gid=0.




