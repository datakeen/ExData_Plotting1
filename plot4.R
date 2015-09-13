#Read the data
hpc<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?",stringsAsFactors=F)

#Extracting data (i.e. rows) on required dates
hpc2<-hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007"),]

#Converting joining Date and Time fields and converting new column in POSIXct class
hpc3<-cbind(data.frame(DateTime=strptime(paste(hpc2$Date,hpc2$Time),format="%d/%m/%Y %T")),hpc2)

#
#Opeing up a PNG graphics device
png(filename = "plot4.png",width = 480, height = 480)

#Setting 2 rows and 2 columns of plots within graphic device
par(mfrow=c(2,2))

#Making Plot 1 of 4 (a line graph between time and Global Active Power)
with(hpc3,plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power",main=""))

#Making Plot 2 of 4 (a line graph between time and Voltage)
with(hpc3,plot(DateTime,Voltage,type="l",xlab="datetime"))

#Making Plot 3 of 4 (a line graph between time and Global Active Power)
with(hpc3,plot(DateTime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
with(hpc3,points(DateTime,Sub_metering_1,type="l",col="black"))
with(hpc3,points(DateTime,Sub_metering_2,type="l",col="red"))
with(hpc3,points(DateTime,Sub_metering_3,type="l",col="blue"))
legend("topright",lty=1,col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Making Plot 4 of 4 (a line graph between time and Global Reactive Power)
with(hpc3,plot(DateTime,Global_reactive_power,type="l",xlab="datetime"))

#Turning off of graphics device
dev.off()
