# Reading data
DataSet <- read.table("/Users/andreaaraujo/Documents/Exploratory Data Analysis in R/Coursera/household_power_consumption.txt", sep = ";", header = TRUE)
DoisDias <- c("1/2/2007", "2/2/2007")
DoisDiasData <- filter(DataSet, DataSet$Date %in% DoisDias)
DoisDiasData$Date <- dmy(DoisDiasData$Date)
DoisDiasData$Global_active_power <- as.numeric(DoisDiasData$Global_active_power)
DoisDiasData$DateTime <- strptime(paste(DoisDiasData$Date, DoisDiasData$Time), format = "%Y-%m-%d %H:%M:%S")

# Building plot
with(DoisDiasData, plot(DateTime, Global_active_power, type = "l", xlab = "",
                        ylab = "Global Active Power (kilowatts)", xaxt = "n"))
axis(side = 1, at = c(as.numeric(DoisDiasData$DateTime[1]),
                      as.numeric(DoisDiasData$DateTime[1441]),
                      as.numeric(DoisDiasData$DateTime[2880])),labels = c("Thu","Fri","Sat"))

# Creating PNG file
dev.copy(device = png, width = 480, height = 480, file = "plot2.png")
dev.off()
