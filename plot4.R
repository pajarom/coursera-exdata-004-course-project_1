## Load Full Data Set
fullData <- read.csv(   'household_power_consumption.txt', 
                        header=TRUE,
                        na.strings = "?",
                        sep = ";"    )

## Select Data to be plotted
subsetData <- subset(   fullData, 
                        fullData$Date %in% c("1/2/2007","2/2/2007")    )
                        
dateTime <- strptime(    paste(subsetData[,1]," ",subsetData[,2]),
                        "%d/%m/%Y %H:%M:%S"    )

dataPlot4 <- data.frame(    Global_active_power = data$Global_active_power,
                            Global_reactive_power = data$Global_reactive_power,
                            Voltage = data$Voltage,
                            Sub_metering_1 = data$Sub_metering_1,
                            Sub_metering_2 = data$Sub_metering_2,
                            Sub_metering_3 = data$Sub_metering_3,
                            Date_Time=dateTime    )

## Plot data
par(    mfrow = c(2, 2))

## Plot 1,1
with(   dataPlot4,
        plot(   Date_Time, 
                Global_active_power, 
                xlab="", 
                ylab = "Global Active Power", 
                type="l"    )    )

## Plot 1,2
with(   dataPlot4,
        plot(   Date_Time, 
                Voltage, 
                xlab = "DateTime", 
                ylab = "Voltage", 
                type="l"    )    )

## Plot 2,1
plot(   dataPlot4$Date_Time, 
        dataPlot4$Sub_metering_1,
        xlab = "", 
        ylab = "Energy sub-metering",
        type = "l",
        col = "black"    )

lines(  dataPlot4$Date_Time, 
        dataPlot4$Sub_metering_2,
        col = "red"    )

lines(  dataPlot4$Date_Time, 
        dataPlot4$Sub_metering_3,
        col = "blue"    )

legend( "topright", 
        col = c("black","red","blue"),
        legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
        lty = c(1,1),
        bty = "n",
        cex = 0.5    )

## Plot 2,2
with(   dataPlot4,
        plot(   Date_Time, 
                Global_reactive_power, 
                xlab = "DateTime", 
                ylab = "Global_reactive_power", 
                type="l" ) )

## Save to PNG
dev.copy(   png, 
            file = "plot4.png",
            width=480, 
            height=480 )

dev.off()