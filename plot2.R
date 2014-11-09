power<-read.table('household_power_consumption.txt', sep=';', stringsAsFactors=F, na.strings='?',header=T, colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
power$Date<-as.Date(power$Date, format='%d/%m/%Y')

feb<-subset(power, subset=(Date >= '2007-02-01' & Date <= '2007-02-02'))

timestamp<-paste(as.Date(feb$Date),feb$Time)
feb$timestamp<-as.POSIXct(timestamp)

png(filename='plot2.png',width=480,height=480)
plot(feb$Global_active_power~feb$timestamp,type='l',xlab='',ylab='Global Active Power (kilowatts)')
dev.off()