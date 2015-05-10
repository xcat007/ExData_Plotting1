makeplot3 <- function(){
  #Read in entire household power consumption table
  FullData <- read.table("household_power_consumption.txt",header = TRUE, sep =";",stringsAsFactors = FALSE)
  
  #Make smaller table of data for Feb1st and 2nd of 2007
  LiteData<- FullData[FullData$Date == "1/2/2007" | FullData$Date == "2/2/2007",]
  
  #Remove full table of data to save memory
  rm(FullData)
  
  #concatenate Data and Time
  LiteData$DateTime <- paste(LiteData$Date, LiteData$Time)
  
  # Convert data and time to data time format
  LiteData$DateTime <- strptime(LiteData$DateTime,format = "%d/%m/%Y %H:%M:%S")
  
  #--------------
  png('plot3.png', width = 480, height = 480)
    plot(LiteData$DateTime,as.numeric(LiteData$Sub_metering_1),  type = "l", ylab = "Energy sub metering", xlab = "")
    points(LiteData$DateTime,as.numeric(LiteData$Sub_metering_2),  type = "l", col = "red")
    points(LiteData$DateTime,as.numeric(LiteData$Sub_metering_3),  type = "l", col = "blue")
    legend("topright",col = c("black","red", "blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1))
  dev.off()
  
  
  # end of function to make plot 3
}