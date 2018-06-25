# I accept that the horizontal axis is in my local date setting
# a solution like https://stackoverflow.com/questions/15627508/axis-date-in-another-language seems to mess with environment variables


# read the relevant part of the txt file
df <- read.csv(file = "household_power_consumption.txt",nrows=70000,sep= ";",stringsAsFactors = FALSE)
df = subset(df,Date=="1/2/2007" | Date=="2/2/2007")
# length(df$Date)/(60*24)  # --> there are 2 complete days in the sample

# convert to numeric
df$Sub_metering_1 = as.numeric(df$Sub_metering_1)
df$Sub_metering_2 = as.numeric(df$Sub_metering_2)
df$Sub_metering_3 = as.numeric(df$Sub_metering_3)
df$Global_active_power = as.numeric(df$Global_active_power)
df$Global_reactive_power = as.numeric(df$Global_reactive_power)
df$Voltage = as.numeric(df$Voltage)

# convert to Date 
df$DateTime <- strptime(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S") 

png(filename = "plot4.png",width = 480, height = 480)

par(mfrow=c(2,2))

# make first plot
plot(df$DateTime,df$Global_active_power,ylab="Global Active Power",xlab="",type = "n")
lines(df$DateTime,df$Global_active_power)

# make second plot
plot(df$DateTime,df$Voltage,ylab="Voltage",xlab="datetime",type = "n")
lines(df$DateTime,df$Voltage)

# make third plot
plot(df$DateTime,df$Sub_metering_1,ylab="Energy sub metering",xlab="",type = "n")
lines(df$DateTime,df$Sub_metering_1,col="black")  
lines(df$DateTime,df$Sub_metering_2,col="red")
lines(df$DateTime,df$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty=1)

# make fourth plot
plot(df$DateTime,df$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type = "n")
lines(df$DateTime,df$Global_reactive_power)


dev.off()

