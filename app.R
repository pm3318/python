library(shiny)
runUrl("<D:\Rshiny\shinyApp\fintech2_1>")
#
ui = fluidPage(
  titlePanel("抓取各種股票資料的Shiny App"),
  
  sidebarLayout(
    sidebarPanel(
      textInput(inputId="stockNum", 
                label="請輸入股票代號",
                value="2330"),
      radioButtons("stockType", "請選擇上市/上櫃",
                   c("上市" = "TW",  "上櫃" = "TWO"), inline=TRUE),
      dateRangeInput("date", "請選擇時間", 
                     start = "2017-07-03", end = "2017-07-30", 
                     min = "2016-01-03", max = "2017-12-31", format = "yyyy-mm-dd", 
                     startview = "month", weekstart = 0, 
#                    startview = "year", weekstart = 0, 
                     language = "en", separator = " 到to ", width = NULL)
                 ),
    
    mainPanel(plotOutput(outputId="mainPlot")
)
  )
)
#
server = function(input, output){
  output$mainPlot = renderPlot({
    # for OHLC data
    require(quantmod)
    
    # 抓取資料
    TW2330 = getSymbols(Symbols="2330.TW", from="2017-01-01", to="2017-12-04",
                        auto.assign=FALSE)
    # 畫圖
    chartSeries(TW2330, name="台積電")
  
    
    # week
    data.week = to.weekly(TW2330)
#    chartSeries(data.week, name="台積電: weekly", theme="white", TA=NULL, bar.type='ohlc')
    
    # month
    data.month = to.monthly(TW2330)
#    chartSeries(data.month, name="台積電: monthly", theme="white", TA=NULL, bar.type='ohlc')
    
    # quarter
    data.quarter = to.quarterly(TW2330)
#    chartSeries(data.quarter, name="台積電: quarterly", theme="white", TA=NULL, bar.type='ohlc')
    
  })
}
#

shinyApp(ui=ui, server=server)