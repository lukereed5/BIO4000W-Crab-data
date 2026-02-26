README
================
Luke Reed
2026-02-20

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax
for authoring HTML, PDF, and MS Word documents. For more details on
using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that
includes both content as well as the output of any embedded R code
chunks within the document. You can embed an R code chunk like this:

``` r
summary(cars)
```

    ##      speed           dist       
    ##  Min.   : 4.0   Min.   :  2.00  
    ##  1st Qu.:12.0   1st Qu.: 26.00  
    ##  Median :15.0   Median : 36.00  
    ##  Mean   :15.4   Mean   : 42.98  
    ##  3rd Qu.:19.0   3rd Qu.: 56.00  
    ##  Max.   :25.0   Max.   :120.00

## Including Plots

You can also embed plots, for example:

![](README_files/figure-gfm/pressure-1.png)<!-- -->

Note that the `echo = FALSE` parameter was added to the code chunk to
prevent printing of the R code that generated the plot.

## 

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/lukereed5/BIO4000W-Crab-data/main)

This project aims so study the population structure and dynamics of the
population of invasive green crabs ar Ganzekraal on the West Coast. The
data was collected at night, an hour before the spring low tide. For an
hour 4 people searched for and caught as many crabs as they could, after
which the crabs were all weighed, measured for length and width, sexed
and any missing limbs or presence of eggs was noted.

The data for this project is Green Crab Ganzekraal.csv, within the Data
folder. Each crab is numbered by sampling mission and individual per
mission. So the 5th crab of the first mission will be 1.5 and so on.
Width.Carapace and Length.Carapace and the width and length of each
crabs carapace, Weight and Sex are the wight and sex of each crab,
Beried is whether or not the crab has eggs. Habitat is either Wall,
Open, or Pool, which are the 3 different areas in which we found the
crabs. Misssing.Chelae and Missing.Walking.Leg indicate whether or not
the crab was missing any of its limbs, and how many. This was only
recorded from the 2nd sampling mission onwards. Date is the date of
capture.
