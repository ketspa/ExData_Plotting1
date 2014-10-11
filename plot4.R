power <- read.table("household_power_consumption.txt",header = T, sep = ";",,na.strings = "?")
power2days <- subset(power,Date == "1/2/2007" | Date == "2/2/2007")

power2days$Date <- as.Date(power2days$Date,"%d/%m/%Y")
power2days$Date_Time <- paste(power2days$Date,power2days$Time,sep = " ")
power2days$Date_Time <- strptime (power2days$Date_Time, "%Y-%m-%d %H:%M:%S")

png("plot4.png",  width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
with(power2days,plot(Date_Time, Global_active_power,type="l",xlab="",ylab="Global Active Power"))

with(power2days,plot(Date_Time, Voltage,type="l",xlab="datetime",ylab="Voltage"))

with(power2days,plot(Date_Time, Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(power2days,lines(Date_Time, Sub_metering_2,type="l",col="red"))
with(power2days,lines(Date_Time, Sub_metering_3,type="l",col="blue"))
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),bty = "n",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(power2days,plot(Date_Time, Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))

dev.off()
