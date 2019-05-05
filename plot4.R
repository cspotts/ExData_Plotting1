library(lubridate)

setwd("C:/Users/Courtney/Documents/Coursera/Exploratory Data Analysis")
list.files()
power.cons <- read.csv("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?")

# need to convert Date
power.cons$Date <- as.Date(power.cons$Date, format="%d/%m/%Y")

# filter date
power <- power.cons %>%
  filter(between(Date, as.Date("2007-02-01"), as.Date("2007-02-02")))

# convert time
power$DateTime <- strptime(paste(power$Date,power$Time), format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))

# plot 4a
plot(power$DateTime, power$Global_active_power, 
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

# plot 4b
plot(power$DateTime, power$Voltage, 
     type="l",
     ylab="Voltage",
     xlab="datetime")

# plot 4c: 
with(power, plot(DateTime, Sub_metering_1, main="", xlab="",ylab="Energy sub metering", type="n"))
with(power, lines(DateTime, Sub_metering_1, col="black"))
with(power, lines(DateTime, Sub_metering_2, col="red"))
with(power, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", lty=1, bty="n",col=c("black","blue","red"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_2"))

# plot 4d
plot(power$DateTime, power$Global_reactive_power, 
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

dev.copy(png, "plot4.png")

dev.off()
