library(dplyr)

household_power_consumption <- 
    read.csv("household_power_consumption.txt", sep=";", 
             na.strings="?", stringsAsFactors=FALSE)
household_power_consumption <- 
    household_power_consumption %>%
    filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
    mutate(DateTime = as.POSIXct(paste(Date, Time), 
                                 format="%d/%m/%Y %H:%M:%S"))

png("Plot2.png")
plot(household_power_consumption$DateTime, 
     household_power_consumption$Global_active_power,
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l")
dev.off()