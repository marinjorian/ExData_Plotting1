setwd("C:\\Users\\xj713756\\Repos\\ExData_Plotting1")
dat = read.table("household_power_consumption.txt", header = T, sep=';', na.strings = '?')
dat_twoday = dat[which(dat$Date %in% c("1/2/2007", "2/2/2007")),]
#Generate plot1
hist(dat_twoday$Global_active_power, col = 'red', main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, "plot1.png", width = 480, height = 480, units = "px")
dev.off()


