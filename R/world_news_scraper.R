#' World News Scraper
#' 
#' Scrapes world news articles from the post-courier news website
#' @param pages Takes an integer value as input. This allows the script to page through the website.
#' @return Returns an object of class 'tibble'
#' @examples 
#' df <- world(pages = 1);
#' df2 <- world(1);
#' @name world
#' @import rvest 
#' @import tidyverse 
#' @import tibble
#' @export

library(rvest)
library(tidyverse)
library(tibble)

world <- function(pages){
  
  cat("Scraping Now...\n")
  
  total_pages <- as.numeric(pages)
  # while-loop counter
  i <- 1
  
  # Empty vectors for tibble
  pubDate <- c()
  pubTitle <- c()
  pubUrl <- c()
  
  url <- "https://www.postcourier.com.pg/world-news/"
  
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
