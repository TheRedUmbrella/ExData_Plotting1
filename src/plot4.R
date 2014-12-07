## Read data.  Assumes data is in data folder
data<-read.csv("../data/household_power_consumption.txt", strip.white=TRUE,na.strings= c("?",""),colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),sep=";")

## Subset by date
subset_data<-subset(data,Date=="1/2/2007" | Date=="2/2/2007")

## Change date formats
datetime<-paste(subset_data$Date, subset_data$Time)
subset_data$DateTime<-strptime(datetime,"%d/%m/%Y %H:%M:%S")

## Open png device
png(file="../figure/plot4.png")

## Multiple plots (2x2) 
par(mfrow=c(2,2))

## Generate plots
with(subset_data,plot(DateTime,Global_active_power,type="l",ylab="Global Active Power",xlab=""))

with(subset_data,plot(DateTime,Voltage,type="l",xlab="datetime"))

plot(subset_data$DateTime,subset_data$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
lines(subset_data$DateTime,subset_data$Sub_metering_1)
lines(subset_data$DateTime,subset_data$Sub_metering_2,col="red")
lines(subset_data$DateTime,subset_data$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),box.lwd=0) ## Create legend

with(subset_data,plot(DateTime,Global_reactive_power,type="l",xlab="datetime"))

dev.off()