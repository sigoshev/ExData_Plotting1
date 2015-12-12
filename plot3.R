library(dplyr)

household_power_consumption <- 
    read.csv("household_power_consumption.txt", sep=";", 
             na.strings="?", stringsAsFactors=FALSE)
household_power_consumption <- 
    household_power_consumption %>%
    filter(Date == "1/2/2007" | Date == "2/2/2007")

household_power_consumption <-
    household_power_consumption %>%
    mutate(DateTime = as.POSIXct(paste(Date, Time), 
                                 format="%d/%m/%Y %H:%M:%S"))

png("Plot3.png")
plot(household_power_consumption$DateTime,
     household_power_consumption$Sub_metering_1,
     xlab = "",
     ylab = "Energy sub metering",
     type = "l")
lines(household_power_consumption$DateTime,
      household_power_consumption$Sub_metering_2,
      col = "red")
lines(household_power_consumption$DateTime,
      household_power_consumption$Sub_metering_3,
      col = "blue")
legend("topright", 
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)
dev.off()