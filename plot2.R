power <- read.table("household_power_consumption.txt",header = T, sep = ";",,na.strings = "?")
power2days <- subset(power,Date == "1/2/2007" | Date == "2/2/2007")

power2days$Date <- as.Date(power2days$Date,"%d/%m/%Y")
power2days$Date_Time <- paste(power2days$Date,power2days$Time,sep = " ")
power2days$Date_Time <- strptime (power2days$Date_Time, "%Y-%m-%d %H:%M:%S")

png("plot2.png",  width = 480, height = 480, units = "px")
with(power2days,plot(Date_Time, Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()