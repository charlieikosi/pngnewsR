#' Post Courier News Article Scraper
#' 
#' Scrapes any news articles from the postcourier news website
#' @param pages Takes an integer value as input. This allows the script to page through the website.
#' @param news News tab from which to scrape articles. Allowable news tabs are 'business', 'feature', 'national','sports','topstories' and 'world'.
#' @return Returns an object of class 'tibble'
#' @examples 
#' df <- scrape_news(pages = 1, news = 'business');
#' df2 <- scrape_news(1,'business');
#' @name scrape_news
#' @export

#source("business_news_scraper.R")
#source("feature_news_scraper.R")
#source("national_news_scraper.R")
#source("sport_news_scraper.R")
#source("world_news_scraper.R")
#source("topstories_news_scraper.R")


scrape_news <- function(pages, news) {
  
  if (is.character(news)) {
    if (news == "national") {
      national(pages)
    }
    else if (news == "business") {
      business(pages)
    }
    else if (news == "feature") {
      feature(pages)
    }
    else if (news == "sport") {
      sport(pages)
    }
    else if (news == "world") {
      world(pages)
    }
    else if (news == "topstories") {
      topstories(pages)
    } else {
      print("Error! Please use either 'national', 'world', 'sport', 'feature', 'topstories' or 'business' as string inputs for the news argument")
    }
  } else {
    print("Error! The news argument should be a character string.")
  }
}

