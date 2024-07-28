library(ggplot2)
# dataframe "data" comes from plot1.R
data2 <- data[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Making a POSIXct date capable of being filtered and graphed by time of day
data2[, DateTime := as.POSIXct(paste(Date, Time), format = "%Y-%m-%d %H:%M:%S")]

# Plotting
# For some reason plotting like in plot1.R showed dates on x axis, not weekdays
pic <- ggplot(data2, aes(x = DateTime, y = Global_active_power)) +
  geom_line() +
  labs(x = "", y = "Global Active Power (kilowatts)") +
  scale_x_datetime(date_labels = "%a", date_breaks = "1 day") +
  theme_minimal()

# Saving
ggsave("plot2.png", plot = pic, width = 6, height = 6, dpi = 100)
