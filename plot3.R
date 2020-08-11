
# read data into R  
files <- file('household_power_consumption.txt')  
feature_set <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')  

# Plot 3
# convert data and time to specific format
feature_set$Date <- as.Date(feature_set$Date, format = '%d/%m/%Y')
feature_set$DateTime <- as.POSIXct(paste(feature_set$Date, feature_set$Time))

# open device
if(!file.exists('PNGplot')) dir.create('PNGplot')
png(filename = './PNGplot/plot3.png', width = 480, height = 480, units='px')
# plot figure
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(feature_set$DateTime, feature_set$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(feature_set$DateTime, feature_set$Sub_metering_2, col = 'red')
lines(feature_set$DateTime, feature_set$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
# close device
dev.off()


