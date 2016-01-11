# Plot4.r
# Creates a page with four hourly charts for Global Active Power, Volate, Submetering, and Global Reactive Power using the data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip.
# Please Note: The file household_power_consumption.txt should be in the working directory prior to starting.

# Set the working directory.
setwd("C:/Users/Juan/Coursera/Course4/Assignment1")

#Read the data into a data frame.

mainDataFrame <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", head =TRUE)

# Select only February 1 and 2, 2007.

selectedDates <- subset(mainDataFrame, Date == '1/2/2007' | Date == '2/2/2007')

# Make the Global Active Power, Voltage, sub_metering 1, 2, and 3, and Global Reactive Power columns and turn them into a numeric.

selectedDates$Global_active_power <- as.numeric(selectedDates$Global_active_power)
selectedDates$Voltage <- as.numeric(selectedDates$Voltage)
selectedDates$Sub_metering_1 <- as.numeric(selectedDates$Sub_metering_1)
selectedDates$Sub_metering_2 <- as.numeric(selectedDates$Sub_metering_2)
selectedDates$Sub_metering_3 <- as.numeric(selectedDates$Sub_metering_3)
selectedDates$Voltage <- as.numeric(selectedDates$Voltage)
selectedDates$Global_reactive_power <- as.numeric(selectedDates$Global_reactive_power)

# Change the Date format using as.Date().

selectedDates$Date <- as.Date(selectedDates$Date, format="%d/%m/%Y")

# Create a combined dateTime field.

selectedDates <- transform(selectedDates, dateTime=as.POSIXct(paste(Date, Time)))

# Create the plot4.png file with a width and height of 480.

png("plot4.png", width=480, height=480)

# Create a two by two grid for the charts.

par(mfrow = c(2,2))

# Make the first chart (Global Active Power)

plot(selectedDates$dateTime, selectedDates$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Make the second chart (Voltage)

plot(selectedDates$dateTime, selectedDates$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Make the third chart (Sub metering) with a legend.

plot(selectedDates$dateTime, selectedDates$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(selectedDates$dateTime, selectedDates$Sub_metering_2, type="l", col="red")
lines(selectedDates$dateTime, selectedDates$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex = .8)


# Make the second chart (Voltage)

plot(selectedDates$dateTime, selectedDates$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# Close the graphics device.

dev.off()