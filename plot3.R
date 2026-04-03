# Load dataset
data <- read.table(
  "household_power_consumption.txt",
  header = TRUE,
  sep = ";",
  na.strings = "?",
  stringsAsFactors = FALSE
)

# Convert Date column
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset required dates
data <- subset(
  data,
  Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")
)

# Create datetime variable
data$DateTime <- strptime(
  paste(data$Date, data$Time),
  format = "%Y-%m-%d %H:%M:%S"
)

# plot3.R

# Read data
data <- read.table(
  "household_power_consumption.txt",
  header = TRUE,
  sep = ";",
  na.strings = "?",
  stringsAsFactors = FALSE
)

# Convert Date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset for 2007-02-01 and 2007-02-02
sub_data <- subset(
  data,
  Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")
)

# Create datetime variable
sub_data$DateTime <- strptime(
  paste(sub_data$Date, sub_data$Time),
  format = "%Y-%m-%d %H:%M:%S"
)

# Convert variables to numeric
sub_data$Sub_metering_1 <- as.numeric(sub_data$Sub_metering_1)
sub_data$Sub_metering_2 <- as.numeric(sub_data$Sub_metering_2)
sub_data$Sub_metering_3 <- as.numeric(sub_data$Sub_metering_3)

# Create PNG
png("plot3.png", width = 480, height = 480)

# Plot first line
plot(
  sub_data$DateTime,
  sub_data$Sub_metering_1,
  type = "l",
  xlab = "",
  ylab = "Energy sub metering"
)

# Add other lines
lines(sub_data$DateTime, sub_data$Sub_metering_2, col = "red")
lines(sub_data$DateTime, sub_data$Sub_metering_3, col = "blue")

# Add legend
legend(
  "topright",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1,
  bty = "n"
)

# Close device
dev.off()