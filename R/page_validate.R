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

# Examples
#validation_1 <-page_validate(1000000, "https://www.postcourier.com.pg/new-category/features-news/")
#validation_2 <-page_validate(1, "https://www.postcourier.com.pg/new-category/features-news/")

