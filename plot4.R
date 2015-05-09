##  Exploratory Data Analysis - Course Project No. 1
##  Oscar Saúl Navarro-Morato
##  May / 2015

## R code to create a plot 4.

# Assumes that the file to read is located in the workspace

data <- read.csv2("household_power_consumption.txt", header = TRUE, 
                  na.strings = "?",stringsAsFactors = FALSE)

# Data type convertion

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)

# Subsetting data

newdata <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")

# Plot 4

png(file = "plot4.png", bg = "transparent")
par(mfrow = c(2, 2), bg = "transparent")
with(newdata,
{  
    plot(newdata$Global_active_power, type= "l", xlab = ""
         , ylab = "Global Active Power (kilowatts)", axes = FALSE, frame.plot = TRUE)
    axis(2)
    xticks <- seq(0, 2880, 1440)
    xlabels <- c("Thu", "Fri", "Sat")
    axis(1, at = xticks, labels = xlabels)
    
    plot(newdata$Voltage, type= "l", xlab = "datetime", ylab = "Voltage"
         , axes = FALSE, frame.plot = TRUE)
    axis(2)
    xticks <- seq(0, 2880, 1440)
    xlabels <- c("Thu", "Fri", "Sat")
    axis(1, at = xticks, labels = xlabels)
    
    plot(newdata$Sub_metering_1, ann = FALSE, type= "n", axes = FALSE, frame.plot = TRUE)
    lines(newdata$Sub_metering_1, col = "black")
    lines(newdata$Sub_metering_2, col = "red")
    lines(newdata$Sub_metering_3, col = "blue")
    axis(2)
    xticks <- seq(0, 2880, 1440)
    xlabels <- c("Thu", "Fri", "Sat")
    axis(1, at = xticks, labels = xlabels)
    title(xlab = "", ylab = "Energy sub metering")
    legend("topright", lty = 1, col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           bty = "n", cex = 0.7)
    
    plot(newdata$Global_reactive_power, type= "l", xlab = "datetime", 
         ylab = "Global_reactive_power", axes = FALSE, frame.plot = TRUE)
    axis(2)
    xticks <- seq(0, 2880, 1440)
    xlabels <- c("Thu", "Fri", "Sat")
    axis(1, at = xticks, labels = xlabels)
})
dev.off()
