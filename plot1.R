## David Tussey davidtussey@gmail.com
## Exploratory Data Analysis
## Project 1

##  Read in raw data on household power comsumption
raw.power <- read.table("exdata_data_household_power_consumption\\household_power_consumption.txt", header=TRUE, sep=";", na.string="?", stringsAsFactors=FALSE)
raw.power$Date <- as.Date(raw.power$Date, format="%d/%m/%Y")  ##  Convert to R Date format

##  Subset that data to include only Feb 1-2, 2007
power.data <- subset(raw.power, Date >= "2007-02-01" & Date <= "2007-02-02")

##  Plot the histogram to the screen for visual verification.
print("Preparing to print charts to the screen device...")
hist(power.data$Global_active_power, col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

## Plot the histogram to the PNG device to create a file.
print("Preparing charts for the PNG file...")
png("plot1.png", width=480, height=480)
hist(power.data$Global_active_power, col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()