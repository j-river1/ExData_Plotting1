
##Download the dataset Electric power consumption from page's course
require(lubridate)
Data_set <- read.table("household_power_consumption.txt", head = TRUE, sep= ';', colClasses = c("character", "character", "numeric", "numeric","numeric", "numeric", "numeric", "numeric"), na.strings = "?")

##Put the format day-month-year
Data_set$Date<-dmy(Data_set$Date)

##Choose dates between 2007-02-01 and 2007-02-02

Dates_Betw <- Data_set[Data_set$Date == ymd(20070202) | Data_set$Date == ymd(20070201),]

##Histogram 
##Change format to numeric

Dates_Betw$Global_active_power <- as.numeric(as.character(Dates_Betw$Global_active_power))

##
windows.options(width=480, height=480)
png("plot1.png")
hist((Dates_Betw$Global_active_power), xlab="Global Active Power(kilowatts)", col="red", main = "Global Active Power")
dev.off()


