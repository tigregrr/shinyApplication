library(shiny)

# Define UI
shinyUI(fluidPage(

# Application title
titlePanel("APU Benchmark Dashboard"),
br(), # introduce extra vertical spacing

# Sidebar with different widgets to input.
sidebarLayout(
    sidebarPanel(
        br(),
        # Input a single APU
        radioButtons("apu", "APU Selector", # label
                     c("A10-7350" = 'one',
                       "A8-7200" = 'two',
                       "i5-4200" = 'three',
                       "i7-5200" = 'four'))
    ),

    # A tabset that includes a graphic, table, and statistics information
    mainPanel(
      tabsetPanel(type = "tabs",
        tabPanel("Home",
            br(),
            br(),
            p("The AMD Accelerated Processing Unit (APU) is a series
            of 64-bit microprocessors from AMD designed to act as a CPU and
            graphics accelerator (GPU) on a single chip. AMD and Intel are
            the largest APU producers in the world. Their product are used
            in Desktop and Laptop devices, and customized units are also
            used in the Sony PlayStation and the Xbox video game."),
            br(),
            h4('Performance Test Benchmark'),
            p("The APU performance is determined through diverse
            Performance Test benchmarks. This application is about comparing
            the benchmark scores for both the AMD and the Intel APUs. The data has
            been generated in the AMD Marketing Laboratory at Austin, Texas, and 
            for confidentiality reasons, the score values has been changed."),
            br(),
            h4('Using the Application'),
            p("In its left side, the APU Benchmark Dashboard app has a
            radio button selector where user can input a APU model. Input can be made
            by a single APU at the time. When a APU is selected in the radio
            button, a graphics, a table, and a statistics are generated. These output 
            objects can be visualized in the tabs located in the main panel."),
            strong('Graphics'),
            p('The graphics tab holds two graphics showing the APU performance
            for diferent benchmark tests suchs as 3DMark Windows 10 and PCMark.'),
            strong('Table'),
            p('The table tab shows the input data for the selected APU. The Bench
            columns indicates the score for each specific benchmark.'),
            strong('Statistics'),
            p('The Statistics tab point out basic statistics of the input data.'),
            strong('Regression Model'),
            p('The Regression Model tab shows a summary result for the entire
            data set.'),
            br(),
            h4('Required R Packages and Other Resources'),
            strong('Data'),
            p('The data file is located in "../data/performance.csv" path.'),
            strong('R Packages'),
            p('This app require the "Shiny" and the "ggplot2" R packages. In
            addition to the data file, it is attached the "multiplot.R" file in
            the same directory of the server.R file.')),
        tabPanel("Graphics", br(),br(), plotOutput("plot")),
        tabPanel("Table", tableOutput("table")),
        tabPanel("Statistics", verbatimTextOutput("statistics")),
        tabPanel("Regression Model", verbatimTextOutput("rmodel")),
        tabPanel("About",
                 br(),
                 br(),
                 p("Shiny Application - Assignment"),
                 p("Student: Luis Urbina"),
                 br(),
                 p("Course: Developing Data Products"),
                 p('Data Science Specialization - Coursera'),
                 br(),
                 p("August, 25 2015"),
                 p('Austin, Texas, USA'))
      )
    )
  )
))
