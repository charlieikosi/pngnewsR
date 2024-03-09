#' News Article Scraper
#' 
#' Scrapes any news articles from the news website
#' @param pages Takes an integer value as input. This allows the script to page through the website.
#' @param news News tab from which to scrape articles. Allowable news tabs are 'business', 'feature', 'national','sports','topstories' and 'world'.
#' @param agent Name of News Agency to scrape articles from. Supports three news outlets: 'postcourier', 'looppng' and 'thenational'.
#' @return Returns an object of class 'tibble'
#' @examples 
#' df <- scrape_news(pages = 1, news = 'business', agent = 'thenational');
#' df2 <- scrape_news(1,'business','thenational');
#' @name scrape_news
#' @export

#source("pc_business_news_scraper.R")
#source("pc_feature_news_scraper.R")
#source("pc_national_news_scraper.R")
#source("pc_sport_news_scraper.R")
#source("pc_world_news_scraper.R")
#source("pc_topstories_news_scraper.R")
#source("na_national_news_scraper.R")
#source("na_business_news_scraper.R")
#source("na_sport_news_scraper.R")
#source("lp_sport_news_scraper.R")
#source("lp_national_news_scraper.R")
#source("lp_business_news_scraper.R")

scrape_news <- function(pages, news, agent) {
  
  if (is.numeric(pages) && is.character(news) && is.character(agent)) {
    if (news == "national" && agent == "thenational") {
      national_na(pages)
    }
    else if (news == "national" && agent == "postcourier") {
      national_pc(pages)
    }
    else if (news == "national" && agent == "looppng") {
      national_lp(pages)
    }
    else if (news == "business" && agent == "thenational") {
      business_na(pages)
    }
    else if (news == "business" && agent == "postcourier") {
      business_pc(pages)
    }
    else if (news == "business" && agent == "looppng") {
      business_lp(pages)
    }
    else if (news == "topstories" && agent == "thenational") {
      message("news categorgy 'topstories' is non-existant. Reverting to national_na() instead.")
      national_na(pages)
    }
    else if (news == "topstories" && agent == "postcourier") {
      topstories_pc(pages)
    }
    else if (news == "topstories" && agent == "looppng") {
      message("news categorgy 'topstories' is non-existant. Reverting to national_lp() instead.")
      national_lp(pages)
    }
    else if (news == "sport" && agent == "thenational") {
      sport_na(pages)
    }
    else if (news == "sport" && agent == "postcourier") {
      sport_pc(pages)
    }
    else if (news == "sport" && agent == "looppng") {
      sport_lp(pages)
    } else {
      print(paste(message("Error! Ensure news and agent arguments are correct. See argument usage notes.")))
    }
    
  } else {
    print(paste(message("Error!: Please ensure arguments are in correct format.")))
  }
}
  