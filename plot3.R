#  Exploratory Data Analysis - Course Project No. 1
##  Oscar Saúl Navarro-Morato
##  May / 2015

## R code to create a plot 1.

# Assumes that the file to read is located in the workspace

data <- read.csv2("household_power_consumption.txt", header = TRUE, 
                  na.strings = "?",stringsAsFactors = FALSE)

# Data type convertion

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

# Subsetting data

newdata <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")

# Plot 3

par(mfrow = c(1, 1), bg = "transparent")

png(file = "plot3.png", bg = "transparent")
plot(newdata$Sub_metering_1, ann = FALSE, type= "n", axes = FALSE, frame.plot = TRUE)
lines(newdata$Sub_metering_1, col = "black")
lines(newdata$Sub_metering_2, col = "red")
lines(newdata$Sub_metering_3, col = "blue")

# Setting the axis labels

axis(2)
xticks <- seq(0, 2880, 1440)
xlabels <- c("Thu", "Fri", "Sat")
axis(1, at = xticks, labels = xlabels)

# Setting titles an legend

title(xlab = "", ylab = "Energy sub metering")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       cex = 0.7)
dev.off()
