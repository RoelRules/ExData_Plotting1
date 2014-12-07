# cours : "Exploratory Data Analysis.assignment week 1"
# script: Plot 4
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

# plotting data to png4 in wd

png("plot4.png", width=480, height=480)

# set graph matrix dimensions

par(mfrow = c(2, 2))

# set xlab values  as numeric

globalActivePower = as.numeric(dataset$Global_active_power) 
globalReactivePower = as.numeric(dataset$Global_reactive_power) 
voltage = as.numeric(dataset$Voltage)
subMetering1 = as.numeric(dataset$Sub_metering_1) 
subMetering2 = as.numeric(dataset$Sub_metering_2) 
subMetering3 = as.numeric(dataset$Sub_metering_3) 

# create Multiple Base Plots with plot and ad lines plus defining the legend
# plot4.1
plot(dateandtime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
# plot4.2
plot(dateandtime, voltage, type="l", xlab="dateandtime", ylab="Voltage")
# plot4.3
plot (dateandtime, subMetering1, type="l", ylab="Energy sub metering", xlab="") 
lines(dateandtime, subMetering2, type="l", col="red") 
lines(dateandtime, subMetering3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o") 
# plot4.4
plot(dateandtime, globalReactivePower, type="l", xlab="dateandtime", ylab="Global_reactive_power") 


# close graphics device png in wd

dev.off()
