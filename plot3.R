# Reading data
DataSet <- read.table("/Users/andreaaraujo/Documents/Exploratory Data Analysis in R/Coursera/household_power_consumption.txt", sep = ";", header = TRUE)
DoisDias <- c("1/2/2007", "2/2/2007")
DoisDiasData <- filter(DataSet, DataSet$Date %in% DoisDias)
DoisDiasData$Date <- dmy(DoisDiasData$Date)
DoisDiasData$Global_active_power <- as.numeric(DoisDiasData$Global_active_power)
DoisDiasData$DateTime <- strptime(paste(DoisDiasData$Date, DoisDiasData$Time), format = "%Y-%m-%d %H:%M:%S")
DoisDiasData$Sub_metering_1 <- as.numeric(DoisDiasData$Sub_metering_1)
DoisDiasData$Sub_metering_2 <- as.numeric(DoisDiasData$Sub_metering_2)

# Building plot
with(DoisDiasData, plot(DateTime, Sub_metering_1, type = "l", xlab = "",
                        ylab = "Energy sub metering", xaxt = "n"))
axis(side = 1, at = c(as.numeric(DoisDiasData$DateTime[1]),
                      as.numeric(DoisDiasData$DateTime[1441]),
                      as.numeric(DoisDiasData$DateTime[2880])),labels = c("Thu","Fri","Sat"))
with(DoisDiasData, lines(DateTime, Sub_metering_2, col = "red"))
with(DoisDiasData, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright",lty = 1, col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Creating PNG file
dev.copy(device = png, width = 480, height = 480, file = "plot3.png")
dev.off()
