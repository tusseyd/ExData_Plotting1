## David Tussey davidtussey@gmail.com
## Exploratory Data Analysis
## Project 1

##  Read in raw data on household power comsumption
raw.power <- read.table("exdata_data_household_power_consumption\\household_power_consumption.txt", header=TRUE, sep=";", na.string="?", stringsAsFactors=FALSE)
raw.power$Date <- as.Date(raw.power$Date, format="%d/%m/%Y")  ##  Convert to R Date format

##  Subset that data to include only Feb 1-2, 2007
power.data <- subset(raw.power, Date >= "2007-02-01" & Date <= "2007-02-02")
power.data.datetime <- paste(power.data$Date, power.data$Time)  # Create a date-time field.
power.data.datetime <- as.POSIXct(power.data.datetime, format="%Y-%m-%d %H:%M:%S")

##  Plot to the screen for visual verification.
par(mfcol=c(2,2))  ## Set up devce for a 2X2 presentation.
print("Preparing to print charts to the screen device...")

##Plot 1
plot(power.data.datetime, power.data$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")

##Plot 2
plot(power.data.datetime, power.data$Sub_metering_1, type="n", 
     ylab="Energy sub metering", xlab="")
##  Add data sets and legend
points(power.data.datetime, power.data$Sub_metering_1, col="black", type="l")
points(power.data.datetime,power.data$Sub_metering_2, col="red", type="l")
points(power.data.datetime,power.data$Sub_metering_3, col="blue", type="l")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), pch="-")

##Plot 3
plot(power.data.datetime, power.data$Voltage, type="l", 
     ylab="Voltage", xlab="")

##Plot 4
plot(power.data.datetime, power.data$Global_reactive_power, type="l", 
     ylab="Global_reactive_power", xlab="")

## Plot to the PNG device to create a file.
print("Preparing charts for the PNG file...")
png("plot4.png", width=480, height=480)
par(mfcol=c(2,2))

##Plot 1
plot(power.data.datetime, power.data$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")

##Plot 2
plot(power.data.datetime, power.data$Sub_metering_1, type="n", 
     ylab="Energy sub metering", xlab="")
##  Add data sets and legend
points(power.data.datetime, power.data$Sub_metering_1, col="black", type="l")
points(power.data.datetime,power.data$Sub_metering_2, col="red", type="l")
points(power.data.datetime,power.data$Sub_metering_3, col="blue", type="l")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), pch="-")

##Plot 3
plot(power.data.datetime, power.data$Voltage, type="l", 
     ylab="Voltage", xlab="")

##Plot 4
plot(power.data.datetime, power.data$Global_reactive_power, type="l", 
     ylab="Global_reactive_power", xlab="")

dev.off()