#!/usr/bin/env R

local({r <- getOption("repos")
       r["CRAN"] <- "http://cran.r-project.org"
       options(repos=r)
})

# following code sets up ein-R
# thanks to:
# http://johnlaudun.org/20151008-more-on-jupyter/
###install.packages(c('rzmq','repr','IRkernel','IRdisplay'), repos = c('http://irkernel.github.io/', getOption('repos')))
###IRkernel::installspec()


install.packages(
    c(
        "httr",
        "jsonlite",
        "lubridate",

        ## Courses
        "swirl",

        ## greater depth
        "purrr",
        "devtools",
        "rlang",
        "tidyverse",
        "reticulate",
        "Rmisc",
        "VIM",
        "shiny",

        ## plotting
        "highcharter",
        "plotly",
        "ggplot2",
        "cowplot",

        ## investing
        "tibbletime",
        "tidyquant",
        "PortfolioAnalytics",
        "PerformanceAnalytics",
        "quantmod",

        ## machine learning
        "caret",
        "janitor",
        "readr",
        "sjmisc",
        "skimr",
        "tidyverse",
        "vtreat"
    ))

## machine learning
#devtools::install_github('topepo/caret/pkg/caret')
####devtools::install_github("sfirke/janitor")
#devtools::install_github("ropensci/skimr")

## for install rmarkdown
install.packages(c("knitr"
                   ))


## For themes
devtools::install_github('cttobin/ggthemr')
devtools::install_github('bbc/bbplot')
