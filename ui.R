library(shinythemes)
navbarPage(
    theme = shinytheme("darkly"),
    "Conquerit!",
    tabPanel("Home",
        
        sidebarPanel(
            p(strong("Options")),
            numericInput("n", "Hidden layers:", min = 0, max = 5, value = 2),
            br(),
            actionButton("goButton", "Go!"),
            p("Click the button to update the graph displayed in the main panel.")
        ),
        
        mainPanel(
            tabsetPanel(type = "tabs",
                  tabPanel("Plot", plotOutput("gplot")),
                  tabPanel("Model", plotOutput("nplot")),
                  tabPanel("Tables",
                           tabsetPanel(type = "tabs",
                                       tabPanel("CSV", 
                                                dataTableOutput('csvtable')),
                                       tabPanel("Real strength", 
                                                dataTableOutput('tsttable')),
                                       tabPanel("Predicted strength", 
                                                dataTableOutput('prdtable'))
                           ))
            )
        )
    ),
    tabPanel("About")
)