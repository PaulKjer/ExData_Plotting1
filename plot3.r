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
    
#  Build Plot 3 - multiple lines with the sub metering data

    # output to "plot3.png"
    png(filename = "plot3.png", width = 480, height = 480,bg="transparent")
    
    #  write the multu-line plot3 chart
    plot(power$DateTime,power$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="")
    lines(power$DateTime,power$Sub_metering_2,col="red")  #  add the second line
    lines(power$DateTime,power$Sub_metering_3,col="blue") #  add the third line
    #  add the legend
    legend("topright",cex=0.7, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    # "plot3.png" off
    dev.off()

