hpc_file_name<-"household_power_consumption.txt"

hpc_data_head<-read.table(hpc_file_name, header=TRUE, sep=";", na.strings="?", nrows=1, stringsAsFactors=FALSE)
hpc_data_names<-names(hpc_data_head)

starting_row<-66637
num_of_rows_to_read<-2880
hpc_data<-read.table(hpc_file_name, sep=";", na.strings="?", skip=starting_row, nrows=num_of_rows_to_read, stringsAsFactors=FALSE)
names(hpc_data)<-hpc_data_names

hpc_data$Clock<-as.POSIXct(paste(hpc_data$Date, hpc_data$Time), format="%d/%m/%Y %H:%M:%S")

png(file="plot2.png", width=480, height=480)
plot(Global_active_power ~ Clock, hpc_data, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()