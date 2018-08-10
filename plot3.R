library(dplyr)
library(ggplot2)
#Reading Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Grouping
ds <- NEI %>% filter(fips=="24510") %>% group_by(type,year) %>% summarise(Total_Emissions = sum(Emissions))


#Plotting
png("plot3.png", width=960, height=480)
ggplot(data=ds,
       aes(x=year, y=Total_Emissions, colour=type)) + 
        labs(x="Year",y="Total Emissions",title="PM2.5 emission per Type per Year (Baltimore City, Maryland)") +    
        geom_line()
dev.off()


