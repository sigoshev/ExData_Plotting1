library(dplyr)

household_power_consumption <- 
    read.csv("household_power_consumption.txt", sep=";", 
             na.strings="?", stringsAsFactors=FALSE)
household_power_consumption <- 
    household_power_consumption %>%
    filter(Date == "1/2/2007" | Date == "2/2/2007")

png("Plot1.png")
hist(household_power_consumption$Global_active_power,
     col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()