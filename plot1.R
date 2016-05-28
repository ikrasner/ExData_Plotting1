library(data.table)
Sys.setlocale("LC_ALL","English")
unzipped_file<-unzip("exdata-data-household_power_consumption.zip")
all_data<-fread(unzipped_file, sep=";", na.strings="?")
plot_data<-all_data[all_data$Date %in% c("1/2/2007", "2/2/2007"), ]
png(filename="plot1.png")
hist(plot_data$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()

  
  
