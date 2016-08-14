## plot3.R: Plot date/time vs each set of sub metering data and sends to png device

library(data.table)

##read the energy consumption data into R
energy <- fread("household_power_consumption.txt", stringsAsFactors = FALSE,
                na.strings = "?")

##subset only data with Date = 1/2/2007 and 2/2/2007
energy <- energy[grep("^(1/2/2007|2/2/2007)",energy$Date), ]

##convert Date column from character class to Date class using lubridate package
datetime <- strptime(paste(energy$Date,energy$Time), "%d/%m/%Y %H:%M:%S")

##Open PNG device; create 'plot3.png' in the working directory
png(file = "plot3.png", width = 480, height = 480) 

##Plot date/time vs sub metering 1
plot(datetime, energy$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy Sub Metering", col = "black")

##Add a plot for date/time vs sub metering 2
lines(datetime, energy$Sub_metering_2, type = "l", xlab = "", 
     ylab = "", col = "red")

##Add a plot for date/time vs sub metering 3
lines(datetime, energy$Sub_metering_3, type = "l", xlab = "", 
     ylab = "", col = "blue")

##Add legends to the plot
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))

##Close the PNG file device
dev.off() 
