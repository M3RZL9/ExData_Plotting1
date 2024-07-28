library(patchwork)

plot1 <- ggplot(data2, aes(x = DateTime, y = Global_active_power)) +
  geom_line() +
  labs(x = "", y = "Global Active Power") +
  scale_x_datetime(date_labels = "%a", date_breaks = "1 day") +
  theme_minimal()

plot2 <- ggplot(data2, aes(x = DateTime, y = Voltage)) +
  geom_line() +
  labs(x = "datetime", y = "Voltage") +
  scale_x_datetime(date_labels = "%a", date_breaks = "1 day") +
  theme_minimal()

plot3 <- ggplot(data2, aes(x = DateTime)) +
  geom_line(aes(y = Sub_metering_1, color = "Sub_metering_1")) +
  geom_line(aes(y = Sub_metering_2, color = "Sub_metering_2")) +
  geom_line(aes(y = Sub_metering_3, color = "Sub_metering_3")) +
  labs(x = "", y = "Energy sub metering") +
  scale_x_datetime(date_labels = "%a", date_breaks = "1 day") +
  scale_color_manual("", values = c("Sub_metering_1" = "black", "Sub_metering_2" = "red", "Sub_metering_3" = "blue")) +
  theme_minimal() +
  theme(legend.position = "topright", legend.title = element_blank(), legend.background = element_blank())

plot4 <- ggplot(data2, aes(x = DateTime, y = Global_reactive_power)) +
  geom_line() +
  labs(x = "datetime", y = "Global_reactive_power") +
  scale_x_datetime(date_labels = "%a", date_breaks = "1 day") +
  theme_minimal()

# Combining plots
combined_plot <- (plot1 | plot2) / (plot3 | plot4)

# Saving
ggsave("plot4.png", plot = combined_plot, width = 8, height = 8, dpi = 100)
