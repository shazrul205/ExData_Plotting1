## plot1.R: Draw a histogram for the variable Global Active Power and sends it to
##          PNG file device

library(data.table)

##Personal note: to directly subset a dataset (especially a very large one)
##before loading into r, use read.csv.sql from sqldf package. This approach reads
##the file into sql database and then we use sql statement to filter the desired
##data into R. As for this assignment (RAM used = 124mb), fread is better and
##computes faster as the dataset is not that big.
##data <- read.csv.sql("household_power_consumption.txt", sep = ";", header = TRUE,
##                  sql = "select * from file where Date in ('1/2/2007', '2/2/2007')")

##read the energy consumption data into R
energy <- fread("household_power_consumption.txt", stringsAsFactors = FALSE,
                na.strings = "?")

##subset only data with Date = 1/2/2007 and 2/2/2007
energy <- energy[grep("^(1/2/2007|2/2/2007)",energy$Date), ]

##Open PNG device; create 'plot1.png' in the working directory
png(file = "plot1.png", width = 480, height = 480) 

##plot a histogram for the variable "Global Active Power" and send to png device
hist(energy$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (killowatts)", ylab = "Frequency")

##Close the PNG file device
dev.off() 
