# Plot1.r
# Creates a histogram using the data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip.
# Please Note: The file household_power_consumption.txt should be in the working directory prior to starting.

# Set the working directory.
setwd("C:/Users/Juan/Coursera/Course4/Assignment1")

#Read the data into a data frame.

mainDataFrame <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", head =TRUE)

# Select only February 1 and 2, 2007.

selectedDates <- subset(mainDataFrame, Date == '1/2/2007' | Date == '2/2/2007')

# Select only the Global Active Power.

plot1 <- as.numeric(selectedDates$Global_active_power)

# Create the plog1.png file with a width and heigh of 480.

png("plot1.png", width=480, height=480)

#Use the hist() function to create a histogram with the appropriate colors and labels.

hist(plot1, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Close the graphics device.

dev.off()