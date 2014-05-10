# read data from csv and filter dates so that only data 
# from feb 1, 2007 and feb 2, 2007 is used
options(stringsAsFactors = FALSE) 
dat <- read.csv("data/household_power_consumption.txt", sep=";")
powerconsumption <- dat[dat$Date == "1/2/2007" | dat$Date == "2/2/2007", ]

# get the required column from our dataset and convert the strings to numeric
activepower <- powerconsumption$Global_active_power
activepower <- as.numeric(activepower)

# create a png file
png("plot1.png", bg="white", width=480, height=480)

# plot data
hist(activepower, col="#ff2500", 
     main = "Global Active Power", xlab="Global Active Power (kilowatts)",
     breaks=16, axes = FALSE, 
     xlim=c(0, 8), ylim=c(0, 1200))
axis(1, at=c(0, 2, 4, 6))
axis(2, ylim=c(0, 1200))

# close the file
dev.off()
