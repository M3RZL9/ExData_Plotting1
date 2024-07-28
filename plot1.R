library(data.table)
library(dplyr)
library(lubridate)

data <- fread("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE,
              select = c("Date", "Time", "Global_active_power", "Global_reactive_power",
                         "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
              colClasses = list(character = c("Date", "Time")))


# Transforming Date, filtering data
data <- data |> 
  mutate(Date = dmy(Date)) |> 
  filter(Date >= ymd("2007-02-01") & Date <= ymd("2007-02-02"))

#Plotting
png("plot1.png", width=480, height=480)

# Plot 1
hist(data[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
