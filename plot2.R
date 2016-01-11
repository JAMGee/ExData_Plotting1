# Plot2.r
# Creates an hourly global active power usages. using the data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip.
# Please Note: The file household_power_consumption.txt should be in the working directory prior to starting.

# Set the working directory.
setwd("C:/Users/Juan/Coursera/Course4/Assignment1")

#Read the data into a data frame.

mainDataFrame <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", head =TRUE)

# Select only February 1 and 2, 2007.

selectedDates <- subset(mainDataFrame, Date == '1/2/2007' | Date == '2/2/2007')

# Makle Global_Active_Power and turn it into a numeric.

selectedDates$Global_active_power <- as.numeric(selectedDates$Global_active_power)

# Change the Date format using as.Date().

selectedDates$Date <- as.Date(selectedDates$Date, format="%d/%m/%Y")

# Create a combined dateTime field.

selectedDates <- transform(selectedDates, dateTime=as.POSIXct(paste(Date, Time)))

# Create the plot2.png file with a width and height of 480.

png("plot2.png", width=480, height=480)

#Use the plot() function with an X-Axis of dateTime and Y-axis of Global_active_power.

plot(selectedDates$dateTime, selectedDates$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Close the graphics device.

dev.off()