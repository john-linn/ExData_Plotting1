
# Assume: provided data file downloaded and unzipped
# into user's home folder
household_power_consumption <- read.csv("~/household_power_consumption.txt", 
                                        sep=";", stringsAsFactors=FALSE)

seldates <- household_power_consumption[household_power_consumption$Date=="1/2/2007"
                                        | household_power_consumption$Date=="2/2/2007",]

png(filename="plot2.png")
# discussion forum yielded clue about producing day-ticked X-axis
dates <- strptime(paste(seldates$Date, seldates$Time), format="%d/%m/%Y %H:%M:%S")
plot(dates, as.numeric(seldates$Global_active_power), type="l",
     xlab=NULL , ylab="Global Active Power (kilowatts)")
dev.off()
