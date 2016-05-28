library(data.table)
Sys.setlocale("LC_ALL","English")
unzipped_file<-unzip("exdata-data-household_power_consumption.zip")
all_data<-fread(unzipped_file, sep=";", na.strings="?")
plot_data<-all_data[all_data$Date %in% c("1/2/2007", "2/2/2007"), ]
date_time<-strptime(paste(plot_data$Date, plot_data$Time), "%d/%m/%Y %H:%M:%S")
png(filename="plot4.png")
par(mfrow=c(2,2))
plot(date_time, plot_data$Global_active_power, pch=".", ylab="Global Active Power (kilowatts)", type="l", xlab ="")

plot(date_time, plot_data$Voltage, pch=".", ylab="Voltage", type="l", xlab ="datetime")

plot(date_time, plot_data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(date_time, plot_data$Sub_metering_2, type="l", col="red")
lines(date_time, plot_data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1), col=c("black", "red", "blue"), bty="n")

plot(date_time, plot_data$Global_reactive_power, pch=".", ylab="Global_reactive_power", type="l", xlab ="datetime")

dev.off()