#Plot 4, various graphs
#Results from 01/02/2007 - 02/02/2007
#Output is exported to 480x480 pixel PNG

data <- fread("household_power_consumption.txt",sep=";",header=TRUE,na.string="?", colClasses= c(rep("character",2),rep("numeric",7)))
useData <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007"]
dates <- as.Date(useData$Date, format='%d/%m/%Y')
times <- useData$Time
dateTime <- strptime(paste(dates,times), "%Y-%m-%d %H:%M:%S")

png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(dateTime, useData$Global_active_power, xlab="", ylab="Global Active Power", type="n")
lines(dateTime, useData$Global_active_power)

plot(dateTime, useData$Voltage, type="n",
ylab="Voltage")
lines(dateTime, useData$Voltage)

plot(dateTime, useData$Sub_metering_1, type="n",
xlab="", ylab="Energy sub metering")
lines(dateTime, useData$Sub_metering_1)
lines(dateTime, useData$Sub_metering_2, col="red")
lines(dateTime, useData$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1), col = c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(dateTime, useData$Global_reactive_power, type="n", 
ylab="Global_reactive_power")
lines(dateTime, useData$Global_reactive_power)
dev.off()