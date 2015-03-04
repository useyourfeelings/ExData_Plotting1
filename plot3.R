#xcc 20150304

#Read the data.
#I have noticed that the original data is well sorted by date and time in ascending order,
#and we will only analyse the data of "2007-02-01" and "2007-02-02".
#So here it is alright to read only 70000 rows from the start, for a performance reason.
orignal_data<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 70000)

#convert the Date column to Date type
orignal_data["Date"] <- as.Date(orignal_data[["Date"]], "%d/%m/%Y")

#pick the data we need
pc <- subset(orignal_data, Date == as.Date("2007-02-01", "%Y-%m-%d") | Date == as.Date("2007-02-02", "%Y-%m-%d"))

#first concatenate the date and the time, then convert it to POSIXlt type.
pc[["Time"]] <- strptime(paste(pc[["Date"]], pc[["Time"]]), "%Y-%m-%d %H:%M:%S")

#save as png
png("plot3.png")

#plot
with(pc, plot(Time, Sub_metering_1, xlab = "", ylab = "Energy sub metering", col = "black", type = "l"))
with(pc, lines(Time, Sub_metering_2, col = "red"))
with(pc, lines(Time, Sub_metering_3, col = "blue"))

#add legend
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

#close the dev and be happy
dev.off()