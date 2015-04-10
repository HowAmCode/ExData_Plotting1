#Plot 2, scatterplot of Time vs Global Active Power 
#Results from 01/02/2007 - 02/02/2007
#Output is exported to 480x480 pixel PNG

data <- fread("household_power_consumption.txt",sep=";",header=TRUE,na.string="?", colClasses= c(rep("character",2),rep("numeric",7)))
useData <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007"]
dates <- as.Date(useData$Date, format='%d/%m/%Y')
times <- useData$Time
dateTime <- strptime(paste(dates,times), "%Y-%m-%d %H:%M:%S")

png(file="plot2.png", width=480, height=480)
plot(dateTime, useData$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="n")
lines(dateTime, useData$Global_active_power)
dev.off()