# I accept that the horizontal axis is in my local date setting
# a solution like https://stackoverflow.com/questions/15627508/axis-date-in-another-language seems to mess with environment variables

# read the relevant part of the txt file
df <- read.csv(file = "household_power_consumption.txt",nrows=70000,sep= ";",stringsAsFactors = FALSE)
df = subset(df,Date=="1/2/2007" | Date=="2/2/2007")
# length(df$Date)/(60*24)  # --> there are 2 complete days in the sample

# convert to numeric
df$Global_active_power = as.numeric(df$Global_active_power)

# convert to Date 
df$DateTime <- strptime(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S") 

png(filename = "plot2.png",width = 480, height = 480)

# reset to single plot
par(mfrow=c(1,1))

# make the desired plot
plot(df$DateTime,df$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type = "n")
lines(df$DateTime,df$Global_active_power)

dev.off()

