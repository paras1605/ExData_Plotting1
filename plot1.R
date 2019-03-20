table <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
subsetdata <- table[table$Date %in% c("1/2/2007","2/2/2007"), ]
subsetdata$Date <- as.Date(subsetdata$Date, format="%d/%m/%Y")

Globalactivepower <- as.numeric(subsetdata$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(Globalactivepower, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")
dev.off()
