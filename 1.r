getwd()

if (!file.exists("data")){
      dir.create("data")
}

temp <- tempfile()
fileUrl<-"http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,temp)
unzip(temp,exdir="./data" )
data<-read.table("./data/household_power_consumption.txt", colClasses = "character", sep=";", header=TRUE)
data$Date<-as.Date(data$Date,"%d/%m/%Y") 
data1<-as.Date("2007-02-01")
data2<-as.Date("2007-02-02")
out<-data[(data$Date>=data1 & data$Date<=data2),]