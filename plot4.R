raw.power <- read.table("exdata_data_household_power_consumption\\household_power_consumption.txt", header=TRUE, sep=";", na.string="?", stringsAsFactors=FALSE)
raw.power$Date <- as.Date(raw.power$Date, format="%d/%m/%Y")
power.data <- subset(raw.power, Date >= "2007-02-01" & Date <= "2007-02-02")

power.data.datetime <- paste(power.data$Date, power.data$Time)
power.data.datetime <- as.POSIXct(power.data.datetime, format="%Y-%m-%d %H:%M:%S")

par(mfcol=c(2,2))

##Plot 1
plot(power.data.datetime, power.data$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")

##Plot 2
plot(power.data.datetime, power.data$Sub_metering_1, type="n", 
     ylab="Energy sub metering", xlab="")
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


print("Preparing plot for PNG file...")
png("plot4.png", width=480, height=480)
par(mfcol=c(2,2))

##Plot 1
plot(power.data.datetime, power.data$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")

##Plot 2
plot(power.data.datetime, power.data$Sub_metering_1, type="n", 
     ylab="Energy sub metering", xlab="")
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