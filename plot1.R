file <- "household_power_consumption.txt"
DT <- read.table(file, sep=";", header=T, na.strings="?",colClasses=c("character", "character", rep("numeric", 7)))
DT$Date <- as.Date(DT$Date, format="%d/%m/%Y")

Subdata <- DT[DT$Date == as.Date("2007-02-01") | DT$Date == as.Date("2007-02-02"),]
#Subdata <- Subdata[Subdata$Global_active_power != "NA"]
Subdata$DateTime <- as.POSIXlt(paste(Subdata$Date, Subdata$Time, sep=" "))

#1st plot
#open png device
png(filename='plot1.png', width=480, height=480)

#plot histogramm
hist(Subdata$Global_active_power,xlab="Global Active Power (kilowatts)",
     main = "Global Active Power", col = "red")

#turn off device
dev.off()