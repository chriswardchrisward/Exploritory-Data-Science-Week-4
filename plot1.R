plot1 <- function(){
  ## This first line will likely take a few seconds. Be patient!
  NEI <- readRDS("summarySCC_PM25.rds")
  SCC <- readRDS("Source_Classification_Code.rds")
  
  totEmissions <- tapply(NEI$Emissions, NEI$year, sum)
  
  
  png("plot1.png",width=480,height=480,units="px",bg="transparent")
  barplot(totEmissions, xlab = "Year", ylab = "Total Emission (tons)", 
          main = "Total Emissions per year")
  dev.off()
}
