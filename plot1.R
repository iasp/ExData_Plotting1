# Reading data
library(tidyverse)
DataSet <- read.table("/Users/andreaaraujo/Documents/Exploratory Data Analysis in R/Coursera/household_power_consumption.txt", sep = ";", header = TRUE)
DoisDias <- c("1/2/2007", "2/2/2007")
DoisDiasData <- filter(DataSet, DataSet$Date %in% DoisDias)
DoisDiasData$Date <- dmy(DoisDiasData$Date)
DoisDiasData$Global_active_power <- as.numeric(DoisDiasData$Global_active_power)

# Building plot
hist(DoisDiasData$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     col = "red")

# Creating PNG file
dev.copy(device = png, width = 480, height = 480, file = "plot1.png")
dev.off()
