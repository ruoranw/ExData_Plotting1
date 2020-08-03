# Read data
mydat <- read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F)

# Turn Date variable as class Date
mydat$Date <- as.Date(mydat$Date,format="%d/%m/%Y")

#Subset the data in 2007-02-01 and 2007-02-02
date_subsetted <- subset(mydat, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Combine Date and Time and convert it to POSIXct
date_subsetted$newDate <- with(date_subsetted, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))

# Create the plot
plot(date_subsetted$Global_active_power ~ newDate, data = date_subsetted, type = "l", ylab ="Global Active Power(kilowatts)", xlab="")
