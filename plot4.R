## Getting full dataset
data_full <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 4: a multiple base plots
## See basic plot system part 2
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(data, 
{
        # plot at (1,1)
        plot(Global_active_power~Datetime, type="l", 
             xlab="", ylab="Global Active Power")
        # plot at (1,2)
        plot(Voltage~Datetime, type="l", 
             xlab="datetime", ylab="Voltage  ")
        
        # plot at (2,1)
        # create line plots from 3 sub_metering data on the same diagram
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~Datetime,
              col='Red')
        lines(Sub_metering_3~Datetime,
              col='Blue')
        # annotations
        legend("topright", col=c("black", "red", "blue"), lty=, lwd=2, bty="n",
               cex =.8,
               inset = .1,
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


        # plot at (2,2)
        plot(Global_reactive_power~Datetime, type="l", 
             xlab="datetime", ylab="Global_reactive_power")
})

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()