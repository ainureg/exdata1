getwd()

if (!file.exists("data")){
      dir.create("data")
}

temp <- tempfile()
fileUrl<-"http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,temp)
unzip(temp,exdir="./data" )
data<-read.table("household_power_consumption.txt", colClasses = "character", sep=";")