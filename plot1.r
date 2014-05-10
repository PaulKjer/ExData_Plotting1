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

#  Build Plot 1 - the histogram
    
    # output to "plot1.png"
    png(filename = "plot1.png", width = 480, height = 480,bg="transparent")
    
    # write the plot1 histogram 
    hist(power$Global_active_power,col="#ff2500",main="Global Active Power",xlab="Global Active Power (kilowatts)")
    
    #  "plot1.png" off
    dev.off()
    
    

