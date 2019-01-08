library(shiny)
library(DT)
library(plotly)


shinyUI(
    
    fluidPage(style = "text-align:center;",

  # Application title
  titlePanel("Matriz de Informação Social - Dados Abertos"),
fluidRow(style = "background-color:lightgray;text-align:left;",
    column(7,
           selectInput("campo",
                       "Indicador:",
                       choices = campos,
                       width = '100%'
           )
    )  ,
    column(2,
        selectInput("uf",
                    "UF:",
                    choices = c(
                        'BRASIL'='*',
                        'AC'='12',
                        'AL'='27',
                        'AM'='13',
                        'AP'='16',
                        'BA'='29',
                        'CE'='23',
                        'DF'='53',
                        'ES'='32',
                        'GO'='52',
                        'MA'='21',
                        'MG'='31',
                        'MS'='50',
                        'MT'='51',
                        'PA'='15',
                        'PB'='25',
                        'PE'='26',
                        'PI'='22',
                        'PR'='41',
                        'RJ'='33',
                        'RN'='24',
                        'RO'='11',
                        'RR'='14',
                        'RS'='43',
                        'SC'='42',
                        'SE'='28',
                        'SP'='35',
                        'TO'='17'
                        )
                    )
        )  ,
        column(3, 
               dateRangeInput('ano',label = "Período da análise: ",format = "yyyy",language="pt",start = as.Date('2012-01-01'), end=Sys.Date(),startview = "year",separator = " - ")
    )
    ),
hr(),
fluidRow(style = "text-align:left;",
    column(12, 
           plotlyOutput("plotly")
    )
),
hr(),
fluidRow(style = "text-align:left;",
    column(12, 
           dataTableOutput('tbl')
    )
    )
  )
)
