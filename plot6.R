library(dplyr)
library(ggplot2)
#Reading Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
ds <- merge(NEI,SCC,by="SCC")

#Grouping
ds1 <- ds %>% filter(grepl('Motor Vehicle',Short.Name),fips %in% c("24510","06037")) %>% 
        group_by(year,fips) %>% 
        summarise(Total_Emissions = sum(Emissions))
ds1$year <- as.factor(ds1$year)
#Plotting
png("plot6.png", width=960, height=480)
g <- ggplot(ds1,aes(year))
g <- g + facet_grid(. ~ fips)
g+ geom_bar(aes(weight =Total_Emissions)) +labs(x="Year",y="Total Emissions",
        title="PM2.5 emission per Year from Motor Vehicle Sources 
Los Angeles (fips = 06037) and Baltimore City (fips = 24510)")
dev.off()

