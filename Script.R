require( ggplot2 )
require( reshape2 )

lData <- read.csv( "Results.csv" )
for( i in 1:length( colnames( lData ) ) )
  colnames( lData )[i] <- gsub( "\\.", " ", colnames( lData )[i] )

lPerGame <- lData[,c( "Year", "Away.Goal.Per.Game" )]
lAwayGoalPercent <- lData[,c( "Year", "Total.Number.of.Goals", "Away.Goal.Percent" )]


ggplot() + geom_bar(data = df, aes(x = decades, y = value, fill = variable), position = "dodge", stat = "identity")

### Count

lCount <- lData[,c( "Year", "Home.Goals", "Away.Goals" )]
lCountMelt <- melt(lCount, id = "Year")
ggplot() + geom_bar( data = lTemp, aes(x = Year, y = value, fill = variable ), position = "dodge", stat = "identity" )

for( i in 1:length( colnames( lData ) ) )
  colnames( lData )[i] <- gsub( ".", " ", colnames( lData )[i] )