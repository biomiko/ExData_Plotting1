#Assignement 4_Exploratory_Data_Analysis

setwd ("D:/LAB/Conference/Coursea/DATA_SCIENCE/4_Exploratory_Data_Analysis/WEEK_1")
#download and read the files
if (!file.exists("data")){dir.create("data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./data/power_consumption.zip")
unzip("./data/power_consumption.zip")
power_cons <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
#subseting and changing the unit of the columns
power_cons_subset <- subset(power_cons, Date %in% c("1/2/2007", "2/2/2007"))
power_cons_subset$Global_active_power <- as.numeric(as.character(power_cons_subset$Global_active_power))

#plotting
png(file="plot1.png", units="px", width=480, height=480)
hist(power_cons_subset$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power", ylim=c(0,1200))
dev.off()
