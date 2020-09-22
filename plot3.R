#read in data
allData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

#convert data and time variables
allData$Date <- as.Date(allData$Date, "%d/%m/%Y")
allData$DateTime <- paste(allData$Date, allData$Time)
allData$DateTime <- strptime(allData$DateTime, "%Y-%m-%d %H:%M:%S")

#subset data
startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")
selected <- subset(allData, (allData$Date == startDate | allData$Date == endDate))

#open png graphics device
png("plot3.png")

#make plot
plot(selected$DateTime, selected$Sub_metering_1, type = "l", xlab = NA, ylab = "Energy sub metering")
lines(selected$DateTime, selected$Sub_metering_2, col = "red")
lines(selected$DateTime, selected$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

#close graphics device
dev.off()
