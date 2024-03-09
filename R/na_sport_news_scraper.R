#' Sports News Scraper (The National News Paper)
#' 
#' Scrapes sports news articles from the national news website
#' @param pages Takes an integer value as input. This allows the script to page through the website.
#' @return Returns an object of class 'tibble'
#' @examples 
#' df <- sport_na(pages = 1);
#' df2 <- sport_na(1);
#' @name sport_na
#' @import rvest 
#' @import tidyverse 
#' @import tibble
#' @export

library(rvest)
library(tidyverse)
library(tibble)

sport_na <- function(pages){
  
  total_pages <- as.numeric(pages)
  # while-loop counter
  i <- 1
  
  # Empty vectors for tibble
  pubDate <- c()
  pubTitle <- c()
  pubUrl <- c()
  
  url <- "https://www.thenational.com.pg/category/sports/"
  
  # While-loop
  while (i <= total_pages) {
    
    page <- read_html(url)
    
    pc_topstories <- page %>%
      html_nodes(".entry-title a")
    
    tryCatch(
      {
        pc_topstories_title <- pc_topstories %>%
          html_text()
        if (length(pc_topstories_title) == 0) {
          pc_topstories_title <- "NA"
        } 
      },
      error=function(e) {
        message("An error occured")
        pc_topstories_title <- "NA"
      })
    
    pubTitle <- append(pubTitle, pc_topstories_title)
    
    tryCatch(
      {
        pc_topstories_url <- pc_topstories %>%
          html_attr("href")
        if (length(pc_topstories_url) == 0) {
          pc_topstories_url <- "NA"
        } 
      },
      error=function(e) {
        message("An error occured")
        pc_topstories_url <- "NA"
      })
    
    pubUrl <- append(pubUrl, pc_topstories_url)
    
    tryCatch( 
      {
        pc_topstories_date <- page %>%
          html_nodes(".updated") %>%
          html_text()
        if (length(pc_topstories_date) == 0) {
          pc_topstories_date <- "NA"
        }
        
      },
      
      error=function(e) {
        message("An error ocurred")
        pc_topstories_date <- "NA"
      })
    
    pubDate <- append(pubDate, pc_topstories_date)
    
    message("Page ", i, " of ", total_pages, " scraped.\n")
    
    i <- i + 1
    
    # Next page url
    url <- page %>%
      html_nodes(".nav-previous a") %>%
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
