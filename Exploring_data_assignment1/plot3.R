###################################################
#
#       Common: Load data file into a var
#
##################################################


# check if a data folder exists; if not then create one
if (!file.exists("data")) {dir.create("data")}
destfile <- "./data/power_consumption.zip"
if (!file.exists(destfile){
# file URL & destination file
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# download the file & note the time
download.file(fileUrl, destfile)
dateDownloaded <- date()
}


print(
'extraction from .zip is necessary to obtain in data folder the file named:
household_power_consumption.txt')


dat<- read.table("./data/household_power_consumption.txt", 
                 header=T, sep=";",na.strings = "?", 
                 stringsAsFactors = FALSE        
) 


###################################################
#
#       Plot3.png
#
##################################################

dat1<-dat[dat$Date=="21/12/2006" | dat$Date=="22/12/2006",]
dat1$new_time <- as.POSIXct(paste(dat1$Date, dat1$Time), format = "%d/%m/%Y %T")

png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA,
    type =  "cairo-png")

plot(dat1$new_time, 
     dat1$Global_active_power*dat1$Sub_metering_1, 
     type = "l", xlab = "", 
     ylab = "Energy sub metering")
lines(dat1$new_time, 
     dat1$Global_active_power*dat1$Sub_metering_2, 
     type = "l", xlab = "", 
     ylab = "Energy sub metering",col="red")
lines(dat1$new_time, 
     dat1$Global_active_power*dat1$Sub_metering_3, 
     type = "l", xlab = "", 
     ylab = "Energy sub metering",col="blue")
legend("topright", col = c("black", "red", "blue"), cex = 0.8, lty = 1,
       legend = c("Sub_metering_1    ", 
                  "Sub_metering_2    ",
                  "Sub_metering_3    "))

dev.off()
#_______________________ End Plot3

