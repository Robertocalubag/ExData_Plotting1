##extract data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##The dataset has 2,075,259 rows and 9 columns. 
##First calculate a rough estimate of how much memory the dataset will require in memory before reading into R. 
##Make sure your computer has enough memory (most modern computers should be fine)

data_full <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';',na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

##We will only be using data from the dates 2007-02-01 and 2007-02-02. 
## One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.

data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

##You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


hist(data$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")


dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()