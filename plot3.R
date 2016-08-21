# Plot 3

png("plot3.png", width = 480, height = 480)
plot(
    df$Timestamp,
    apply(df[, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")], 1, max),
    xlab = "", 
    ylab = "Energy sub metering",
    type = "n"
)
lines(df$Timestamp, df$Sub_metering_1, col = "black")
lines(df$Timestamp, df$Sub_metering_2, col = "red")
lines(df$Timestamp, df$Sub_metering_3, col = "blue")
legend(
    "topright",
    col = c("black", "red", "blue"),
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
    lty = 1
)
dev.off()
