#' Article Content Scraper (Papua New Guinea News Websites)
#' 
#' Scrapes news article contents from either post-courier, loop png or the national news websites.
#' @param url Takes a character url as input.
#' @return Returns an object of class 'character'
#' @examples
#' url <- "https://www.looppng.com/business/fiscal-stability-agreement-p%E2%80%99nyang-signed-125267" 
#' content <- article_content(url);
#' @name article_content
#' @import rvest
#' @export

library(rvest)
library(dplyr)
library(utils)
library(httr)

article_content <- function(url){
  
  # Assign base url (hostname) as objects
  COND1 <- "www.looppng.com"
  COND2 <- "www.postcourier.com.pg"
  COND3 <- "www.thenational.com.pg"
  
  # Parse url argument
  parsed_url <- parse_url(url)
  
  # Extract hostname from parsed url
  base_url <- parsed_url$hostname
  
  # Validate url argument
  
  if (is.character(url)) {
    
    # Logical statement
    if (base_url == COND2 | base_url == COND3)
    {
      URL <- URLencode(url)
      page <- read_html(URL)
      article <- page %>% html_nodes(".entry-content") %>%
        html_text()
      return(article)
    } else if (base_url == COND1) {
      
      URL <- URLencode(url)
      page <- read_html(URL)
      article <- page %>% html_nodes(".field-type-text-with-summary .even") %>%
        html_text()
      return(article)
    } else {
      message("Invalid URL.\nUrl must be of either Post-courier, Loop PNG or The National only")
      return(NULL)
    }
  } else {
    message("Invalid class argument. Enter url of class 'character'.")
    return(NULL)
  }
}
