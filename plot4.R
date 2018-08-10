library(dplyr)
library(ggplot2)
#Reading Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
ds <- merge(NEI,SCC,by="SCC")

#Grouping
ds <- ds %>% filter(grepl('Coal',EI.Sector),fips=="24510") %>% group_by(year) %>% 
        summarise(Total_Emissions = sum(Emissions))

#Plotting
png("plot4.png", width=960, height=480)
ggplot(data=ds,
       aes(x=year, y=Total_Emissions)) + 
        labs(x="Year",y="Total Emissions",title="PM2.5 emission per Year (Coal Combustion-related Sources)") +    
        geom_line()
dev.off()

