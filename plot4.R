power<-read.table('household_power_consumption.txt', sep=';', stringsAsFactors=F, na.strings='?',header=T, colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
power$Date<-as.Date(power$Date, format='%d/%m/%Y')

feb<-subset(power, subset=(Date >= '2007-02-01' & Date <= '2007-02-02'))
~/Desktop/plot4.png
timestamp<-paste(as.Date(feb$Date),feb$Time)
feb$timestamp<-as.POSIXct(timestamp)

png(filename='plot4.png',width=480,height=480)
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(feb, {
plot(Global_active_power~timestamp,type='l',xlab='',ylab='Global Active Power')
plot(Voltage~timestamp,type='l',ylab='Voltage',xlab='datetime')	
plot(timestamp,Sub_metering_1,type='l',xlab='',ylab='Energy sub metering')
lines(timestamp,Sub_metering_2,col='red')
lines(timestamp,Sub_metering_3,col='blue')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lwd=par('lwd'))
plot(Global_reactive_power~timestamp,type='l',ylab='Gloal Reactive Power',xlab='datetime')	
})
dev.off()