library(data.table)
library(dplyr)

# Read data
mydat <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F)

# Turn Date variable as class Date
mydat$Date <- as.Date(mydat$Date,format="%d/%m/%Y")

#Subset the data in 2007-02-01 and 2007-02-02
date_subsetted <- subset(mydat, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

#Plotting
hist(as.numeric(date_subsetted$Global_active_power), main ="Global Active Power", xlab = "Global Active Power(kilowatts)", col = "red" )