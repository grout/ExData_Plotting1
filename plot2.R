# read data from csv and filter dates so that only data 
# from feb 1, 2007 and feb 2, 2007 is used
options(stringsAsFactors = FALSE) 
dat <- read.csv("data/household_power_consumption.txt", sep=";")
powerconsumption <- dat[dat$Date == "1/2/2007" | dat$Date == "2/2/2007", ]

# get the required columns from our dataset and convert the strings to numeric/time
activepower <- as.numeric(powerconsumption$Global_active_power)

# create a png file
png("plot2.png", bg="white", width=480, height=480)

# plot data
plot(activepower, type="l", ylab="Global Active Power (kilowatts)", xlab="",
     axes=FALSE, ylim=c(0, 8), frame.plot=TRUE) 
axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
axis(2, at=c(0, 2, 4, 6))

# close the file
dev.off()
