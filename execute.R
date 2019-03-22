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
  twitter.image = NA)
#urls einlesen
#download data here: https://analytics.webtrekk.com/analytics/#!/analytics/permalink/account/292330999892453/reports/963
data.url <- "https://raw.githubusercontent.com/Taopi/hackdays19/master/1553236820922_543754.csv"
url_list <- read.delim(data.url, header=FALSE)
url_list <- url_list$V2
names(url_list) <- "article.url"
url_list <- unique(url_list)

for (url in url_list[1:1000]) {
  tryCatch({
    url.now <- toString(paste(url))
    get_srf_data(url.now)
    temp <- data.frame(
      article.url = url,
      article.content = article.content,
      article.title = article.title,
      twitter.description = twitter.description,
      twitter.image = twitter.image)
    data <- rbind(data,temp)
  }, error=function(e){})
}
data <- data[-1,]
#View(data)