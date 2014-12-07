## Read data.  Assumes data is in data folder
data<-read.csv("../data/household_power_consumption.txt", strip.white=TRUE,na.strings= c("?",""),colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),sep=";")

## Subset by date
subset_data<-subset(data,Date=="1/2/2007" | Date=="2/2/2007")

## Generate histrogram
hist(subset_data$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

## Create png plot
dev.copy(png, file = "../figure/plot1.png")
dev.off()