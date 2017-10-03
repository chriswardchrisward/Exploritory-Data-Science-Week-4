plot3 <- function(){
  ## Read in Data if it hasn't been done yet
  if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
  }
  if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
  }
  
  #Subset Baltimore City
  BmoreNEI <- NEI[NEI$fips=="24510",]
  BmoreNEIbyType <- aggregate(Emissions ~ year + type, BmoreNEI, sum) 
  
  library(ggplot2)
  
  png("plot3.png",width=480,height=480,units="px",bg="transparent")
  
  ggp <- ggplot(BmoreNEIbyType, aes(year, Emissions, color = type))
  ggp <- ggp + geom_line() +
    xlab("Year") +
    ylab("Total PM2.5 Emission in Baltimore City") +
    ggtitle("Variation in PM2.5 Emission in Baltimore City over the years")
  print(ggp)
  dev.off()
}