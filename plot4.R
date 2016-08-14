## plot4.R: Plot date/time vs each set of sub metering data and sends to png device

library(data.table)

##read the energy consumption data into R
energy <- fread("household_power_consumption.txt", stringsAsFactors = FALSE,
                na.strings = "?")

##subset only data with Date = 1/2/2007 and 2/2/2007
energy <- energy[grep("^(1/2/2007|2/2/2007)",energy$Date), ]

##convert Date column from character class to Date class using lubridate package
datetime <- strptime(paste(energy$Date,energy$Time), "%d/%m/%Y %H:%M:%S")

##Open PNG device; create 'plot4.png' in the working directory
png(file = "plot4.png", width = 480, height = 480)

##set number of rows and columns for the main plot
par(mfcol = c(2,2))

##Add date/time vs global active power data plot on column 1 row 1
plot(datetime, energy$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power")

##Add date/time vs sub metering 1 plot on row 2 column 1
plot(datetime, energy$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy Sub Metering", col = "black")

##Add date/time vs sub metering 2 plot on row 2 column 1
lines(datetime, energy$Sub_metering_2, type = "l", xlab = "", ylab = "", col = "red")

##Add date/time vs sub metering 3 plot on row 2 column 1
lines(datetime, energy$Sub_metering_3, type = "l", xlab = "", ylab = "", col = "blue")

##Add legends to the plot on row 2 column 1
legend("topright", lty = 1, col = c("black", "red", "blue"), bty = "n",
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))

##Add date/time vs voltage plot on row 1 column 2
plot(datetime, energy$Voltage,  type = "l", ylab = "Voltage", col = "black")

##Add date/time vs voltage global reactive power plot on row 2 column 2
plot(datetime, energy$Global_reactive_power,  type = "l",
     ylab = "Global_reactive_power", col = "black")

##Close the PNG file device
dev.off() 
