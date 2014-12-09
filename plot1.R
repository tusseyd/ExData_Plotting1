## David Tussey davidtussey@gmail.com
## Exploratory Data Analysis
## Project 1, Plot 1

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

##  Read in raw data on household power consumption
print("Reading raw data.")
raw.power <- read.table(data.file, header=TRUE, sep=";", na.string="?", stringsAsFactors=FALSE)
raw.power$Date <- as.Date(raw.power$Date, format="%d/%m/%Y")  ##  Convert to R Date format

##  Subset that data to include only Feb 1-2, 2007
power.data <- subset(raw.power, Date == "2007-02-01" | Date == "2007-02-02")

##  Plot the histogram to the screen for visual verification.
print("Preparing plot for the screen device.")
hist(power.data$Global_active_power, col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

## Copy the histogram to the PNG device to create a file.
print("Copying plot to the PNG file.")
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()

## End