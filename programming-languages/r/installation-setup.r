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
        "magrittr",
        "pacman",
        "Hmisc",
        "forcats",
        "readr",                    # handling csv

        ## datasets
        "palmerpenguins",           # good replacement for iris data

        ## Courses
        "swirl", # number of courses make use of this

        ## greater depth
        "purrr",
        "devtools",
        "rlang",
        "tidyverse",
        "reticulate",
        "Rmisc",
        "VIM",
        "shiny",
        "corrr",

        ## plotting
        "highcharter",
        "plotly",
        "ggplot2",
        "cowplot",
        "ggpubr",

        ## investing
        "tibbletime",
        "tidyquant",
        "PortfolioAnalytics",
        "PerformanceAnalytics",
        "quantmod",

        ## machine learning
        "caret",                    # machine learning framework
        "mlr3",                     # machine learning framework
        "janitor",                  # cleaning data
        "sjmisc",
        "skimr",
        "vtreat",
        "tidymodels", # machine learning framework (caret 2.0)
        "kknn",   # k-nearest neighbour regression package
        "ranger", # linear regression package

        ## document creation
        "rticles"
    ))

## machine learning
#devtools::install_github('topepo/caret/pkg/caret')
####devtools::install_github("sfirke/janitor")
#devtools::install_github("ropensci/skimr")


## For bioinformatics
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("edgeR")


## for install rmarkdown
install.packages(c("knitr"
                   ))


## For themes
devtools::install_github('cttobin/ggthemr')
devtools::install_github('bbc/bbplot')
