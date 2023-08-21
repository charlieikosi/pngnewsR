# pngnewsR <img src='man/figures/pngnewsR.png' align="right" height="139" />

[![license](https://img.shields.io/badge/license-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
[![pngnewsR badge](https://img.shields.io/badge/pngnewsR-under%20development%20-yellow)]()
[![R badge](https://img.shields.io/badge/Built%20with-♥%20and%20R-pink)](https://github.com/charlieikosi/pngnewsR/)
[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#active)
### Introduction
The `pngnewsR`is an open-source webscraper package that scrapes the Post-Courier news website which is a Papua New Guinean newspaper for news articles. Its expectation is that the data derived from the packages functions provide the first steps of data collection towards news sentiment analysis. `pngnewsR` does this in such a way that its outputs are in tabular form and can further be worked on by other R package functions.

#### Installation

To be able to use this package, you will need to first install [R and RStudio](https://posit.co/download/rstudio-desktop/) into your machine.

Once that has downloaded and installed, run the following script below:

```
library(devtools) 
install_github("charlieikosi/pngnewsR")
```
#### Load Package
Load the package using the script:
```
library(pngnewsR)
```
This allows you to utilize several of `pngnewsR`'s webscraping functions. These functions are named against the category of news articles hosted on the Post-Courier news website to make things simple.

##### Available Functions
- `business()` scrapes only business news articles
- `feature()` scrapes only featured news articles
- `topstories()` scrapes only top story news articles
- `world()` scrapes only world news articles
- `sport()` scrapes only sport news articles
- `scrape_news()` versatile scraper function that can be used to call the other functions.

##### Usage
All the functions except the `scrape_news()` take only one arguement, `pages`. `pages` argument must be an integer. 
`scrape_news()` takes two arguments, `pages` and `news`. `news` argument takes in a character string and must be either `"business", "sport", "world", "national", "topstories", "feature"`.
##### Examples
```
business_df <- business(page=1)
topstories_df <- topstories(1)
num <- 1
sport_df <- sport(num)
topstories_df2 <- scrape_news(page=2,news="topstories")
```

