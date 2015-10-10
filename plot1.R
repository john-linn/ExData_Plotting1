
# Assume: provided data file downloaded and unzipped
# into user's home folder
household_power_consumption <- read.csv("~/household_power_consumption.txt", 
                                        sep=";", stringsAsFactors=FALSE)

seldates <- household_power_consumption[household_power_consumption$Date=="1/2/2007"
                                        | household_power_consumption$Date=="2/2/2007",]

png(filename="plot1.png",bg="grey87")
hist(as.numeric(seldates$Global_active_power), col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", ylim=c(0,1200))
dev.off()


