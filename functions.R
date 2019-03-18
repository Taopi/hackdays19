cleanFun <- function(htmlString) {
  return(gsub("<.*?>", "", htmlString))
}

get_srf_data <- function(url) {
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
  article.title <<-   article.title
  twitter.description <<-   twitter.description
  article.content <<-   article.content
  twitter.image <<-   twitter.image
}