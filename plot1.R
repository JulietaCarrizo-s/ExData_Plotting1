
# Course Project 1
# Plot 1 - Global Active Power

# 1. Read the dataset
data <- read.table(
  "household_power_consumption.txt",
  header = TRUE,
  sep = ";",
  na.strings = "?",
  stringsAsFactors = FALSE
)

# 2. Select data from February 1 and 2, 2007
data <- subset(
  data,
  Date %in% c("1/2/2007", "2/2/2007")
)

# 3. Check the dataset
print(dim(data))

# 4. Create the PNG file
png("plot1.png", width = 480, height = 480)

hist(
  data$Global_active_power,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)"
)

dev.off()

# 5. Confirm that the file was created
print("Plot 1 successfully created!")
print(getwd())
