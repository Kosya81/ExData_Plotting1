file <- "household_power_consumption.txt"
DT <- read.table(file, sep=";", header=T, na.strings="?",colClasses=c("character", "character", rep("numeric", 7)))
DT$Date <- as.Date(DT$Date, format="%d/%m/%Y")

Subdata <- DT[DT$Date == as.Date("2007-02-01") | DT$Date == as.Date("2007-02-02"),]
#Subdata <- Subdata[Subdata$Global_active_power != "NA"]
Subdata$DateTime <- as.POSIXlt(paste(Subdata$Date, Subdata$Time, sep=" "))

#2nd plot line-plot
png(filename='plot2.png', width=480, height=480)
plot(Subdata$DateTime, Subdata$Global_active_power,
     ylab='Global Active Power (kilowatts)', xlab='', type='l')
dev.off()