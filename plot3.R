library(dplyr)

if(!file.exists("datasets/household_power_consumption.txt")){
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  dir.create("datasets")
  download.file(url,"datasets/household_power_consumption.zip",method="curl")
  unzip(zipfile = "datasets/household_power_consumption.zip", exdir = "datasets")
}

png("plot3.png", width = 480, height = 480)

data <- read.table("datasets/household_power_consumption.txt",sep = ";",header = TRUE)

data1 <- data%>%filter(as.Date(data$Date,"%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(data$Date,"%d/%m/%Y") <= as.Date("2007-02-02"))

plot(strptime(paste(data1$Date,data1$Time),"%d/%m/%Y %H:%M:%S"),as.numeric(data1$Sub_metering_1),type = "l",xlab = "",ylab = "Energy sub metering")

points(strptime(paste(data1$Date,data1$Time),"%d/%m/%Y %H:%M:%S"),as.numeric(data1$Sub_metering_2),col="red",type = "l")

points(strptime(paste(data1$Date,data1$Time),"%d/%m/%Y %H:%M:%S"),as.numeric(data1$Sub_metering_3),col="blue",type = "l")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd=2)

dev.off()