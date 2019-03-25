# Continue from Plot1.R
#Plot 2
plot(PowerConsumption$Global_active_power ~ PowerConsumption$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
# make PNG file
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
