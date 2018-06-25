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

# convert to Date 
df$DateTime <- strptime(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S") 

png(filename = "plot3.png",width = 480, height = 480)

# reset to single plot
par(mfrow=c(1,1))

# make the desired plot
plot(df$DateTime,df$Sub_metering_1,ylab="Energy sub metering",xlab="",type = "n")
lines(df$DateTime,df$Sub_metering_1,col="black")  
lines(df$DateTime,df$Sub_metering_2,col="red")
lines(df$DateTime,df$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty=1)

dev.off()

