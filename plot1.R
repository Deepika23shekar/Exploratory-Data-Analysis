#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
#Using the base plotting system, make a plot showing the total PM2.5 emission from all 
#sources for each of the years 1999, 2002, 2005, and 2008.

## Move files to directory to read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#   subset 1999 to 2008 data, make lines to show each year
total_emmissions <- aggregate(Emissions ~ year, NEI, sum)

#Each bar will show one colour
clrs <- c("red", "green", "blue", "yellow")

#Plotting the bar graph
png("plot1.png", width=480, height=480)

barplot((total_emmissions$Emissions)/1000, names.arg=total_emmissions$year,xlab="Year", ylab="PM2.5 Emissions in kilotons",ylim = c(0, 8000),col=clrs,main="Total PM2.5 Emissions - All United States")

dev.off()