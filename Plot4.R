RawData <- read.table("./data/household_power_consumption.txt", 
                      header=TRUE, 
                      sep=";", 
                      stringsAsFactors=FALSE, 
                      dec=".",
                      na = "?")
Data <- RawData[RawData$Date %in% c("1/2/2007","2/2/2007") ,]
rm(RawData)
Data$Date <- as.Date(Data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(Data$Date), Data$Time)
Data$Datetime <- as.POSIXct(datetime)

par(mfrow = c(2, 2))
## Top-left
plot(Data$Datetime, Data$Global_active_power, 
     type = "l",
     xlab = "", ylab = "Global Active Power")
## Top-right
plot(Data$Datetime,Data$Voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage")
## Bottom-left
plot(Data$Datetime, Data$Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(Data$Datetime, Data$Sub_metering_2, col = "red")
lines(Data$Datetime, Data$Sub_metering_3, col = "blue")
# Remove the border of legend here.
legend("topright", 
       bty = "n",
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2)
## Bottom-right
plot(Data$Datetime, Data$Global_reactive_power, 
     type = "l",
     col = "black",
     xlab = "datetime", ylab = "Global_reactive_power")
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
