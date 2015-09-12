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
##Plotting Energy Sub metering
png("plot3.png")
plot(powerData$Time,powerData$Sub_metering_3, ylim=c(0,40),xlab=" ", ylab="Energy Sub Metering"
     ,type="n")
legend("topright",col=c("black", "blue", "red"),lty = 1, 
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
lines(powerData$Time,powerData$Sub_metering_3, col="blue")
lines(powerData$Time,powerData$Sub_metering_2, col="red")
lines(powerData$Time,powerData$Sub_metering_1)
##dev.copy(png, width=480, height=480, units ="px", file ="plot3.png")
dev.off()
##### ~ 