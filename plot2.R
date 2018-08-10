library(dplyr)
#Reading Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Grouping
ds <- NEI %>% filter(fips=="24510") %>% group_by(year) %>% summarise(Total_Emissions = sum(Emissions))

#Plotting
png("plot2.png", width=960, height=480)
plot(ds$year,ds$Total_Emissions,type = "o",xlab = "Year",ylab = "Total Emissions",
     main = "PM2.5 emission from all sources per Year (Baltimore City, Maryland)")
dev.off()