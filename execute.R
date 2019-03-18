library(RCurl)
library(rvest)
script.url <- "https://raw.githubusercontent.com/Taopi/hackdays19/master/functions.R"
script <- getURL(script.url, ssl.verifypeer = FALSE)
eval(parse(text = script))

data <- data.frame(
  article.url = NA, 
  article.content = NA,
  article.title = NA,
  twitter.description = NA,
  article.content = NA)

`url_list` <- read.delim("~/Downloads/1552934988975_219259.csv", header=FALSE)
url_list <- url_list$V2
names(url_list) <- "article.url"

url_list[1]
get_srf_data(url[,1])