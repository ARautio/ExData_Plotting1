#Download File
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp,method="curl")


# Read data
data <- read.table(file=unz(temp,"household_power_consumption.txt"),sep=";",header=TRUE,na.strings = "?")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data$DateTime <-strptime(paste(data$Date,data$Time),"%Y-%m-%d %H:%M:%S")
unlink(temp)

# Write Plot 2
png(file="plot2.png",width=480,height=480)
plot(data$DateTime,data$Global_active_power,
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)" )
dev.off()