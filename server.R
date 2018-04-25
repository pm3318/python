library(shiny)
#
server = function(input, output){
  output$mainPlot = renderPlot({
    # for OHLC data
    require(quantmod)
    
    # ??“å?–è?‡æ??
    TW2330 = getSymbols(Symbols="2330.TW", from="2017-01-01", to="2017-12-04",
                        auto.assign=FALSE)
    # ?•«???
    chartSeries(TW2330, name="?°ç©é›»")
  
    
    # week
    data.week = to.weekly(TW2330)
#    chartSeries(data.week, name="?°ç©é›»: weekly", theme="white", TA=NULL, bar.type='ohlc')
    
    # month
    data.month = to.monthly(TW2330)
#    chartSeries(data.month, name="?°ç©é›»: monthly", theme="white", TA=NULL, bar.type='ohlc')
    
    # quarter
    data.quarter = to.quarterly(TW2330)
#    chartSeries(data.quarter, name="?°ç©é›»: quarterly", theme="white", TA=NULL, bar.type='ohlc')
    
  })
}
#

shinyApp(ui=ui, server=server)