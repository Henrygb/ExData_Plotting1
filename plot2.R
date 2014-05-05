##
##  Exploratory Data Analysis Course Project 1 - Plot 2
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
