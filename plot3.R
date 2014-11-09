power<-read.table('household_power_consumption.txt', sep=';', stringsAsFactors=F, na.strings='?',header=T, colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
power$Date<-as.Date(power$Date, format='%d/%m/%Y')

feb<-subset(power, subset=(Date >= '2007-02-01' & Date <= '2007-02-02'))

timestamp<-paste(as.Date(feb$Date),feb$Time)
feb$timestamp<-as.POSIXct(timestamp)

png(filename='plot3.png',width=480,height=480)
plot(feb$timestamp,feb$Sub_metering_1,type='l',xlab='',ylab='Energy sub metering')
lines(feb$timestamp,feb$Sub_metering_2,col='red')
lines(feb$timestamp,feb$Sub_metering_3,col='blue')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lwd=par('lwd'))
dev.off()