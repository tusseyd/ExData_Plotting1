## David Tussey davidtussey@gmail.com
## Exploratory Data Analysis
## Project 1

##  Read in raw data on household power comsumption
raw.power <- read.table("exdata_data_household_power_consumption\\household_power_consumption.txt", header=TRUE, sep=";", na.string="?", stringsAsFactors=FALSE)
raw.power$Date <- as.Date(raw.power$Date, format="%d/%m/%Y")  ##  Convert to R Date format

##  Subset that data to include only Feb 1-2, 2007
power.data <- subset(raw.power, Date >= "2007-02-01" & Date <= "2007-02-02")
power.data.datetime <- paste(power.data$Date, power.data$Time)  # Create a date-time field.
power.data.datetime <- as.POSIXct(power.data.datetime, format="%Y-%m-%d %H:%M:%S") # Convert date-time field to POSIXct.

##  Plot to the screen for visual verification.
print("Preparing plot for screen display...")
plot(power.data.datetime, power.data$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")

## Plot to the PNG device to create a file.
print("Preparing plot for PNG file...")
png("plot2.png", width=480, height=480)
plot(power.data.datetime, power.data$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()