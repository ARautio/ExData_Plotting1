#Download File
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp,method="curl")


# Read data
data <- read.table(file=unz(temp,"household_power_consumption.txt"),sep=";",header=TRUE,na.strings = "?")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data$DateTime <-strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S")
unlink(temp)

# Write Plot 3
Sys.setlocale("LC_TIME", "en_gb")
png(file="plot3.png",width=480,height=480)
plot(data$DateTime,data$Sub_metering_1,
     type="l", 
     xlab="", 
     ylab="Energy sub metering" )
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright", # Set location for legend
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), # Set names
       lty=c(1,1,1), 
       lwd=c(1,1,1),
       col=c("black","red","blue")) 
dev.off()