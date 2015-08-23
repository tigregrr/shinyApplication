library(shiny)
library(ggplot2)
source("multiplot.R")
perf <- read.csv('data/performance.csv',header = TRUE,sep = ',')
perf$APU <- as.factor(perf$APU)

# Define server logic for random distribution application
shinyServer(function(input, output) {
    # Reactive expression for selection APU input. 
    data <- reactive({
        perf <- switch(input$apu,
                       one = subset(perf, perf$APU == 1),
                       two = subset(perf, perf$APU == 2),
                       three = subset(perf, perf$APU == 3),
                       four = subset(perf, perf$APU == 4),
                       subset(perf, perf$APU == 1))
        perf
        })
    
    # Generate a plot using the inputs from the APU Selector. 
    output$plot <- renderPlot({
        p2 <- ggplot(data=data(), aes(x=Bench, y=Score, colour=APU)) +
            geom_point(alpha=.3) +
            geom_smooth(alpha=.2, size=1) +
            ggtitle("Benchmark-Score curve per APU")
        p3 <- ggplot(data=data(), aes(x=Score, colour=APU)) +
            geom_density(alpha=0.5) +
            ggtitle("Final Score, by APU")
        multiplot(p2, p3, cols=2)
    })
    
    # Generate an HTML table view of the data
    output$table <- renderTable({
        data.frame(x=data())
        })
    
    # Generate a statistics of the data
    output$statistics <- renderPrint({
        summary(data())
        })
        
    # Generate a regression model
        output$rmodel <- renderPrint({
            fit <- lm(perf$Score ~ ., perf)
            summary(fit)
    })
})