# lesson 1 importing data

library(readxl)
library(readr)

cyclingStudy <- read_excel("./data/cyclingStudy.xlsx", na = "NA")

# download file of the internett

hypertrophy1 <- read_csv("https://ndownloader.figstatic.com/files/14702420")

#save file of the internet to data folder

download.file(url = "https://ndownloader.figstatic.com/files/14702420", destfile ="./data/hypertrophy1.csv")

# view data

cyclingStudy
hypertrophy1


