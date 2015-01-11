RawData <- read.table("./data/household_power_consumption.txt", 
                      header=TRUE, 
                      sep=";", 
                      stringsAsFactors=FALSE, 
                      dec=".",
                      na = "?")
Data <- RawData[RawData$Date %in% c("1/2/2007","2/2/2007") ,]
rm(RawData)
hist(Data$Global_active_power, 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()