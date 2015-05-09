### Exploratory Data Analysis: Project 1
### Last Modified: 5/8/2015
### Code Template for plotX.R    X=1,2,3,4
### file: plot3.R

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

with(data, 
{  # create line plots from 3 sub_metering data on the same diagram
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~Datetime,
             col='Red')
        lines(Sub_metering_3~Datetime,
              col='Blue')
}
)  # annotations
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


### Save plots to a PNG file with a width of 480 pixels and a height of 480 pixels.
### Name each of the plot files as plot1.png, plot2.png, etc.

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
