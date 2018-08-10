library(dplyr)
library(ggplot2)
#Reading Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
ds <- merge(NEI,SCC,by="SCC")

#Grouping
ds1 <- ds %>% filter(grepl('Motor Vehicle',Short.Name)) %>% group_by(year) %>% 
        summarise(Total_Emissions = sum(Emissions))

#Plotting
png("plot5.png", width=960, height=480)
ggplot(data=ds1,
       aes(x=year, y=Total_Emissions)) + 
        labs(x="Year",y="Total Emissions",title="PM2.5 emission per Year from Motor Vehicle Sources (Baltimore City)") +    
        geom_line()
dev.off()


