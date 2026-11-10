
# Course Project 1
# Plot 2 - Global Active Power over Time

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

# 4. Create Plot 2
png("plot2.png", width = 480, height = 480)

plot(
  datetime,
  data$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power (kilowatts)"
)

dev.off()

# 5. Confirmation
print("Plot 2 successfully created!")
print(dim(data))
