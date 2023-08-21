#' Page Validate
#' 
#' Function that validates the page argument in the pngnewsR package functions.
#' @param pages Takes an integer value as input needing validation.
#' @param url A web address as a character string or an object of character string. 
#' @return If validation passes, function returns an integer or returns NULL if fails.
#' @examples
#' url <- "https://www.postcourier.com.pg/new-category/features-news/";
#' validation_1 <- page_validate(1000000, url);
#' validation_2 <- page_validate(1, url);
#' @name page_validate
#' @import rvest 
#' @import tidyverse 
#' @import tibble
#' @export

library(rvest)

page_validate <- function(pages, url) {
  
  message("\nValidating page argument...\n")
  
  # Convert to numeric
  page_num <- read_html(url)
  num <- page_num %>% html_nodes(".dots+ .page-numbers") %>%
    html_text()
  number <- as.numeric(gsub(",", "", num))
  
  # Check
  if (pages <= number) {
    cat( "\033[32m","Validation Passed\n")
    return(number)
  } else {
    message("Error:Page argument beyond webpage range.\n")
    return(NULL)
  }
}
