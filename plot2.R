##Read data into powerData dataframe
powerData <-read.table("./household_power_consumption.txt", sep=";",
                       na.strings = "?", comment.char = "",skip = 66637,
                       nrows = 2880 )

c("Date","Time","Global_active_power","Global_reactive_power"
  ,"Voltage","Global_intensity","Sub_metering_1","Sub_metering_2"
  ,"Sub_metering_3")->colnames(powerData)
as.Date(powerData$Date,"%d/%m/%Y")->powerData[,1]
strptime(paste(powerData$Date, format(powerData$Time,format = "%H:%M:%S")), 
         format = "%Y-%m-%d %H:%M:%S",tz=" ")->powerData$Time
##Plot Global Active Power vs time
png("plot2.png")
plot(powerData$Time,powerData$Global_active_power, xlab ="", 
     ylab = "Global Active Power (kilowatts)", type="n")
lines(powerData$Time,powerData$Global_active_power)
##dev.copy(png, width=480, height=480, units ="px", file ="plot2.png")
dev.off()