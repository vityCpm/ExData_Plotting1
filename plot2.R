#Read and transform data
powerConsume <- read.table("household_power_consumption.txt", sep = ";", dec = ".", header = TRUE, stringsAsFactors = FALSE, na.strings="?")
subSetPwC <- powerConsume[powerConsume$Date %in% c("1/2/2007","2/2/2007") ,]
subSetPwC$datesAndTimes <- strptime(paste(subSetPwC$Date,subSetPwC$Time, sep = " ") ,format='%d/%m/%Y %H:%M:%S')

#Create plot
png("plot2.png", width = 480, height = 480)
plot(subSetPwC$datesAndTimes, subSetPwC$Global_active_power, type = "l",  xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()