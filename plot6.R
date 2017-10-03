plot6 <- function(){
  ## Read in Data if it hasn't been done yet
  if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
  }
  if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
  }
  
  #Subsetting LA and Baltimore
  LA <- NEI[NEI$fips=="06037",]
  Bmore <- NEI[NEI$fips=="24510",]
  
  #vehicle index
  index <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
  SCC_Vehicle <- SCC[index, ]
  
  LACars <- merge(LA, SCC_Vehicle, by="SCC")
  LACars$city <- "Los Angeles County"
  BmoreCars <- merge(Bmore, SCC_Vehicle, by="SCC")
  BmoreCars$city <- "Baltimore City"
  Cars <- rbind(LACars, BmoreCars)
  Cars <- aggregate(Emissions ~ year + city, Cars, sum)
  
  library(ggplot2)
  png("plot6.png",width=480,height=480,units="px",bg="transparent")
  ggp <- ggplot(Cars, aes(year, Emissions, color = city))
  ggp + geom_line() +
    xlab("Year") +
    ylab("Total Emissions (tons)") +
    ggtitle("Tot. Emissions from Vehicles in Baltimore and Los Angeles")
  print(ggp)
  dev.off()
}

