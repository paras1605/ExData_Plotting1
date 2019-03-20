table <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
subsetdata <- table[table$Date %in% c("1/2/2007","2/2/2007"), ]
subsetdata$Date <- as.Date(subsetdata$Date, format="%d/%m/%Y")

# Date has to be used with time and hence combining date and time as one
datetime <- paste(subsetdata$Date, subsetdata$Time)
subsetdata$datetime <- as.POSIXct(datetime)