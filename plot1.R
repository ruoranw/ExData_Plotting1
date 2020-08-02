library(data.table)
library(dplyr)

mydat <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F)
class(mydat$Date)

mydat$Date <- as.Date(mydat$Date,format="%d/%m/%Y")
class(mydat$Date)
head(mydat)

date_subsetted <- subset(mydat, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

hist(as.numeric(date_subsetted$Global_active_power), main ="Global Active Power", xlab = "Global Active Power(kilowatts)", col = "red" )