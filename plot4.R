### Exploratory Data Analysis: Project 1
### Last Modified: 5/8/2015
### Code Template for plotX.R    X=1,2,3,4
### file: plot4.R

### Load dataset
### The dataset has 2,075,259 rows and 9 columns
### In this dataset missing values are coded as "?"

data <- read.table(
        "./household_power_consumption.txt", # data in the current directory
        header = TRUE, sep=";", quote="\"", na.strings="?",
        nrows = 2075259, stringsAsFactors=FALSE,
        check.names=FALSE, comment.char="" # turn off interpretation of comments
)


### use data from the dates 2007-02-01 and 2007-02-02 (note the format)
### by subsetting to those dates.
### needs to convert the Date and Time variables to Date/Time classes in R using
### the strptime() and as.Date() functions.


data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
x <- paste(as.Date(data$Date), data$Time)
data$Datetime <-  as.POSIXct(x)

### Construct the Plots (set the colors as in the web version)
### See Basic Plotting System Part 2

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