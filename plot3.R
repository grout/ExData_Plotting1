# read data from csv and filter dates so that only data 
# from feb 1, 2007 and feb 2, 2007 is used
options(stringsAsFactors = FALSE) 
dat <- read.csv("data/household_power_consumption.txt", sep=";")
powerconsumption <- dat[dat$Date == "1/2/2007" | dat$Date == "2/2/2007", ]

# get the required columns from our dataset and convert the strings to numeric/time
submetering1 <- as.numeric(powerconsumption$Sub_metering_1)
submetering2 <- as.numeric(powerconsumption$Sub_metering_2)
submetering3 <- as.numeric(powerconsumption$Sub_metering_3)

# create a png file
png("plot3.png", bg="white", width=480, height=480)

# plot data
plot(submetering1, type="l", ylab="Energy sub metering", xlab="",
     axes=FALSE, ylim=c(0, 40), frame.plot=TRUE, col="black")
points(submetering2, type="l", col="#ff2500")
points(submetering3, type="l", col="#0433ff")
axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
axis(2, at=c(0, 10, 20, 30))
legend("topright", 
       legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("#000000", "#ff2500", "#0433ff"), lty=1)

# close the file
dev.off()
