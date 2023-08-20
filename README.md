# pngnewsR

### Introduction
`pngnewsR` is an open-source package developed to automate webscrapping of news articles from the Post-Courier news website. Post-Courier is Papua New Guinea based newspaper. 

The package was built to function as a webscraper that scrapes the Post-Courier website for news articles and providing the basis for which further analysis can be made from such as sentiment analysis.

#### Installation
To begin using `pngnewsR`, install by running the script below:

```
library(devtools) 
install_github("charlieikosi/pngnewsR")
```

#### Load Package
Once installation has completed, load the package:
```
library(pngnewsR)
```
This now allows you to utilize several of `pngnewsR`'s webscraping functions. These functions are named against the category of news articles hosted on the Post-Courier news website to make things simple for the user.

##### Available Functions
- `business()` scrapes only business news articles
- `feature()` scrapes only featured news articles
- `topstories()` scrapes only top story news articles
- `world()` scrapes only world news articles
- `sport()` scrapes only sport news articles
- `scrape_news()` versatile scraper function that can be used to call the other functions.

##### Usage
All the functions except the `scrape_news()` take only one arguement, `pages`.
