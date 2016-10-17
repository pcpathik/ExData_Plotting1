data <- read.table("household_power_consumption.txt",sep = ";", header = T)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_subset <- subset(data, Date == "2007-02-01" | Date == "2007-02-02" )
data_subset$Global_active_power <- as.character(data_subset$Global_active_power)
data_subset$Global_active_power <- as.numeric(data_subset$Global_active_power)

data_subset$timeStamp <- paste(data_subset$Date, data_subset$Time, sep = " ")
data_subset$timeStamp <- strptime(data_subset$timeStamp, "%Y-%m-%d %H:%M:%S")

png("plot4.png", width = 480, height = 480, units = "px")
op <- par(no.readonly = T)
par(mfrow = c(2,2))
plot(data_subset$timeStamp, data_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)", main = "")

plot(data_subset$timeStamp, data_subset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", main = "")


plot(data_subset$timeStamp, data_subset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", main = "")
lines(data_subset$timeStamp, data_subset$Sub_metering_2,  col="red")
lines(data_subset$timeStamp, data_subset$Sub_metering_3,  col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

plot(data_subset$timeStamp, data_subset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", main = "")

par(op)
dev.off()


