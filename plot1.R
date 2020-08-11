
# read data into R  
files <- file('household_power_consumption.txt')  
feature_set <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')  

# Plot 1  
# open device  
if(!file.exists('PNGplot')) dir.create('PNGplot')  
png(filename = './PNGplot/plot1.png', width = 480, height = 480, units='px')  
# plot figure  
with(feature_set, hist(Global_active_power, xlab = 'Global Active Power (kilowatt)', main = 'Global Active Power', col = 'red'))  
# close device  
dev.off()  
