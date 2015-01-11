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

plot(Data$Datetime, Data$Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(Data$Datetime, Data$Sub_metering_2, col = "red")
lines(Data$Datetime, Data$Sub_metering_3, col = "blue")
legend("topright", 
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2.5)
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
