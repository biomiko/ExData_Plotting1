#Assignement 4_Exploratory_Data_Analysis

setwd ("D:/LAB/Conference/Coursea/DATA_SCIENCE/4_Exploratory_Data_Analysis/WEEK_1")
#download and read the files
if (!file.exists("data")){dir.create("data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="./data/power_consumption.zip")
unzip("./data/power_consumption.zip")
power_cons <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
#subseting and converting to time
power_cons_subset <- subset(power_cons, Date %in% c("1/2/2007", "2/2/2007"))
power_cons_subset$Global_active_power <- as.numeric(as.character(power_cons_subset$Global_active_power))
power_cons_subset$Date_marged <- do.call(paste, c(power_cons_subset[c("Date", "Time")], sep=" "))
power_cons_subset$Date_marged <- strptime(power_cons_subset$Date_marged, format="%d/%m/%Y %H:%M:%S")

#plotting
png(file="plot2.png", units="px", width=480, height=480)
with(power_cons_subset, plot(Date_marged,Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()
