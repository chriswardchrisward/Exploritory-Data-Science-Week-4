plot4 <- function(){
  ## Read in Data if it hasn't been done yet
  if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
  }
  if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
  }
  
  
  png("plot4.png",width=480,height=480,units="px",bg="transparent")
  library(ggplot2)
  data <- merge(NEI, SCC, by = "SCC")
  index <- grep("coal", data$Short.Name, ignore.case = TRUE)
  data <- data[index,]
  data <- aggregate(Emissions ~ year, data, sum) 
  
  ggp <- ggplot(data, aes(factor(year), Emissions))
  ggp <- ggp + geom_bar(stat = "identity") + xlab("Year") + ylab("Total Emissions (tons") + ggtitle("Total Emission from Coal Sources")
  print(ggp)
  dev.off()
}