hpc_file_name<-"household_power_consumption.txt"

hpc_data_head<-read.table(hpc_file_name, header=TRUE, sep=";", na.strings="?", nrows=1, stringsAsFactors=FALSE)
hpc_data_names<-names(hpc_data_head)

starting_row<-66637
num_of_rows_to_read<-2880
hpc_data<-read.table(hpc_file_name, sep=";", na.strings="?", skip=starting_row, nrows=num_of_rows_to_read, stringsAsFactors=FALSE)
names(hpc_data)<-hpc_data_names

hpc_data$Clock<-as.POSIXct(paste(hpc_data$Date, hpc_data$Time), format="%d/%m/%Y %H:%M:%S")

png(file="plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(Global_active_power ~ Clock, hpc_data, type="l", xlab="", ylab="Global Active Power")
plot(Voltage ~ Clock, hpc_data, type="l", xlab="datetime", ylab="Voltage")
with(hpc_data, plot(Clock, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(hpc_data, lines(Clock, Sub_metering_2, type="l", col = "red"))
with(hpc_data, lines(Clock, Sub_metering_3, type="l", col = "blue"))
legend("topright", bty="n", lty = c("solid", "solid","solid"), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(Global_reactive_power ~ Clock, hpc_data, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()