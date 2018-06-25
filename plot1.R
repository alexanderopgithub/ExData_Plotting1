# read the relevant part of the txt file
df <- read.csv(file = "household_power_consumption.txt",nrows=70000,sep= ";",stringsAsFactors = FALSE)
df = subset(df,Date=="1/2/2007" | Date=="2/2/2007")
# length(df$Date)/(60*24)  # --> there are 2 complete days in the sample

# convert to numeric
df$Global_active_power = as.numeric(df$Global_active_power)

png(filename = "plot1.png",width = 480, height = 480)

# reset to single plot
par(mfrow=c(1,1))

# make the desired plot
hist(df$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power",breaks=12)

dev.off()
