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
png("plot1.png")

#create plot 1
hist(as.numeric(selected$Global_active_power), xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

#close graphics device
dev.off()


