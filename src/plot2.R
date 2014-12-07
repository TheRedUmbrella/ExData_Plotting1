## Read data.  Assumes data is in data folder
data<-read.csv("../data/household_power_consumption.txt", strip.white=TRUE,na.strings= c("?",""),colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),sep=";")

## Subset by date
subset_data<-subset(data,Date=="1/2/2007" | Date=="2/2/2007")

## Change date formats
datetime<-paste(subset_data$Date, subset_data$Time)
subset_data$DateTime<-strptime(datetime,"%d/%m/%Y %H:%M:%S")

## Generate plot
with(subset_data,plot(DateTime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))

## Create png file
dev.copy(png, file = "../figure/plot2.png")
dev.off()