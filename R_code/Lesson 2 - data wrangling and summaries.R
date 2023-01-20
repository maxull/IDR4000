# lesson 2 - Data wrangling and creating summaries

library(tidyverse); library(readxl)

# how pipe operator wprks %>% 
# function_1(data) %>% function_2(data_transformed) %>% function_2(data_transformed2)

cyclingStudy <- read_excel("./data/cyclingStudy.xlsx", na = "NA")

cyclingStudy %>% 
        mutate(sqj.bm = sj.max/weight.T1) %>% 
        select(1,2,3,102) %>% 
        print()
