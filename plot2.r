# Read the data
    power = read.table("household_power_consumption.txt",header=TRUE,stringsAsFactors = FALSE,sep=";")

# Subset the data to the two days we need - 2007-02-01 and 2007-02-02
    power = subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007" )

# Change the times and dates with by pasting them together and converting them with strptime 
    power$DateTime <- paste(power$Date,", ",power$Time,sep="")
    power$DateTime <- strptime(power$DateTime, format="%d/%m/%Y, %H:%M:%S")
    power$Day <- weekdays(power$DateTime)

#  Convert character variables to numeric values
    power$Global_active_power <- as.numeric(power$Global_active_power)
    power$Global_reactive_power <- as.numeric(power$Global_reactive_power)
    power$Voltage <- as.numeric(power$Voltage)
    power$Global_intensity <- as.numeric(power$Global_intensity)
    power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
    power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
    power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)

#  Build Plot 2 - the line plot
    
    # output to "plot2.png"
    png(filename = "plot2.png", width = 480, height = 480,bg="transparent")
    
    # write the plot2 line chart
    plot(power$DateTime,power$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")

    # "plot2.png" off
    dev.off()

