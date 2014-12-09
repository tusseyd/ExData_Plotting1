## David Tussey davidtussey@gmail.com
## Exploratory Data Analysis
## Project 1, Plot 3

## Get data file from provided URL if not available in working directory.
setwd("./")
if(!file.exists("household_power_consumption.txt")) {
	print("Downloading raw data from web site.")
      download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile="rawdata.zip")
      unzip("rawdata.zip","household_power_consumption.txt")
}

# Name data file.
data.file <- "./household_power_consumption.txt"

# Read in the data. Convert Dates to R format.
print( "Reading data file." )
raw.power <- read.table( data.file, header=TRUE, sep=";", na.string="?", stringsAsFactors=FALSE )
raw.power$Date <- as.Date( raw.power$Date, format="%d/%m/%Y" )  ##  Convert to R Date format

##  Subset that data to include only Feb 1-2, 2007
power.data <- subset( raw.power, Date == "2007-02-01" | Date == "2007-02-02" )
power.data.datetime <- paste( power.data$Date, power.data$Time )  # Create a date-time field.
power.data.datetime <- as.POSIXct( power.data.datetime, format="%Y-%m-%d %H:%M:%S" )

##  Plot to the screen for visual verification. (Not required, but nice to have.)
print( "Preparing plot for screen display.")
plot( power.data.datetime, power.data$Sub_metering_1, type="n", 
     ylab="Energy sub metering", xlab="", bg="transparent" )  ## Create plot but no data.
##  Add data sets and legend
points( power.data.datetime, power.data$Sub_metering_1, col="black", type="l" )
points( power.data.datetime,power.data$Sub_metering_2, col="red", type="l" )
points( power.data.datetime,power.data$Sub_metering_3, col="blue", type="l" )
legend( "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), 
       col=c("black", "red", "blue"), lwd=1 )

## Plot to the PNG device to create a file.
print("Copying plot to the PNG file.")
png("plot3.png", width=480, height=480)
plot( power.data.datetime, power.data$Sub_metering_1, type="n", 
     ylab="Energy sub metering", xlab="", bg="transparent" )  ## Create plot but no data.
##  Add data sets and legend
points( power.data.datetime, power.data$Sub_metering_1, col="black", type="l" )
points( power.data.datetime,power.data$Sub_metering_2, col="red", type="l" )
points( power.data.datetime,power.data$Sub_metering_3, col="blue", type="l" )
legend( "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), 
       col=c("black", "red", "blue"), lwd=2 )
dev.off()

## End