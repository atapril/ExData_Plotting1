library(ggplot2)
library(data.table)
# copy the link to download file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download file
download.file(url,'./Household power consumption.zip', mode="wb")
#unzip file
unzip("Household power consumption.zip", exdir = getwd())
# read file in R, call it "PowerConsumption"
PowerConsumption <- read.csv("Household_power_consumption.txt", sep=";", na.strings = "?")
# convert Date column to Date class in R using strptime() and as.Date()
PowerConsumption$Date <- strptime(PowerConsumption$Date, format = "%d/%m/%Y")
PowerConsumption$Date <- as.Date(PowerConsumption$Date)
# subset data, filter date from 2007-02-01 to 2007-02-02
PowerConsumption <- PowerConsumption[ PowerConsumption$Date >= "2007-02-01" & PowerConsumption$Date <= "2007-02-02", ]
#remove NA values
PowerConsumption <- PowerConsumption[ complete.cases(PowerConsumption),]
# combine Date and Time
Datetime <- paste(PowerConsumption$Date, PowerConsumption$Time)
# Make it a table
Datetime <- data.table(Datetime)
# name the column DateTime
Datetime <- setnames(Datetime, "DateTime")
# Remove the "Date" coulumn and the "Time" column
PowerConsumption <- PowerConsumption[ , !names(PowerConsumption) %in% c("Date","Time")]
# Add DateTime column to data table
PowerConsumption <- cbind(Datetime, PowerConsumption)
# Make Global_active_power column numeric
PowerConsumption$Global_active_power <- as.numeric(PowerConsumption$Global_active_power)
# Make Datetime class date
PowerConsumption$DateTime <- as.POSIXct(PowerConsumption$DateTime)
#Plot 2
plot(PowerConsumption$Global_active_power ~ PowerConsumption$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
# make PNG file
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
