dat = read.table("household_power_consumption.txt", header = T, sep=';', na.strings = '?')
dat_twoday = dat[which(dat$Date %in% c("1/2/2007", "2/2/2007")),]

dat_twoday$DateTime = paste(dat_twoday$Date, dat_twoday$Time, sep='-')
dat_twoday$DateTime = strptime(dat_twoday$DateTime, "%e/%m/%Y-%H:%M:%S")

#Generate plot4
par(mfcol = c(2, 2))

#Subplot1
plot(dat_twoday$DateTime, dat_twoday$Global_active_power, type ="n", main = "", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(dat_twoday$DateTime, dat_twoday$Global_active_power)

#Subplot2
plot(dat_twoday$DateTime, dat_twoday$Sub_metering_1, type ="n", main = "", xlab = "", ylab = "Energy sub metering")
lines(dat_twoday$DateTime, dat_twoday$Sub_metering_1, col = "black")

points(dat_twoday$DateTime, dat_twoday$Sub_metering_2, type = "n")
lines(dat_twoday$DateTime, dat_twoday$Sub_metering_2, col = "red")

points(dat_twoday$DateTime, dat_twoday$Sub_metering_3, type = "n")
lines(dat_twoday$DateTime, dat_twoday$Sub_metering_3, col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex = 1)

#Subplot3
plot(dat_twoday$DateTime, dat_twoday$Voltage, type ="n", main = "", xlab = "datetime", ylab = "Voltage")
lines(dat_twoday$DateTime, dat_twoday$Voltage)

#Subplot4
plot(dat_twoday$DateTime, dat_twoday$Global_reactive_power, type ="n", main = "", xlab = "datetime", ylab = "Global_reactive_power")
lines(dat_twoday$DateTime, dat_twoday$Global_reactive_power)

dev.copy(png, "plot4.png", width = 480, height = 480, units = "px")
dev.off()
