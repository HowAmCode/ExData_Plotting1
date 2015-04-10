#Plot 1, histogram of Global Active Power results from 01/02/2007 - 02/02/2007
#Output is exported to 480x480 pixel PNG

data <- fread("household_power_consumption.txt",sep=";",header=TRUE,na.string="?", colClasses= c(rep("character",2),rep("numeric",7)))
useData <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007"]

png(file="plot1.png", width=480, height=480)
hist(as.numeric(useData$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()