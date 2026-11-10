
# Course Project 1
# Plot 4 - Four Graphs

# 1. Read the dataset
data <- read.table(
  "household_power_consumption.txt",
  header = TRUE,
  sep = ";",
  na.strings = "?",
  stringsAsFactors = FALSE
)

# 2. Select February 1 and 2, 2007
data <- subset(
  data,
  Date %in% c("1/2/2007", "2/2/2007")
)

# 3. Convert Date and Time into datetime
datetime <- strptime(
  paste(data$Date, data$Time),
  format = "%d/%m/%Y %H:%M:%S"
)

# 4. Create Plot 4
png("plot4.png", width = 480, height = 480)

# Set up a 2 by 2 plotting layout
par(mfrow = c(2, 2))

# Top left: Global Active Power
plot(
  datetime,
  data$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power"
)

# Top right: Voltage
plot(
  datetime,
  data$Voltage,
  type = "l",
  xlab = "",
  ylab = "Voltage"
)

# Bottom left: Energy Sub Metering
plot(
  datetime,
  data$Sub_metering_1,
  type = "l",
  xlab = "datetime",
  ylab = "Energy sub metering"
)

lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3, col = "blue")

legend(
  "topright",
  legend = c(
    "Sub_metering_1",
    "Sub_metering_2",
    "Sub_metering_3"
  ),
  col = c("black", "red", "blue"),
  lty = 1,
  bty = "n"
)

# Bottom right: Global Reactive Power
plot(
  datetime,
  data$Global_reactive_power,
  type = "l",
  xlab = "datetime",
  ylab = "Global_reactive_power"
)

# 5. Close the PNG device
dev.off()

# 6. Confirmation
print("Plot 4 successfully created!")
print(dim(data))
