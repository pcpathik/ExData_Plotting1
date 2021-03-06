data <- read.table("household_power_consumption.txt",sep = ";", header = T, na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_subset <- subset(data, Date == "2007-02-01" | Date == "2007-02-02" )
data_subset$Global_active_power <- as.character(data_subset$Global_active_power)
data_subset$Global_active_power <- as.numeric(data_subset$Global_active_power)

data_subset$timeStamp <- paste(data_subset$Date, data_subset$Time, sep = " ")
data_subset$timeStamp <- strptime(data_subset$timeStamp, "%Y-%m-%d %H:%M:%S")

png("plot3.png", width = 480, height = 480, units = "px")
plot(data_subset$timeStamp, data_subset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", main = "")
lines(data_subset$timeStamp, data_subset$Sub_metering_2,  col="red")
lines(data_subset$timeStamp, data_subset$Sub_metering_3,  col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()
