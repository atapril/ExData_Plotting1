# Plot 1 code
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
PowerConsumption <- PowerConsumption[ complete.cases(PowerConsumption),]
Datetime <- paste(PowerConsumption$Date, PowerConsumption$Time)
Datetime <- data.table(Datetime)
Datetime <- setnames(Datetime, "DateTime")
PowerConsumption <- PowerConsumption[ , !names(PowerConsumption) %in% c("Date","Time")]
PowerConsumption <- cbind(Datetime, PowerConsumption)
PowerConsumption$Global_active_power <- as.numeric(PowerConsumption$Global_active_power)
PowerConsumption$DateTime <- as.POSIXct(PowerConsumption$DateTime)
hist(PowerConsumption$Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()

