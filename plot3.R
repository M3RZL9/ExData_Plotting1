# data2 from plot2.R

# Plotting
# For some reason plotting like in plot1.R showed dates on x axis, not weekdays
p <- ggplot(data2, aes(x = DateTime)) +
  geom_line(aes(y = Sub_metering_1, color = "Sub_metering_1")) +
  geom_line(aes(y = Sub_metering_2, color = "Sub_metering_2")) +
  geom_line(aes(y = Sub_metering_3, color = "Sub_metering_3")) +
  labs(x = "", y = "Energy sub metering") +
  scale_x_datetime(date_labels = "%a", date_breaks = "1 day") +
  scale_color_manual("", values = c("Sub_metering_1" = "black", "Sub_metering_2" = "red", "Sub_metering_3" = "blue")) +
  theme_minimal() +
  theme(legend.title = element_blank())

# Saving
ggsave("plot3.png", plot = p, width = 6, height = 6, dpi = 100)
