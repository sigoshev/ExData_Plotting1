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

png("Plot4.png")

par(mfcol = c(2, 2))

# Position (1, 1)
plot(household_power_consumption$DateTime, 
     household_power_consumption$Global_active_power,
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l")

# Position (2, 1)
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
       lwd = 1,
       bty = "n")

# Position (1, 2)
plot(household_power_consumption$DateTime,
     household_power_consumption$Voltage,
     xlab = "datetime",
     ylab = "Voltage",
     type = "l")

# Position (2, 2)
plot(household_power_consumption$DateTime,
     household_power_consumption$Global_reactive_power,
     xlab = "datetime",
     ylab = "Global_reactive_power",
     type = "l")

dev.off()