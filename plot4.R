#Read and transform data
powerConsume <- read.table("household_power_consumption.txt", sep = ";", dec = ".", header = TRUE, stringsAsFactors = FALSE, na.strings="?")
subSetPwC <- powerConsume[powerConsume$Date %in% c("1/2/2007","2/2/2007") ,]
subSetPwC$datesAndTimes <- strptime(paste(subSetPwC$Date,subSetPwC$Time, sep = " ") ,format='%d/%m/%Y %H:%M:%S')

#Create plot
png("plot4.png", width = 480, height = 480)
par(mfcol = c(2, 2))

#Plot on the top-left
plot(subSetPwC$datesAndTime, subSetPwC$Global_active_power, type = "l",  xlab = "", ylab = "Global Active Power (kilowatts)")

#Plot on the bottom-left
plot(subSetPwC$datesAndTimes, subSetPwC$Sub_metering_1, type="l", xlab="", ylab="Energy Submetering")
lines(subSetPwC$datesAndTimes, subSetPwC$Sub_metering_2, type="l",col="red")
lines(subSetPwC$datesAndTimes, subSetPwC$Sub_metering_3, type="l",col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Plot on the top-right
plot(subSetPwC$datesAndTime, subSetPwC$Voltage, type = "l",  xlab = "datetime", ylab = "Voltage")

#Plot on the bottom-right
plot(subSetPwC$datesAndTime, subSetPwC$Global_reactive_power, type = "l",  xlab = "datetime", ylab = "Global_reactive_power")

dev.off()