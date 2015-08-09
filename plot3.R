#download, unzip and read the data
fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,"temp.zip",method="curl")
unzip("temp.zip")
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",nrows=2075259)

#convert dates using as.Date()
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

#extract data only for 2007-02-01 and 2007-02-02
data2<-rbind(data[data$Date=="2007-02-01",],data[data$Date=="2007-02-02",])

png(file="plot3.png") #open png device; create "plot3.png"
par(mfrow=c(1,1),mar=c(5,5,3,1)) #set the margins
#make the historgram
plot(data3$Time,data3$Sub_metering_1,t="l",xlab="",ylab="Energy sub metering") 
lines(data3$Time,data3$Sub_metering_2,col="red")
lines(data3$Time,data3$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off() #close the png device