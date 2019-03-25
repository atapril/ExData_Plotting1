# Continue from PLot1.R
# Create a 2 rows, 2 columns space for 4 plots on 1 screen
par(mfrow=c(2,2))
# Plot 1
plot(PowerConsumption$Global_active_power ~ PowerConsumption$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
#Plot 2
plot(PowerConsumption$Voltage~ PowerConsumption$DateTime, type="l", ylab="Voltage", xlab="datetime")
# Plot 3
plot(PowerConsumption$Sub_metering_1 ~ PowerConsumption$DateTime, ylab="Engery sub metering", type="l", xlab="")
points(PowerConsumption$Sub_metering_2 ~ PowerConsumption$DateTime, type="l", col="red")
points(PowerConsumption$Sub_metering_3 ~ PowerConsumption$DateTime, type="l", col="blue")
legend("topright", legend =c("Sub_meeting_1", "Sub_meeting_2", "Sub_meeting_3"), col=c("black", "red", "blue"), lwd=c(1,1,1), cex = 0.75)
# Plot 4
plot(PowerConsumption$Global_reactive_power ~ PowerConsumption$DateTime, type="l", ylab="Global_reactive_power", xlab="datetime")
# Create plot4.png
dev.copy(png,"Plot4.png", width=480, height=480)
# Close plot4.png
dev.off()

