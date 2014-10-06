#Download File
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp,method="curl")


# Read data
data <- read.table(file=unz(temp,"household_power_consumption.txt"),sep=";",header=TRUE,na.strings = "?")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data$DateTime <-strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S")
unlink(temp)

# Write Plot 4
Sys.setlocale("LC_TIME", "en_gb") # Set language local to get correct language in Dates
png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2)) # Split chart to four (2x2 plot)

# 1,1 Plot
plot(data$DateTime,data$Global_active_power,type="l", 
     xlab="", 
     ylab="Global Active Power" )

# 1,2 Plot
plot(data$DateTime,data$Voltage,type="l", 
     xlab="datetime", 
     ylab="Voltage" )

# 2,1 Plot
plot(data$DateTime,data$Sub_metering_1,type="l", 
     xlab="", 
     ylab="Energy sub metering" )
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright",
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1,1), 
       lwd=c(1,1,1),
       col=c("black","red","blue"),
       bty = "n") # this removed the box 

# 2,2 Plot
plot(data$DateTime,data$Global_reactive_power,type="l", 
     xlab="datetime",
     ylab="Global_reactive_power")
dev.off()