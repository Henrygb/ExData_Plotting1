##
##  Exploratory Data Analysis Course Project 1 - Plotting 
##

################ read in data and process ###########

## read in provided data file [1] see source below
power_consumption <- read.table("household_power_consumption.txt", 
           header = TRUE, sep = ";", stringsAsFactors = FALSE)

## cut down to 1st and 2nd February 2007: original seems to be d/m/yyyy
power_consumption <- power_consumption[ 
              power_consumption$Date %in% c("1/2/2007","2/2/2007") , ]

## create date and time
power_consumption$R_Date <- as.Date(power_consumption$Date, "%d/%m/%Y")
power_consumption$datetime <- as.POSIXct(
            paste(power_consumption$R_Date, power_consumption$Time) )

## convert electricity variables to numeric 
power_consumption[3:9] <- lapply(power_consumption[3:9], "as.numeric")

################ Plot 1 ###################

#Graphics device for a PNG file with width 480 pixels and height 480 pixels
png(filename = "plot1.png", width = 480, height = 480, units = "px")

#Draw a histogram
hist(power_consumption$Global_active_power,     # variable to plot 
     col="red",                                 # shade red                          
     main="Global Active Power",                # main title
     xlab="Global Active Power (kilowatts)" )   # x-axis label

#Close Graphics device
dev.off()

################ Plot 2 ###################

#Graphics device for a PNG file with width 480 pixels and height 480 pixels
png(filename = "plot2.png", width = 480, height = 480, units = "px")

#Draw a graph
plot(power_consumption$Global_active_power ~    # y-variable against 
     power_consumption$datetime,                # x-variable 
     type="l",                                  # line rather than points
     main="",                                   # no main title
     xlab="",                                   # no x-axis label
     ylab="Global Active Power (kilowatts)" )   # y-axis label

#Close Graphics device
dev.off()

################ Plot 3 ###################

#Graphics device for a PNG file with width 480 pixels and height 480 pixels
png(filename = "plot3.png", width = 480, height = 480, units = "px")

#Draw a graph with three lines
plot( x=power_consumption$datetime,             # x-variable time
      y=power_consumption$Sub_metering_1,       # y-variable Sm1
      col="black",                              # black  for Sm1
      type="l",                                 # line rather than points
      main="",                                  # no main title
      xlab="",                                  # no x-axis label
      ylab="Energy sub metering" )              # y-axis label
lines(x=power_consumption$datetime,             # x-variable time
      y=power_consumption$Sub_metering_2,       # y-variable Sm2
      col="red",                                # red    for Sm2
      type="l")                                 # line rather than points
lines(x=power_consumption$datetime,             # x-variable time
      y=power_consumption$Sub_metering_3,       # y-variable Sm3
      col="blue",                               # blue   for Sm3
      type="l")                                 # line rather than points

#Include a legend
legend("topright",                              # position
       legend=c("Sub_metering_1",               # 1st variable
                "Sub_metering_2",               # 2nd variable
                "Sub_metering_3"),              # 3rd variable
       lty=c(1,1,1),                            # line types
       col=c("black", "red", "blue") )          # colours

#Close Graphics device
dev.off()

################ Plot 4 ###################

## Graphics device for a PNG file with width 480 pixels and height 480 pixels
png(filename = "plot4.png", width = 480, height = 480, units = "px")

## setting up for 2x2 plots
op <- par(mfrow = c(2, 2)) 

#Draw a graph: first of four
plot(power_consumption$Global_active_power ~    # y-variable against 
     power_consumption$datetime,                # x-variable 
     type="l",                                  # line rather than points
     main="",                                   # no main title
     xlab="",                                   # no x-axis label
     ylab="Global Active Power" )               # y-axis label

#Draw a graph: second of four
plot(power_consumption$Voltage ~                # y-variable against 
     power_consumption$datetime,                # x-variable 
     type="l",                                  # line rather than points
     main="",                                   # no main title
     xlab="datetime",                           # x-axis label
     ylab="Voltage" )                           # y-axis label

#Draw a graph with three lines: third of four
plot( x=power_consumption$datetime,             # x-variable time
      y=power_consumption$Sub_metering_1,       # y-variable Sm1
      col="black",                              # black  for Sm1
      type="l",                                 # line rather than points
      main="",                                  # no main title
      xlab="",                                  # no x-axis label
      ylab="Energy sub metering" )              # y-axis label
lines(x=power_consumption$datetime,             # x-variable time
      y=power_consumption$Sub_metering_2,       # y-variable Sm2
      col="red",                                # red    for Sm2
      type="l" )                                # line rather than points
lines(x=power_consumption$datetime,             # x-variable time
      y=power_consumption$Sub_metering_3,       # y-variable Sm3
      col="blue",                               # blue   for Sm3
      type="l" )                                # line rather than points
#Include a legend
legend("topright",                              # position
       legend=c("Sub_metering_1",               # 1st variable
                "Sub_metering_2",               # 2nd variable
                "Sub_metering_3" ),             # 3rd variable
       lty=c(1,1,1),                            # line types
       bty = "n",                               # no legend box
       col=c("black", "red", "blue") )          # colours

#Draw a graph: fourth of four
plot(power_consumption$Global_reactive_power ~  # y-variable against 
     power_consumption$datetime,                # x-variable 
     type="l",                                  # line rather than points
     main="",                                   # no main title
     xlab="datetime",                           # x-axis label
     ylab="Global_reactive_power" )             # y-axis label

#finished so return to original plotting settings (i.e. 1x1 plot)
par(op)

#Close Graphics device
dev.off()


################ Data source ##############
#[1] data originally from 
#    Bache, K. & Lichman, M. (2013). UCI Machine Learning Repository 
#       [http://archive.ics.uci.edu/ml]. Irvine, CA: 
#       University of California, School of Information and Computer Science.
#
#    http://archive.ics.uci.edu/ml/datasets
#          /Individual+household+electric+power+consumption
#    Georges Hébrail (georges.hebrail '@' edf.fr), 
#                    Senior Researcher, EDF R&D, Clamart, France 
#    Alice Bérard, TELECOM ParisTech Master of 
#                  Engineering Internship at EDF R&D, Clamart, France
