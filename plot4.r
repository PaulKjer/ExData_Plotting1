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

#  Build Plot 4 - four charts

    #  output to "plot4.png"    
    png(filename = "plot4.png", width = 480, height = 480,bg="transparent")
    
    #  a 2x2 grid
    par(mfrow = c(2,2))
    with(power, {
      # 1 active power (top, left)
      plot(power$DateTime,power$Global_active_power,type="l",ylab="Global Active Power",xlab="")
      # 2 voltage (top, right)
      plot(power$DateTime,power$Voltage,type="l",ylab="Voltage",xlab="datetime")
      # 3 3 types of metering (bottom, left)
      plot(power$DateTime,power$Sub_metering_1,type="l",ylab="Energy sub metering")
      lines(power$DateTime,power$Sub_metering_2,col="red")
      lines(power$DateTime,power$Sub_metering_3,col="blue")
      legend("topright",cex=0.7, lty = 1,  bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      # 4 reactive power (bottom right)
      plot(power$DateTime,power$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
      })
    
    # plot4 off
    dev.off()


