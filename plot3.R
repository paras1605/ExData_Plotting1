table <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
subsetdata <- table[table$Date %in% c("1/2/2007","2/2/2007"), ]
subsetdata$Date <- as.Date(subsetdata$Date, format="%d/%m/%Y")

# Date has to be used with time and hence combining date and time as one
datetime <- paste(subsetdata$Date, subsetdata$Time)
subsetdata$datetime <- as.POSIXct(datetime)

with(subsetdata, {plot(Sub_metering_1 ~ datetime, type = "l", xlab="", ylab="Energy sub metering")
    lines(Sub_metering_2 ~ datetime, col = "red")
    lines(Sub_metering_3 ~ datetime, col = "blue")
    legend("topright", lty = 1, cex = 0.6, bty = "n", col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))}
)

dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()