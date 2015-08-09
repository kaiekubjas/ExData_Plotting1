#download, unzip and read the data
fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,"temp.zip",method="curl")
unzip("temp.zip")
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",nrows=2075259)

#convert dates using as.Date()
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

#extract data only for 2007-02-01 and 2007-02-02
data2<-rbind(data[data$Date=="2007-02-01",],data[data$Date=="2007-02-02",])

png(file="plot1.png") #open png device; create "plot1.png"
par(mfrow=c(1,1),mar=c(5,5,3,1)) #set the margins
#make the historgram
hist(data2$Global_active_power,xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col="red")
dev.off() #close the png device