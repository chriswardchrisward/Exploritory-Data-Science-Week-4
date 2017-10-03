plot2 <- function(){
  ## Read in Data if it hasn't been done yet
  if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
  }
  if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
  }
  
  #Subset Baltimore City
  BmoreNEI <- NEI[NEI$fips=="24510",]
  BmoreEmissions <- tapply(BmoreNEI$Emissions, BmoreNEI$year, sum)
  
  
  
  png("plot2.png",width=480,height=480,units="px",bg="transparent")
  barplot(BmoreEmissions, xlab = "Year", ylab = "Total Emission (tons)", 
          main = "Total Emissions per year in Baltimore City")
  dev.off()
}