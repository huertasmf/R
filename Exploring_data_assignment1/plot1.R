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
#       Plot1.png
#
##################################################
none<-is.na(dat$Global_active_power)
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA,
    type =  "cairo-png")


hist(dat$Global_active_power[!none], col='red',main ="Global Active Power",
     xlab="Global Active Power (in Kilowatts)")

dev.off()

#_______________________ End Plot1

