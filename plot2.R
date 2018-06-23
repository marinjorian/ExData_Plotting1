dat = read.table("household_power_consumption.txt", header = T, sep=';', na.strings = '?')
dat_twoday = dat[which(dat$Date %in% c("1/2/2007", "2/2/2007")),]

dat_twoday$DateTime = paste(dat_twoday$Date, dat_twoday$Time, sep='-')
dat_twoday$DateTime = strptime(dat_twoday$DateTime, "%e/%m/%Y-%H:%M:%S")

#Generate plot2
plot(dat_twoday$DateTime, dat_twoday$Global_active_power, type ="n", main = "", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(dat_twoday$DateTime, dat_twoday$Global_active_power)
dev.copy(png, "plot2.png", width = 480, height = 480, units = "px")
dev.off()
