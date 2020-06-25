# Coursera "Exploratory data analysis" class project #1

# the script assumes that the source data set has been downloaded
# and un-zipped in the current working directory

# we will use dplyr library
library(dplyr)
par(mfrow=c(1,1))

# read 2880 lines from the data set to satisfy the assignment
# requirement: "We will only be using data from the dates
#               2007-02-01 and 2007-02-02"
my_data <- read.csv2("household_power_consumption.txt", skip = 66636, nrows = 2880)

# add the column names (because we did skip the header)
colnames(my_data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# convert variables from factor to numeric (need to use character step)
my_data[,3] <- as.numeric(as.character(my_data[,3]))
my_data[,4] <- as.numeric(as.character(my_data[,4]))
my_data[,5] <- as.numeric(as.character(my_data[,5]))
my_data[,6] <- as.numeric(as.character(my_data[,6]))
my_data[,7] <- as.numeric(as.character(my_data[,7]))
my_data[,8] <- as.numeric(as.character(my_data[,8]))
my_data[,9] <- as.numeric(as.character(my_data[,9]))

# mutate data frame by ading datetime column
my_data <- mutate(my_data, datetime = strptime(paste(Date,Time), "%d/%m/%Y %H:%M:%S"))

# now we create the second plot
plot(my_data$datetime, my_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
# and do the same in the PNG file
png(file = "plot2.png", width = 480, height = 480)
plot(my_data$datetime, my_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
