## plot2.R: Plot date/time vs global active power data and sends to png device

library(data.table)

##read the energy consumption data into R
energy <- fread("household_power_consumption.txt", stringsAsFactors = FALSE,
                na.strings = "?")

##subset only data with Date = 1/2/2007 and 2/2/2007
energy <- energy[grep("^(1/2/2007|2/2/2007)",energy$Date), ]

##convert Date column from character class to Date class using lubridate package
datetime <- strptime(paste(energy$Date,energy$Time), "%d/%m/%Y %H:%M:%S")

##Open PNG device; create 'plot2.png' in the working directory
png(file = "plot2.png", width = 480, height = 480) 

##Plot date/time vs global active power data and send to png device
plot(datetime, energy$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power(kilowatts)")

##Close the PNG file device
dev.off() 
