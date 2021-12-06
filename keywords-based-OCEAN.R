#!/usr/bin/env Rscript
# Script to do OCEAN analysis to text dataset based on keywords
# Please install "optparse", "logger", "rjson", "stringr", and "readr" package before running

# Load library
suppressWarnings(library(optparse))
suppressWarnings(library(logger))
library(rjson)
library(stringr)
library(readr)

log_threshold(DEBUG)

# Function to find OCEAN based on Keywords
find.ocean <- function(messages, keywords) {
  label <- c()
  for (row in messages) {
    res <- c()

    for (ocean in names(keywords)) {
      key <- regex(str_c(keywords[[ocean]], collapse = "|"), ignore_case = TRUE)
      if (str_detect(row, key)) {
        res <- c(res, ocean)
      }
    }

    if (length(res) > 1) {
      label <- c(label, str_c(res, collapse = " "))
    } else {
      label <- c(label, NA)
    }
  }
  return(label)
}

log_info("Starting scripts for find ocean from text based on keywords...")
option_list <- list(
  make_option(c("-p", "--path"),
    action = "store", type = "character", dest = "filename", help = "Path ke dataset"
  )
)

parser <- parse_args(OptionParser(option_list = option_list))

if (file.exists(parser$filename)) {
  # Read keywords
  log_info("Loading keywords...")
  keywords <- fromJSON(file = "./keywords.json")

  # Read dataset
  log_info(paste("Loading dataset :", parser$filename, sep = " "))
  data <- read_csv(parser$filename)
  data <- data[!is.na(data$message), ] # drop NA

  # Find OCEAN based on keywords
  log_info("Finding OCEAN from data...")
  data$label <- find.ocean(data$message, keywords)

  # Summary
  log_info(paste("NULL labelled data :", sum(is.na(data$label)), sep = " "))

  # Write csv
  log_info("Saving new data to './output' directory")
  dir.create("./output", showWarnings = FALSE)
  write.csv(data, "./output/traditional-labelled-data.csv", row.names = FALSE)
}

log_info("Done!")