library(dplyr)

if(!file.exists("datasets/household_power_consumption.txt")){
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  dir.create("datasets")
  download.file(url,"datasets/household_power_consumption.zip",method="curl")
  unzip(zipfile = "datasets/household_power_consumption.zip", exdir = "datasets")
}

png("plot1.png", width = 480, height = 480)

data <- read.table("datasets/household_power_consumption.txt",sep = ";",header = TRUE)

hist(as.numeric(unlist(data%>%
                         select(Global_active_power)%>%
                         filter(as.Date(data$Date,"%d/%m/%Y") >= as.Date("2007-02-01") & as.Date(data$Date,"%d/%m/%Y") <= as.Date("2007-02-02")))),
     col = "red",main = "Global Active Power",xlab = "Global Active Power (Kilowatts)")

dev.off()