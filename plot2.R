##  Exploratory Data Analysis - Course Project No. 1
##  Oscar Saúl Navarro-Morato
##  May / 2015

## R code to create plot 2.

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

# Plot 2 / png() size image 480 x 480 by default.

par(mfrow = c(1, 1), bg = "transparent")

png(file = "plot2.png", bg = "transparent")
plot(newdata$Global_active_power, type= "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)", axes = FALSE, frame.plot = TRUE)

# Setting the axis labels

axis(2)
xticks <- seq(0, 2880, 1440)
xlabels <- c("Thu", "Fri", "Sat")
axis(1, at = xticks, labels = xlabels)
dev.off()
