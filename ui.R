library(shinythemes)
library(ggplot2)
library(plotly)

# cement
# slag
# ash
# water
# superplastic
# coarseagg
# fineagg
# age

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
    tabPanel("Graphs",
        h2("Graphs"),
        tabsetPanel(
        tabPanel("Real vs Predicted Strength", plotlyOutput("gplot")),
        tabPanel("All", plotlyOutput("aplot")),
        tabPanel("Cement", plotlyOutput("cementplot")),
        tabPanel("Slag", plotlyOutput("slagplot")),
        tabPanel("Ash", plotlyOutput("ashplot")),
        tabPanel("Water", plotlyOutput("waterplot")),
        tabPanel("Superplastic", plotlyOutput("superplasticplot")),
        tabPanel("Coarse Aggregate", plotlyOutput("coarseaggplot")),
        tabPanel("Fine Aggregate", plotlyOutput("fineaggplot")),
        tabPanel("Aging Time", plotlyOutput("ageplot"))
    )),
    tabPanel("Strength Calculator",
             h2("Strength Calculator"),
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
    tabPanel("Tables",
            h2("Tables"),
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
            h2("Team Members"),
            h4("1 - Mustaien Fathur Rahim bin Rahmat ---- 23259 "),
            br(),
            h4("2 - Mugilan a/l Ravntheran ---- 25611 "),
            br(),
            h4("3 - Thurgashhini a/p Murugan ---- 23294"),
            br(),
            h4("4 - Lagindran a/l Anandarajah ---- 23237"),
            br(),
            h4("5 - Azman bin Ismail ---- 19956"),
            br(),
            h4("6 - Mohamad Noor Afiq Bin Azahari ---- 25113"),
            br(),
            h4("7 - Muginesh Kumar a/l Anandan ---- 23282 "),
            br(),
            h4("8 - Faris Effendy MOhamad Noor ---- 16001869"),
            br(),
            h4("9 - Ammar Aiman Bin Abdul Latif ---- 22940"),
            br()
    )
)