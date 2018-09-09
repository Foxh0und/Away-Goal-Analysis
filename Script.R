require( ggplot2 )
require( reshape2 )

lData <- read.csv( "Results.csv" )
for( i in 1:length( colnames( lData ) ) )
  colnames( lData )[i] <- gsub( "\\.", " ", colnames( lData )[i] )

ggplot() + geom_bar(data = df, aes(x = decades, y = value, fill = variable), position = "dodge", stat = "identity")

### Count
lCount <- lData[,c( "Year", "Home Goals", "Away Goals" )]
lCountMelt <- melt( lCount, id = "Year" )

ggplot() + 
  geom_bar( data = lCountMelt, aes( x = Year, y = value, fill = variable ), position = "dodge", stat = "identity" ) +
  ggtitle("Goal Count") +
  ylab( "Goals" ) +
  xlab( "Season" ) +
  theme( axis.text.x = element_text( angle = 45, hjust = 1 ), legend.title = element_blank(),
         plot.title = element_text( hjust = 0.5 ) )  +
  scale_fill_manual( values = c("Home Goals" = "darkorange2", "Away Goals" = "steelblue" ) )

ggsave( "Plots/Count.png" )

### Per Game
lPerGame <- lData[,c( "Year", "Away Goal Per Game" )]
lPerGameMelt <- melt( lPerGame, id = "Year" )

ggplot( data = lPerGameMelt, aes( Year, y = value, group = variable ) ) +
  geom_point( color = "steelblue" ) +
  geom_line( color = "steelblue1" ) +
  geom_smooth( method = "glm", se  = F ) +
  ggtitle("Average Amount of Away Goals Per Game") +
  ylab( "Goals" ) +
  xlab( "Season" ) +
  theme( axis.text.x = element_text( angle = 45, hjust = 1 ), legend.title = element_blank(),
         plot.title = element_text(hjust = 0.5))
ggsave("Plots/PerGame.png")

### Away Goal Percent
lAwayGoalPercent <- lData[,c( "Year", "Away Goal Percent" )]
lAwayGoalPercentMelt <- melt( lAwayGoalPercent, id = "Year" )

ggplot( data = lAwayGoalPercentMelt, aes( Year, y = value, group = variable ) ) +
  geom_point( color = "steelblue" ) +
  geom_line( color = "steelblue1" ) +
  geom_smooth( method = "glm", se  = F ) +
  ggtitle("Away Goal Percent of Total Goals Scored") +
  ylab( "Goals" ) +
  xlab( "Season" ) +
  theme( axis.text.x = element_text( angle = 45, hjust = 1 ), legend.title = element_blank(),
         plot.title = element_text(hjust = 0.5))
ggsave("Plots/AwayGoalPercent.png")


