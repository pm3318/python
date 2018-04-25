library(shiny)
#
ui = fluidPage(
  titlePanel("????車?蟡刻???hiny App"),
  
  sidebarLayout(
    sidebarPanel(
      textInput(inputId="stockNum", 
                label="隢撓??蟡其誨???",
                value="2330"),
      radioButtons("stockType", "隢?????/銝??",
                   c("銝??" = "TW",  "銝??" = "TWO"), inline=TRUE),
      dateRangeInput("date", "隢?????", 
                     start = "2017-07-03", end = "2017-07-30", 
                     min = "2016-01-03", max = "2017-12-31", format = "yyyy-mm-dd", 
                     startview = "month", weekstart = 0, 
                     #                    startview = "year", weekstart = 0, 
                     language = "en", separator = " ?to ", width = NULL)
    ),
    
    mainPanel(plotOutput(outputId="mainPlot")
    )
  )
)
#
