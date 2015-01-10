file <- "household_power_consumption.txt"
DT <- read.table(file, sep=";", header=T, na.strings="?",colClasses=c("character", "character", rep("numeric", 7)))
DT$Date <- as.Date(DT$Date, format="%d/%m/%Y")

Subdata <- DT[DT$Date == as.Date("2007-02-01") | DT$Date == as.Date("2007-02-02"),]
#Subdata <- Subdata[Subdata$Global_active_power != "NA"]
Subdata$DateTime <- as.POSIXlt(paste(Subdata$Date, Subdata$Time, sep=" "))

#4th plot
png(filename='plot4.png', width=480, height=480)

#use panel 2x2
par(mfrow=c(2,2))

#top left - 2nd plot
plot(Subdata$DateTime, Subdata$Global_active_power,
     ylab='Global Active Power (kilowatts)', xlab='', type='l')

#top right
plot(Subdata$DateTime, Subdata$Voltage,
     ylab='Voltage', xlab='datetime', type='l')

#bottom left - 3rd plot
plot(Subdata$DateTime, Subdata$Sub_metering_1, type="n", lwd=1,
     ylim=c(0, max(c(Subdata$Sub_metering_1, Subdata$Sub_metering_2, Subdata$Sub_metering_3))),
     xlab="", ylab="Energy sub metering")
lines(Subdata$DateTime, Subdata$Sub_metering_1, col="black")
lines(Subdata$DateTime, Subdata$Sub_metering_2, col="red")
lines(Subdata$DateTime, Subdata$Sub_metering_3, col="blue")
legend("topright", lwd=1,
       col=c("black", "red", "blue"),
       legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"))

#bottom right
plot(Subdata$DateTime, Subdata$Global_reactive_power,
     ylab='Global_reactive_power', xlab='datetime', type='l')

dev.off()