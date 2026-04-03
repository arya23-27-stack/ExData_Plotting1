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
