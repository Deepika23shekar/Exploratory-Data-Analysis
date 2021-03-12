#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
#from 1999 to 2008? Use the base plotting system to make a plot answering this question.

## Move files to directory to read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Plot only fips = “24510”, time on x axis
baltimore <- subset(NEI, fips=="24510")
agg <- aggregate(Emissions ~ year, baltimore, sum)
clrs <- c("red", "green", "blue", "yellow")

#Plotting the graph 
png("plot1.png", width=480, height=480)

barplot(
  agg$Emissions,
  names.arg=agg$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  ylim=c(0,3500),
  clr=cols,
  main="Total PM2.5 Emissions - Baltimore City, MD")

dev.off()