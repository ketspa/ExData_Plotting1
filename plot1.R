
power <- read.table("household_power_consumption.txt",header = T, sep = ";",,na.strings = "?")
power2days <- subset(power,Date == "1/2/2007" | Date == "2/2/2007")


png("plot1.png",  width = 480, height = 480, units = "px")

with(power2days,hist(Global_active_power, col = "red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)"))
dev.off()