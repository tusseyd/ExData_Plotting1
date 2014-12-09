## David Tussey davidtussey@gmail.com
## Exploratory Data Analysis
## Project 1, Plot 2


##  Read in raw data on household power consumption
print("Reading raw data.")
raw.power <- read.table(data.file, header=TRUE, sep=";", na.string="?", stringsAsFactors=FALSE)
raw.power$Date <- as.Date(raw.power$Date, format="%d/%m/%Y")  ##  Convert to R Date format

##  Subset that data to include only Feb 1-2, 2007
power.data <- subset(raw.power, Date == "2007-02-01" | Date == "2007-02-02")
power.data.datetime <- paste(power.data$Date, power.data$Time)  # Create a date-time field.
power.data.datetime <- as.POSIXct(power.data.datetime, format="%Y-%m-%d %H:%M:%S") # Convert date-time field to POSIXct.

##  Plot to the screen for visual verification.
print("Preparing plot for screen display.")
plot(power.data.datetime, power.data$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")

## Plot to the PNG device to create a file.
print("Copying plot to the PNG file.")
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()

## End