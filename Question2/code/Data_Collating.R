# Collating data
Data_Collating <- function(Datroot = "Question2/data/"){

  library(tidyverse)
  # first create a silent read function
  silentread <- function(x){
    hushread <- purrr::quietly(read_csv)
    df <- hushread(x)
    df$result
  }

  Forbesdata <-
    list.files(Datroot, full.names = T, recursive = T) %>%
    mutate(Age = as.character(Age)) %>%
    #Only load csv's, not readme's.
    .[!grepl(".txt", .)] %>%
    as.list() %>%
    map(~silentread(.)) %>%
    bind_rows()

  Forbesdata

}