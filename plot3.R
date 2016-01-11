# Plot3.r
# Creates an hourly sub_metering using the data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip.
# Please Note: The file household_power_consumption.txt should be in the working directory prior to starting.

# Set the working directory.
setwd("C:/Users/Juan/Coursera/Course4/Assignment1")

#Read the data into a data frame.

mainDataFrame <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", head =TRUE)

# Select only February 1 and 2, 2007.

selectedDates <- subset(mainDataFrame, Date == '1/2/2007' | Date == '2/2/2007')

# Makle the sub_meter 1, 2, and 3 columns and turn them into a numeric.

selectedDates$Sub_metering_1 <- as.numeric(selectedDates$Sub_metering_1)
selectedDates$Sub_metering_2 <- as.numeric(selectedDates$Sub_metering_2)
selectedDates$Sub_metering_3 <- as.numeric(selectedDates$Sub_metering_3)

# Change the Date format using as.Date().

selectedDates$Date <- as.Date(selectedDates$Date, format="%d/%m/%Y")

# Create a combined dateTime field.

selectedDates <- transform(selectedDates, dateTime=as.POSIXct(paste(Date, Time)))

# Create the plot3.png file with a width and height of 480.

png("plot3.png", width=480, height=480)

# Use the plot() function with an X-Axis of dateTime and Y-axis of Sub_metering_1, then use lines() to add the other two sub_meterings.

plot(selectedDates$dateTime, selectedDates$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(selectedDates$dateTime, selectedDates$Sub_metering_2, type="l", col="red")
lines(selectedDates$dateTime, selectedDates$Sub_metering_3, type="l", col="blue")

# Create a legend at the top right.
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))

# Close the graphics device.

dev.off()