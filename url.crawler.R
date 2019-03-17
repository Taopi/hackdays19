library(RCurl)
library(rvest)
library(stringr)

cleanFun <- function(htmlString) {
  return(gsub("<.*?>", "", htmlString))
}
### Auf Artikel Seite Text, etc, auslesen

url <- "https://www.srf.ch/news/schweiz/wasserpegel-des-lago-maggiore-an-25-zentimetern-scheiden-sich-die-geister"

url <- "https://www.srf.ch/news/wirtschaft/lohn-fuer-spitzenbanker-14-millionen-im-internationalen-vergleich-relativ-bescheiden"

#url <- "https://www.srf.ch/news/schweiz/schweizer-frauenstreik-so-geht-es-nicht-wir-frauen-sind-unzufrieden"

### 1. Bild und Titel: 
doc.raw <- getURL(url)
raw <- paste(doc.raw)
start <- gregexpr(pattern ='twitter:description', raw)
stop<- gregexpr(pattern ='og:title', raw)  
raw <- substr(raw, start, stop)
raw <- strsplit(raw, '\n')
raw <- as.data.frame(unlist(raw))
raw <- raw[c(2,3),]
# Säubern der "Strings":
raw <- gsub('"', "", raw)
raw <- gsub('content=', "", raw)
raw <- gsub('\"/>', "", raw)
raw <- gsub('<meta name=twitter:image', "", raw)
raw <- gsub("  ", " ", raw)
raw <- gsub("./>", " ", raw)
raw <- gsub(">", " ", raw)
raw <- trimws(raw)

twitter.description <- raw[1]
twitter.image <- raw[2]

### 2. article.content: 
doc.raw <- read_html(url) %>% xml_nodes(xpath="//*[@class='article-content']")
article.content <- paste(doc.raw)
article.content <- cleanFun(article.content)
# Säubern des Strings:
article.content <- gsub('\n', "", article.content)
article.content  <- trimws(article.content)

### 3. article.title: 
article.title <- read_html(url) %>% xml_nodes(xpath="//*[@class='article-title']")
article.title <- cleanFun(article.title)
article.title  <- gsub('\n', "", article.title )
article.title  <- trimws(article.title)




