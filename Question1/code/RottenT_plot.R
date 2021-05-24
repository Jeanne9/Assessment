# Rotten tomatoes graph

RottenT_plot <- function(MovieData, xaxis_size = 5, xaxis_rows = 3) {
  
  MoviePlotData <- 
    MovieData %>% 
    filter(Rotten.Tomatoes..>80) 
                   
  g <-
    MoviePlotData %>%
    ggplot() +
    geom_point(aes(x = `Genre`, y = `Audience..score..`), size = 4, alpha = 0.8, colour = "darkblue") +
    ggthemes::theme_gdocs() +
    labs(title = "Audience scores(%)", subtitle = "Audience scores for movies with Rotten Tomatoes score of 80% and higher", caption = "Data source: Mr. Video", x = "Movies", y = "Audience Score") +
    theme(legend.position = "top", legend.title = element_blank()) +
    theme(plot.title = element_text(size = 14),
            plot.subtitle = element_text(size = 11),
            axis.text.x = element_text(size = 10)) +
    geom_hline (aes(yintercept = 85), linetype = "dotted", size = 2, alpha = 0.8, color = "steelblue")  
    
  
  
}



