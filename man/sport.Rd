% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sport_news_scraper.R
\name{sport}
\alias{sport}
\title{Sports News Scraper}
\arguments{
\item{pages}{Takes an integer value as input. This allows the script to page through the website.}
}
\value{
Returns an object of class 'tibble'
}
\description{
Scrapes sports news articles from the post-courier news website
}
\examples{
df <- sport(pages = 1);
df2 <- sport(1);
}
