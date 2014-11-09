power<-read.table('household_power_consumption.txt', sep=';', stringsAsFactors=F, na.strings='?',header=T, colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
power$Date<-as.Date(power$Date, format='%d/%m/%Y')

feb<-subset(power, subset=(Date >= '2007-02-01' & Date <= '2007-02-02'))

png(filename='plot1.png', width=480, height=480)
hist(feb$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()