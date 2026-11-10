
# Course Project 1
# Plot 3 - Energy Sub Metering

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

# 4. Create Plot 3
png("plot3.png", width = 480, height = 480)

plot(
  datetime,
  data$Sub_metering_1,
  type = "l",
  xlab = "",
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

dev.off()

# 5. Confirmation
print("Plot 3 successfully created!")
print(dim(data))
