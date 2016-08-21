# **************************************************************************** #
# LOADING THE DATA                                                             #
# **************************************************************************** #

# Download the data from the course's website
download.file(
    "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
    "household_power_consumption.zip"
)

# Unzip
unzip("household_power_consumption.zip")

# Load the header and the rows of the input file that start by one of the 
# specified 2007-02-01 and 2007-02-02 dates. Note this code was tested on 
# a Fedora 24 Linux but not on other platforms.
df <- read.csv(
    pipe("echo \"$(head -1 household_power_consumption.txt)\" \"$(cat household_power_consumption.txt | grep '^[12]/2/2007;')\""), 
    sep = ";", 
    na.strings = "?",
    stringsAsFactors = F
)

# Convert to numerics all columns for which it is needed
# (note that as.numeric can't work on multiple columns, unless their values
# are inlist-ed first)
df[, !names(df) %in% c("Date", "Time")] <- as.numeric(unlist(df[, !names(df) %in% c("Date", "Time")]))

# Convert date and time to a manageable "Timestamp" POSIXlt column and drops the 
# original columns to avoid confusion
df$Timestamp <- strptime(paste(df$Date, df$Time, sep = " "), "%e/%m/%Y %H:%M:%S")
df <- df[, !names(df) %in% c("Date", "Time")]
