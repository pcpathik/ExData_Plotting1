data <- read.table("household_power_consumption.txt",sep = ";", header = T)
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data_subset <- subset(data, Date == "2007-02-01" | Date == "2007-02-02" )
data_subset$Global_active_power <- as.character(data_subset$Global_active_power)
data_subset$Global_active_power <- as.numeric(data_subset$Global_active_power)

png("plot1.png", width = 480, height = 480, units = "px")
hist(data_subset$Global_active_power, col = "red", xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")
dev.off()
