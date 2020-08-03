# Read data
mydat <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F)

# Turn Date variable as class Date
mydat$Date <- as.Date(mydat$Date,format="%d/%m/%Y")

#Subset the data in 2007-02-01 and 2007-02-02
date_subsetted <- subset(mydat, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Combine Date and Time and convert it to POSIXct
date_subsetted$newDate <- with(date_subsetted, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))

# names(date_subsetted)

# Initialize a new blank chart and add lines
with(date_subsetted, plot(newDate, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
lines(date_subsetted$newDate,date_subsetted$Sub_metering_2, col="red")
lines(date_subsetted$newDate,date_subsetted$Sub_metering_3, col="blue")
legend("topright", lty = 1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.8)
