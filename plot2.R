#Read the data
hpc<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings="?",stringsAsFactors=F)

#Extracting data (i.e. rows) on required dates
hpc2<-hpc[(hpc$Date=="1/2/2007" | hpc$Date=="2/2/2007"),]

#Converting joining Date and Time fields and converting new column in POSIXct class
hpc3<-cbind(data.frame(DateTime=strptime(paste(hpc2$Date,hpc2$Time),format="%d/%m/%Y %T")),hpc2)

#
#Opeing up a PNG graphics device
png(filename = "plot2.png",width = 480, height = 480)
#Making Plot 2 (a line graph between time and Global Active Power)
with(hpc3,plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power",main=""))
dev.off()
