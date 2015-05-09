##  Exploratory Data Analysis - Course Project No. 1
##  Oscar Saúl Navarro-Morato
##  May / 2015

## R code to create plot 1.

library(plyr)
library(dplyr)

# Assumes that the file to read is located in the workspace

data <- read.csv2("household_power_consumption.txt", header = TRUE, 
                  na.strings = "?",stringsAsFactors = FALSE)

# Data type convertion

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)

# Subsetting data

newdata <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")

# Plot 1 / png() size image 480 x 480 by default.

png(file = "plot1.png", bg = "transparent") 
hist(newdata$Global_active_power, col = "red", breaks = 12, 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
