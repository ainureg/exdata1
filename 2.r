if (!file.exists("data/household_power_consumption.txt")){
        dir.create("data")
        temp <- tempfile()
        fileUrl<-"http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileUrl,temp)
        unzip(temp,exdir="./data" )
}

data<-read.table("./data/household_power_consumption.txt", colClasses = "character", sep=";", header=TRUE)
data$Date<-as.Date(data$Date,"%d/%m/%Y") 
date1<-as.Date("2007-02-01")
date2<-as.Date("2007-02-02")
out<-data[(data$Date>=date1 & data$Date<=date2),]
Sys.setlocale('LC_TIME', 'C')
colnames1<-colnames(out)
dates<-out$Date
times<-out$Time
x <- paste(dates, times)
out<-cbind(out, strptime(x, "%Y-%m-%d %H:%M:%S") )
colnames(out)<-c(colnames1,"DT")
par(mfrow=c(1,1))



#2

plot(out$DT, out$Global_active_power, type="l",ylab ="Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file="2.png")
dev.off()