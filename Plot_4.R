
##Download the dataset Electric power consumption from page's course
require(lubridate)
Data_set <- read.table("household_power_consumption.txt", head = TRUE, sep= ';',  colClasses = c("character", "character", "numeric", "numeric","numeric", "numeric", "numeric", "numeric"), na.strings = "?")

##Convert to  format day-month-year
Data_set$Date<-dmy(Data_set$Date)

##Choose dates between 2007-02-01 and 2007-02-02

Dates_Betw <- Data_set[Data_set$Date == ymd(20070202) | Data_set$Date == ymd(20070201),]

##Give a format for date
Dates_Betw$Date <- strptime(as.character(Dates_Betw$Date),"%Y-%m-%d")

##Paste the columns Date and time then convert as POSIXIt()

Dates_Betw$DatesCom <- paste(Dates_Betw$Date, Dates_Betw$Time)
Dates_Betw$DatesCom <- as.POSIXlt(Dates_Betw$DatesCom)

windows.options(width=480, height=480)
png("plot4.png")
par(mfrow = c(2,2))

#Plot top left

with(Dates_Betw,plot(DatesCom, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

#Plot top right

with(Dates_Betw,plot(DatesCom, Voltage, type="l", xlab="datatime", ylab="Voltage"))

#Plot bottom left

plot(Dates_Betw$DatesCom, Dates_Betw$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(Dates_Betw$DatesCom, Dates_Betw$Sub_metering_2, type="l", col = "red")
lines(Dates_Betw$DatesCom, Dates_Betw$Sub_metering_3, type="l", col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lwd=2, text.width = 90000,bty = "n")

#Plot bottom right

with(Dates_Betw,plot(DatesCom, Global_reactive_power, type="l", xlab="datatime", ylab="Global_reactive_power"))
dev.off()
