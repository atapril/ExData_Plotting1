# Continue from Plot1.R
# To make Plot3.png
# Make a plot withg Sub_Metering_1
plot(PowerConsumption$Sub_metering_1 ~ PowerConsumption$DateTime, ylab="Engery sub metering", type="l", xlab="")
# Add sub_metering_2 with line color Red
points(PowerConsumption$Sub_metering_2 ~ PowerConsumption$DateTime, type="l", col="red")
# Add sub_metering_3 with line color Blue
points(PowerConsumption$Sub_metering_3 ~ PowerConsumption$DateTime, type="l", col="blue")
# Add legend
legend("topright", legend =c("Sub_meeting_1", "Sub_meeting_2", "Sub_meeting_3"), col=c("black", "red", "blue"), lwd=c(1,1,1))
# Make png file of PLot 3
dev.copy(png,"Plot3.png", width=480, height=480)
dev.off()
