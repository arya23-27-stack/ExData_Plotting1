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

# plot1.R

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

# Convert Global_active_power to numeric
sub_data$Global_active_power <- as.numeric(sub_data$Global_active_power)

# Create PNG
png("plot1.png", width = 480, height = 480)

# Plot
hist(
  sub_data$Global_active_power,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)"
)

# Close device
dev.off()

