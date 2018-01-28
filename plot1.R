#Read and transform data
powerConsume <- read.table("household_power_consumption.txt", sep = ";", dec = ".", header = TRUE, stringsAsFactors = FALSE, na.strings="?")
subSetPwC <- powerConsume[powerConsume$Date %in% c("1/2/2007","2/2/2007") ,]

#Create plot
png("plot1.png", width = 480, height = 480)
hist(subSetPwC$Global_active_power, col = "red" ,xlab = "Global Active Power (kilowatts)", main="Global Active Power")
dev.off()