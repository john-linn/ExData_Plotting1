# Assume: provided data file downloaded and unzipped
# into user's home folder
household_power_consumption <- read.csv("~/household_power_consumption.txt", 
                                        sep=";", stringsAsFactors=FALSE)

seldates <- household_power_consumption[household_power_consumption$Date=="1/2/2007"
                                        | household_power_consumption$Date=="2/2/2007",]

png(filename="plot3.png")
# discussion forum yielded clue about producing day-ticked X-axis
dates <- strptime(paste(seldates$Date, seldates$Time), format="%d/%m/%Y %H:%M:%S")

plot(dates, as.numeric(seldates$Sub_metering_1), type="n", main="",
     xlab="", ylab="Energy sub metering")
lines(dates, as.numeric(seldates$Sub_metering_1), type="l", col="black")
lines(dates, as.numeric(seldates$Sub_metering_2), type="l", col="red")
lines(dates, as.numeric(seldates$Sub_metering_3), type="l", col="blue")
legend("topright", col=c("black","red","blue"), lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
