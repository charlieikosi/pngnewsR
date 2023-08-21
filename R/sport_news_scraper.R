#' Sports News Scraper
#' 
#' Scrapes sports news articles from the post-courier news website
#' @param pages Takes an integer value as input. This allows the script to page through the website.
#' @return Returns an object of class 'tibble'
#' @examples 
#' df <- sport(pages = 1);
#' df2 <- sport(1);
#' @name sport
#' @import rvest 
#' @import tidyverse 
#' @import tibble
#' @export

library(rvest)
library(tidyverse)
library(tibble)

sport <- function(pages){
  
  total_pages <- as.numeric(pages)
  # while-loop counter
  i <- 1
  
  # Empty vectors for tibble
  pubDate <- c()
  pubTitle <- c()
  pubUrl <- c()
  
  url <- "https://www.postcourier.com.pg/sports/"
  
  validate_pg <- page_validate(pages, url)
  
  if(is.null(validate_pg)) {
    
  } else {
  
  cat("Scraping Now...\n")
  
  # While-loop
  while (i <= total_pages) {
    
    page <- read_html(url)
    
    pc_topstories <- page %>%
      html_nodes("#main .entry-title a")
    
    pc_topstories_title <- pc_topstories %>%
      html_text()
    pubTitle <- append(pubTitle, pc_topstories_title)
    
    pc_topstories_url <- pc_topstories %>%
      html_attr("href")
    pubUrl <- append(pubUrl, pc_topstories_url)
    
    pc_topstories_date <- page %>%
      html_nodes("#main .published") %>%
      html_text()
    pubDate <- append(pubDate, pc_topstories_date)
    
    message("Page ", i, " of ", total_pages, " scraped.\n")
    
    i <- i + 1
    
    # Next page url
    url <- page %>%
      html_nodes(".next") %>%
      html_attr("href")
    
  }
  
  # Create tibbles from vectors
  df <- tibble(
    Pub.Date = pubDate,
    Top.Stories = pubTitle,
    URL = pubUrl
  )
  
  cat("Scraping Completed!\n")
  
  return(df)
  }
}