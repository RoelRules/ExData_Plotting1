# cours : "Exploratory Data Analysis.assignment week 1"
# script: Plot 1
# author: "RoelRules"
# date: : "december 5 2014"
# output: Our overall goal here is simply to examine household energy usage over a 2-day period in February 2007.

# call needed file from wd

data_all = ("./household_power_consumption.txt")

# select all rows and exclude "?"

dataset = read.table(data_all, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")

# select needed rows containing dates 2007-02-01 and 2007-02-02

dataset = dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]

# plotting data to png in wd

png("plot1.png", width=480, height=480)

# set globalActivePower value as numeric

globalActivePower = as.numeric(dataset$Global_active_power) 

# The ylab is as Frequentie automatic given as Base Plotting with hist

hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# close graphics device png in wd

dev.off() 
