#Download File
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp,method="curl")


# Read data
data <- read.table(file=unz(temp,"household_power_consumption.txt"),sep=";",header=TRUE,na.strings = "?")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
unlink(temp)

# Write Plot 1
png(file="plot1.png",width=480,height=480)
hist(data$Global_active_power,
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     ylim = range(0,1200),
     col = "red")
dev.off()