# Plot 4

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

    # top left
    plot(
        df$Timestamp,
        df$Global_active_power,
        xlab = "", 
        ylab = "Global Active Power",
        type = "n"
    )
    lines(df$Timestamp, df$Global_active_power)

    # top right
    plot(
        df$Timestamp,
        df$Voltage,
        xlab = "datetime", 
        ylab = "Voltage",
        type = "n"
    )
    lines(df$Timestamp, df$Voltage)
    
    # bottom left
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
        lty = 1,
        bty = "n"
    )
    
    # bottom right
    plot(
        df$Timestamp,
        df$Global_reactive_power,
        xlab = "datetime",
        ylab = "Global_reactive_power",
        type = "n"
    )
    lines(df$Timestamp, df$Global_reactive_power)
    
dev.off()
