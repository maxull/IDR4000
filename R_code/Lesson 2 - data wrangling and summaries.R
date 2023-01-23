# lesson 2 - Data wrangling and creating summaries

library(tidyverse); library(readxl)

# how pipe operator wprks %>% 
# function_1(data) %>% function_2(data_transformed) %>% function_2(data_transformed2)

cyclingStudy <- read_excel("./data/cyclingStudy.xlsx", na = "NA")

cyclingStudy %>% 
        mutate(sqj.bm = sj.max/weight.T1) %>% 
        select(1,2,3,102) %>% 
        print()

# how many timepoints do i have

cyclingStudy %>% 
        distinct(timepoint)


# get df of pre timepoint

cyclingStudy %>% 
        filter(timepoint == "pre")

# if you want two conditions

cyclingStudy %>% 
        filter(timepoint %in% c("pre", "meso1"))

# if you want to filter based on value in one of the columns

cyclingStudy %>% 
        filter(sj.max > 30)

# multiple filtering

cyclingStudy %>% 
        filter(timepoint == "pre", sj.max > 30)

# arrange dataset in descending order

cyclingStudy %>% 
        arrange(desc(sj.max))


# group by and sumamrise

cyclingStudy %>% 
        group_by(timepoint) %>% 
        summarise(m = mean(sj.max, na.rm = TRUE),
                  s = sd(sj.max, na.rm = TRUE))


# calculate the sj.max as a % of the timepoint mean
cyclingStudy %>% 
        group_by(timepoint) %>% 
        mutate(sqjmp = (sj.max / mean(sj.max)*100)) %>% 
        select(subject, timepoint, sj.max, sqjmp)
        

############################################################

### more data wrangling - pivoting


cyclingStudy %>% 
        select(subject ,timepoint, lac.125:lac.375)             # lac.125:lac.375 gives us all columns between these to columns, including them aswell

# pivot longer   
       
cyclingStudy %>% 
        select(subject ,timepoint, lac.125:lac.375) %>% 
        pivot_longer(names_to = "watt", 
                     values_to = "lactate", 
                     cols = lac.125:lac.375,
                     names_prefix = "lac.",            # remove the prefix from column names
                     names_transform = list(watt = as.numeric))

        
# pivot wider, calculate % change and save in new element

change_df <- cyclingStudy %>% 
        select(subject, timepoint,sj.max) %>% 
        pivot_wider(names_from = timepoint, values_from = sj.max) %>% 
        mutate(change = ((meso1/pre)-1)*100)              # calculate % change

        
        