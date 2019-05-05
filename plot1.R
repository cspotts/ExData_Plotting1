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

# plot 1: histogram of global active power
hist(power$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")

dev.copy(png, file="plot1.png")

dev.off()
