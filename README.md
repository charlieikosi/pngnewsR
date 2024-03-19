# pngnewsR <img src='man/figures/pngnewsR.png' align="right" height="139" />

[![license](https://img.shields.io/badge/license-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
[![pngnewsR badge](https://img.shields.io/badge/pngnewsR-under%20development%20-yellow)]()
[![R badge](https://img.shields.io/badge/Built%20with-♥%20and%20R-pink)](https://github.com/charlieikosi/pngnewsR/)
[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#active)

#### Introduction

The `pngnewsR`is an open-source webscraper package that scrapes the news articles from three website in Papua New Guinea: Loop PNG, Post-Courier and The National. Its expectation is that the data derived from the packages functions provide the first steps of data collection towards news sentiment analysis. `pngnewsR` does this in such a way that its outputs are in tabular form and can further be worked on by other R package functions.

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
This allows you to utilize several of `pngnewsR`'s webscraping functions.

##### Available Functions
- `business_lp()` scrapes only business news articles from loop png news website
- `business_na()` scrapes only business news articles from the national news website
- `business_pc()` scrapes only business news articles from the post courier news website
- `feature()` scrapes only featured news articles from the post courier news website
- `topstories_pc()` scrapes only top story news articles from the post courier news website
- `national_lp()` scrapes only national news articles from loop png news website
- `national_na()` scrapes only national news articles from the national news website
- `national_pc()` scrapes only national news articles from post courier news website
- `world_pc()` scrapes only world news articles from post courier news website
- `sport_lp()` scrapes only sport news articles from loop png news website
- `sport_na()` scrapes only sport news articles from the national news website
- `sport_pc()` scrapes only sport news articles from post courier news website
- `scrape_news()` scraper function that can be used to call other functions listed above.

##### Usage
All functions except the `scrape_news()` take only one arguement, `pages` which must be an integer. 

`scrape_news()` takes three arguments i.e. `pages` and `news` and `agent`. The `news` argument takes in a character string and must be either `"business", "sport", "world", "national", "topstories" or "feature"`. The `agent` argument takes in character strings and must either be "postcourier", "looppng" or "thenational".
##### Examples
```
business_df <- business_lp(page=1)
topstories_df <- topstories_pc(1)
num <- 1
sport_df <- sport_lp(num)
topstories_df2 <- scrape_news(page=2,news="topstories", "postcourier)
```
##### Outputs
`pngnewsR` functions endeavour to structure all scrapped data into tabular form as a tibble. Three columns make up the tabular data:
- Pub.Date - date of publication
- Top.Stories - title of news articles
-  URL - article url from which it was scrapped

```
# A tibble: 10 × 3
   Pub.Date        Top.Stories                                        URL                             
   <chr>           <chr>                                              <chr>                           
 1 August 21, 2023 Garap: Kerevat jail needs urgent govt intervention https://www.postcourier.com.pg/…
 2 August 21, 2023 OSICA calls to support locally produced rice       https://www.postcourier.com.pg/…
 3 August 21, 2023 Bands sign contract with Big Records               https://www.postcourier.com.pg/…
 4 August 21, 2023 Danny’s Travel – My Experience with Traffic in POM https://www.postcourier.com.pg/…
 5 August 18, 2023 Chasing My Dream                                   https://www.postcourier.com.pg/…
 6 August 18, 2023 Bilum sales add extra income to a Mum              https://www.postcourier.com.pg/…
 7 August 18, 2023 UPNG Geology Student helped develop his community  https://www.postcourier.com.pg/…
 8 August 18, 2023 Cleaner by day, taxi driver at night               https://www.postcourier.com.pg/…
 9 August 18, 2023 Perfect taxi condition for my customers’ safety    https://www.postcourier.com.pg/…
10 August 18, 2023 Frangipani Festival set                            https://www.postcourier.com.pg/…
> 
```
#### Demonstration
To demonstrate the pngnewsR package functions, we have created a basic [rshiny app](https://niuginitravelor.shinyapps.io/pngnewsRApp/) that will enable non-coders to work on the front-end which is user friendly. We've also included an added option to download the scraped data as a .csv

![](man/figures/shiny.png)



