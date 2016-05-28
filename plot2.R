library(data.table)
Sys.setlocale("LC_ALL","English")
unzipped_file<-unzip("exdata-data-household_power_consumption.zip")
all_data<-fread(unzipped_file, sep=";", na.strings="?")
plot_data<-all_data[all_data$Date %in% c("1/2/2007", "2/2/2007"), ]
date_time<-strptime(paste(plot_data$Date, plot_data$Time), "%d/%m/%Y %H:%M:%S")
png(filename="plot2.png")
plot(date_time, plot_data$Global_active_power, pch=".", ylab="Global Active Power (kilowatts)", type="l", xlab ="")
dev.off()
