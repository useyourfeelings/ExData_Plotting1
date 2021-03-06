#xcc 20150304

#Read the data.
#I have noticed that the original data is well sorted by date and time in ascending order,
#and we will only analyse the data of "2007-02-01" and "2007-02-02".
#So here it is alright to read only 70000 rows from the start, for a performance reason.
orignal_data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#convert the Date column to Date type
orignal_data["Date"] <- as.Date(orignal_data[["Date"]], "%d/%m/%Y")

#pick the data we need
pc <- subset(orignal_data, Date == as.Date("2007-02-01", "%Y-%m-%d") | Date == as.Date("2007-02-02", "%Y-%m-%d"))

#save as png
png("plot1.png")

#draw the histogram
hist(pc$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

#close the dev and be happy
dev.off()