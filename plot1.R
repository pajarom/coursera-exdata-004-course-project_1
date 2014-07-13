## Load Full Data Set
fullData <- read.csv(   'household_power_consumption.txt', 
                        header=TRUE,
                        na.strings = "?",
                        sep = ";"    )

## Select Data to be plotted
subsetData <- subset(   fullData, 
                        fullData$Date %in% c("1/2/2007","2/2/2007")    )

## Plot
with(    subsetData, 
        hist(   Global_active_power, 
                col = "red",
                main = "Global Active Power",
                xlab = "Global Active Power (kilowatts)"    )    )

## Save figure to PNG
dev.copy(    png, 
            file = "plot1.png",
            width=480, 
            height=480    )
    
dev.off()