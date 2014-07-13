## Load Full Data Set
fullData <- read.csv(	'household_power_consumption.txt', 
						header=TRUE,
						na.strings = "?",
						sep = ";"	)

## Select Data to be plotted
subsetData <- subset(	fullData, 
						fullData$Date %in% c("1/2/2007","2/2/2007")	)
						
dateTime <- strptime(	paste(subsetData[,1]," ",subsetData[,2]),
						"%d/%m/%Y %H:%M:%S"	)

dataPlot3 <- data.frame(	Sub_metering_1 = data$Sub_metering_1,
							Sub_metering_2 = data$Sub_metering_2,
							Sub_metering_3 = data$Sub_metering_3,
				            Date_Time=dateTime    )

## Plot data
par(    mfrow = c(1, 1)    )

plot(   dataPlot3$Date_Time, 
        dataPlot3$Sub_metering_1,
        xlab="", 
        ylab = "Energy sub metering",
        type="l",
        col = "black"    )
        
lines(  dataPlot3$Date_Time, 
        dataPlot3$Sub_metering_2,
        col = "red"    )
        
lines(  dataPlot3$Date_Time, 
        dataPlot3$Sub_metering_3,
        col = "blue"    )

legend( "topright",
        col = c("black", "red", "blue"), 
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty=c(1,1)    )

## Save to PNG
dev.copy(    png, 
            file = "plot3.png",
            width=480, 
            height=480    )

dev.off()