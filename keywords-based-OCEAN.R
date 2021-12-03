# Load library
library(rjson)
library(stringr)
library(readr)

# Function to find OCEAN based on Keywords
find.ocean <- function(messages, keywords){
  label <- c()
  for(row in messages){
    res <- c()
    
    for(ocean in names(keywords)){
      key <- regex(str_c(keywords[[ocean]], collapse = "|"), ignore_case = TRUE)
      if(str_detect(row, key))
        res <- c(res, ocean)
    }
    
    if(length(res) > 1)
      label <- c(label, str_c(res, collapse = " "))
    else
      label <- c(label, NA)
  }
  return(label)
}

# Read keywords
keywords <- fromJSON(file = "./keywords.json")

# Read dataset
data <- read_csv("./data/clean-sample-data.csv")
data <- data[!is.na(data$message),] # drop NA

# Find OCEAN based on keywords
data$label <- find.ocean(data$message, keywords)

# Summary
sum(is.na(data$label))

# Write csv
dir.create("./output", showWarnings = FALSE)
write.csv(data, "./output/traditional-labelled-data.csv", row.names = FALSE)

