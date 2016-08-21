# Plot 2

source("load_the_data.R")

png("plot2.png", width = 480, height = 480)
plot(
    df$Timestamp,
    df$Global_active_power,
    xlab = "", 
    ylab = "Global Active Power (kilowatts)",
    type = "n"
)
lines(df$Timestamp, df$Global_active_power)
dev.off()
