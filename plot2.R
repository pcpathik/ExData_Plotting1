data <- read.table("household_power_consumption.txt",sep = ";", header = T)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_subset <- subset(data, Date == "2007-02-01" | Date == "2007-02-02" )
data_subset$Global_active_power <- as.character(data_subset$Global_active_power)
data_subset$Global_active_power <- as.numeric(data_subset$Global_active_power)

data_subset$timeStamp <- paste(data_subset$Date, data_subset$Time, sep = " ")
data_subset$timeStamp <- strptime(data_subset$timeStamp, "%Y-%m-%d %H:%M:%S")

png("plot2.png", width = 480, height = 480, units = "px")
plot(data_subset$timeStamp, data_subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)", main = "")
dev.off()

