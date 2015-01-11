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

plot(Data$Datetime,Data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()