#' Sport News Scraper (Loop PNG)
#' 
#' Scrapes sports news articles from loop png website
#' @param pages Takes an integer value as input. This allows the script to page through the website.
#' @return Returns an object of class 'tibble'
#' @examples 
#' df <- sport_lp(pages = 1);
#' df2 <- sport_lp(1);
#' @name sport_lp
#' @import rvest 
#' @import tidyverse 
#' @import tibble
#' @export

library(rvest)
library(tidyverse)
library(tibble)

sport_lp <- function(pages){

  total_pages <- as.numeric(pages)
  # while-loop counter
  i <- 1
  
  # Empty vectors for tibble
  pubDate <- c()
  pubTitle <- c()
  pubUrl <- c()
  
  url <- "https://www.looppng.com/section/37806"

  cat("Scraping Now...\n")
  
  # While-loop
  while (i <= total_pages) {
    
    page <- read_html(url)
    
    pc_topstories <- page %>%
      html_nodes(".news-title a")
    
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
        base_url <- "https://www.looppng.com"
        pc_topstories_url <- paste(base_url,pc_topstories_url, sep="")
        
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
          html_nodes(".news-posted") %>%
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
      html_nodes(".pager-next a") %>%
      html_attr("href")
    url <- paste(base_url,url, sep="")
    
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




