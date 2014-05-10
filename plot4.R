# read data from csv and filter dates so that only data 
# from feb 1, 2007 and feb 2, 2007 is used
options(stringsAsFactors = FALSE) 
dat <- read.csv("data/household_power_consumption.txt", sep=";")
powerconsumption <- dat[dat$Date == "1/2/2007" | dat$Date == "2/2/2007", ]

# get the required columns from our dataset and convert the strings to numeric
activepower <- as.numeric(powerconsumption$Global_active_power)
reactivepower <- as.numeric(powerconsumption$Global_reactive_power)
voltage <- as.numeric(powerconsumption$Voltage)
submetering1 <- as.numeric(powerconsumption$Sub_metering_1)
submetering2 <- as.numeric(powerconsumption$Sub_metering_2)
submetering3 <- as.numeric(powerconsumption$Sub_metering_3)

# create a png file
png("plot4.png", bg="white", width=480, height=480)

# we want 4 plots
par(mfrow=c(2,2))

# plot 1
plot(activepower, type="l", ylab="Global Active Power", xlab="",
     axes=FALSE, ylim=c(0, 8), frame.plot=TRUE) 
axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
axis(2, at=c(0, 2, 4, 6))

# plot 2
plot(voltage, type="l", ylab="Voltage", xlab="datetime",
     axes=FALSE, ylim=c(234, 246), frame.plot=TRUE) 
axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
axis(2, at=c(234, 238, 242, 246))

# plot 3
plot(submetering1, type="l", ylab="Energy sub metering", xlab="",
     axes=FALSE, ylim=c(0, 40), frame.plot=TRUE, col="black")
points(submetering2, type="l", col="#ff2500")
points(submetering3, type="l", col="#0433ff")
axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
axis(2, at=c(0, 10, 20, 30))
legend("topright", bty="n",
       legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("#000000", "#ff2500", "#0433ff"), lty=1)

# plot 4
plot(reactivepower, type="l", ylab="Global_reactive_power", xlab="datetime",
     axes=FALSE, ylim=c(0.0, 0.5), frame.plot=TRUE) 
axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
axis(2, at=c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5))

# close the file
dev.off()
