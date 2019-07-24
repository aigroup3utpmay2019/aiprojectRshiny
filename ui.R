library(shinythemes)
def_cement <- 0.125
def_slag <- 0.125
def_ash <- 0.125
def_water <- 0.125
def_superplastic <- 0.125
def_coarseagg <- 0.125
def_fineagg <- 0.125
def_age <- 0.125
def_result <- 0

navbarPage(
    theme = shinytheme("darkly"),
    "Conquerit!",
    tabPanel("Home",
             h2("Strength calculator"),
             wellPanel(
                 h3("Ratio"),
                 sliderInput("slider_cement", label = h4("Cement"), min = 0, 
                             max = 1, step = 0.001, value = def_cement),
                 textInput(
                     inputId = 'text_cement',
                     value = def_cement,
                     label = NULL
                 ),
                 
                 hr(),
                 
                 sliderInput("slider_slag", label = h4("Slag"), min = 0, 
                             max = 1, step = 0.001, value = def_slag),
                 textInput(
                     inputId = 'text_slag',
                     value = def_slag,
                     label = NULL
                 ),
                 
                 hr(),
                 
                 sliderInput("slider_ash", label = h4("Ash"), min = 0, 
                             max = 1, step = 0.001, value = def_ash),
                 textInput(
                     inputId = 'text_ash',
                     value = def_ash,
                     label = NULL
                 ),
                
                 hr(),
                 
                 sliderInput("slider_water", label = h4("Water"), min = 0, 
                             max = 1, step = 0.001, value = def_water),
                 textInput(
                     inputId = 'text_water',
                     value = def_water,
                     label = NULL
                 ),
                 
                 hr(),
                 
                 sliderInput("slider_superplastic", label = h4("Superplastic"), min = 0, 
                             max = 1, step = 0.001, value = def_superplastic),
                 textInput(
                     inputId = 'text_superplastic',
                     value = def_superplastic,
                     label = NULL
                 ),
                 
                 hr(),
                 
                 sliderInput("slider_coarseagg", label = h4("Coarse Aggregate"), min = 0, 
                             max = 1, step = 0.001, value = def_coarseagg),
                 textInput(
                     inputId = 'text_coarseagg',
                     value = def_coarseagg,
                     label = NULL
                 ),
                 
                 hr(),
                 
                 sliderInput("slider_fineagg", label = h4("Fine Aggregate"), min = 0, 
                             max = 1, step = 0.001, value = def_fineagg),
                 textInput(
                     inputId = 'text_fineagg',
                     value = def_fineagg,
                     label = NULL
                 ),
                 
                 hr(),
                 
                 sliderInput("slider_age", label = h4("Aging Time"), min = 0, 
                             max = 1, step = 0.001, value = def_age),
                 textInput(
                     inputId = 'text_age',
                     value = def_age,
                     label = NULL
                 ),
                 

                 hr(),
                 
                 
                 h4("Total ratio"),
                 textOutput("total_ratio"),
                 
                 
                 hr(),

                 actionButton('button_calculate', 'Calculate', style='width:100%;background-color:#00AAFF'),
                 
                 hr(),

                 
                 h3("Result"),
                 
                 textInput(
                     inputId = 'text_result',
                     value = def_result,
                     label = NULL
                 )
                 
                 
                 
                 
             )),
    tabPanel("Plot",
        
        sidebarPanel(
            p(strong("Options")),
            numericInput("n", "Hidden layers:", min = 0, max = 50, value = 2),
            br(),
            actionButton("goButton", "Go!"),
            p("Click the button to update the graph displayed in the main panel.")
        ),
        
        mainPanel(
            tabsetPanel(type = "tabs",
                  tabPanel("Plot", plotOutput("gplot"))
                  #tabPanel("Model", plotOutput("nplot"))
            )
        )
    ),
    tabPanel("Tables",
             tabPanel("Tables",
                      tabsetPanel(type = "tabs",
                                  tabPanel("CSV", 
                                           dataTableOutput('csvtable')),
                                  tabPanel("Real strength", 
                                           dataTableOutput('tsttable')),
                                  tabPanel("Predicted strength", 
                                           dataTableOutput('prdtable'))
                      ))
             ),
    
    tabPanel("About",
             h2("Team members"),
             p("1 - Mustaien"),
             br(),
             p("2 - Mugilan"),
             br(),
             p("3 - Azman"),
             br()
             )
)