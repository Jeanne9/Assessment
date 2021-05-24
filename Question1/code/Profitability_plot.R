# Movie profitability plot

Profitability_plot <- function(MovieData, xaxis_size = 5, xaxis_rows = 3) {

  MoviePlotData <- 
    MovieData %>% 
    filter(!is.na(Lead.Studio))
    
    
    g <-
      MoviePlotData %>%
      ggplot() +
      geom_bar(aes(x = `Lead.Studio`, y = `Profitability`), stat = "identity", size = 4, alpha = 0.8) +
      ggthemes::theme_gdocs() +
      labs(title = "Studios' profitability", caption = "Data source: Mr. Video", x = "Leading Studios", y = "Profitability") +
      theme(legend.position = "top", legend.title = element_blank()) +
      theme(plot.title = element_text(size = 14),
            plot.subtitle = element_text(size = 11),
            axis.text.x = element_text(size = 5)) 
      

}
