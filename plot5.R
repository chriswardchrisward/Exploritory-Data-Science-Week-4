plot5 <- function(){
  ## Read in Data if it hasn't been done yet
  if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
  }
  if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
  }
  
  BmoreNEI <- NEI[NEI$fips=="24510",]
  
  #vehicle index
  index  <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
  SCC_Vehicle <- SCC[index, ]
  
  NEISCC <- merge(BmoreNEI, SCC_Vehicle, by="SCC")
  
  totEmissionsbyCar <- tapply(NEISCC$Emissions, NEISCC$year, sum)
  
  png("plot5.png",width=480,height=480,units="px",bg="transparent")
  barplot(totEmissionsbyCar, xlab = "Year", ylab = "Total Emission (tons)", 
          main = "Total Emission from Vehicles in Baltimore City")
  dev.off()
  
}