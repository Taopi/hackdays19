library(RCurl)
library(rvest)
library(stringr)


source('functions.R', chdir = TRUE)
url <- "https://www.srf.ch/news/schweiz/lockerung-von-waffenexporten-unterschriften-fuer-initiative-haben-wir-bereits-genug"
get_srf_data(url)