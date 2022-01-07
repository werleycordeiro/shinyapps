library(plotly)
require(xts)
matrix3 <- xts(yields, order.by = dates)
matrix3 <- matrix3[xts:::endof(matrix3, "months")]
rates <- matrix(t(matrix3), prod(dim(matrix3)) , 1)
mty <- rep(colnames(matrix3),nrow(matrix3))

for(i in 1:nrow(matrix3)){
    
    if(i==1){
        
        dates1 <- rep(index(matrix3)[i],length(colnames(matrix3)))
        
    }else{
        
        dates1.tmp <- rep(index(matrix3)[i],length(colnames(matrix3)))
        dates1 <- c(dates1, dates1.tmp)
        
    }
    
}

Date <- format(as.Date(dates1,format="%Y-%m"),"%Y-%m")

yields_panel <- data.frame(Date, rates, mty)

fig2 <- yields_panel %>% plot_ly(
    x = ~mty,
    y = ~rates,
    frame = ~Date,
    type = 'scatter',
    mode = 'markers+lines',
    hovertemplate = paste(
        "Date: ", Date,
        "<br>Maturity: %{x}<br>",
        "Yield: %{y}<br>",
        "<extra></extra>"),
    color = "")

fig2 <- fig2 %>% layout(title="<b>Last Day of Month</b>",
    xaxis = list(
        categoryorder = "array",
        categoryarray = ~mty,
        title = "Maturities"
    ),
    yaxis = list(tickformat = ".1%",
                 title = ""
    )
)

fig2 <- fig2 %>% hide_legend()

fig2 <- fig2 %>% animation_slider(
    currentvalue = list(prefix = "Date: ", font = list(color="black")))

fig2
