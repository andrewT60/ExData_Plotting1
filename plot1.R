### Exploratory Data Analysis: Project 1
### Last Modified: 5/8/2015
### Code Template for plotX.R    X=1,2,3,4
### file: plot1.R

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
 
#data$Datetime <- strptime(x,"%Y-%m-%d %H:%M:%S") also works for plot 1 
data$Datetime <-  as.POSIXct(x)

### Construct the Plots (set the colors as in the web version)

hist(data$Global_active_power, main="Global Active Power", col="Red", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", )

### Save plots to a PNG file with a width of 480 pixels and a height of 480 pixels.
### Name each of the plot files as plot1.png, plot2.png, etc.

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
