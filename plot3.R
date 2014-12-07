# cours : "Exploratory Data Analysis.assignment week 1"
# script: Plot 3
# author: "RoelRules"
# date: : "december 7 2014"
# output: Our overall goal here is simply to examine household energy usage over a 2-day period in February 2007.


# call needed file from wd

data_all = ("./household_power_consumption.txt")

# select all rows and exclude "?"

dataset = read.table(data_all, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")

# select needed rows containing dates 2007-02-01 and 2007-02-02

dataset = dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]

# Convert date and time to variable dateandtime

dateandtime = strptime(paste(dataset$Date, dataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# plotting data to png3 in wd

png("plot3.png", width=480, height=480)

# set xlab values  as numeric

globalActivePower = as.numeric(dataset$Global_active_power) 
subMetering1 <- as.numeric(dataset$Sub_metering_1) 
subMetering2 <- as.numeric(dataset$Sub_metering_2) 
subMetering3 <- as.numeric(dataset$Sub_metering_3) 


# create line chart with plot and ad lines plus defining the legend

plot (dateandtime, subMetering1, type="l", ylab="Energy sub metering", xlab="") 
lines(dateandtime, subMetering2, type="l", col="red") 
lines(dateandtime, subMetering3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")) 


# close graphics device png in wd

dev.off()
