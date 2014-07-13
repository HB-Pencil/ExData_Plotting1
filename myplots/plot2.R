## the ^ means start at the beginning of the line, [1-2] find the range 1-2. by Forum-Eyal soreq
myData <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), header=F, sep=';')

## for the headers I just read the same file with nrow=1
colnames(myData) <- names(read.table('household_power_consumption.txt', header=TRUE, sep=";", nrows=1))

## paste(data$Date, data$Time) concatenates Date and Time. strptime() returns a POSIXlt object. 
## when you do a simple plot, like plot(data$Time, data$<whatever>, ...), automatically the x-axis prints out Thu, Fri, Sat.
myData$Time <- strptime(paste(myData$Date, myData$Time), "%d/%m/%Y %H:%M:%S")

## Plot2
png("plot2.png", width=480, height=480)
with(myData, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
