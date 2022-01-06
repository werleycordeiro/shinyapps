colors1 <- c("black","#bbdcfc","#B7D9E2","#86B6C6","#5C93AA","#3A728E","#1F5372","#0C3756","darkblue")

rename_maturities <- c("3-month <br> DI rates","6-month", "9-month", "1-year", "2-year", "3-year", "4-year", "5-year", "6-year")

for(i in 1:length(maturities)){
    
    if(i==1){
        
        fig1 <- plot_ly(x = dates,
                        y = yields[,i],
                        type = 'scatter',
                        mode = 'lines',
                        hovertemplate = paste(
                            "Date: %{x:%d-%m-%Y}<br>",
                            "Maturity: %{text}<br>",
                            "Yield: %{y}<br>",
                            "<extra></extra>"),
                        text = rename_maturities[i],
                        name = rename_maturities[i],
                        line = list( color = colors1[i])
        ) 
        
    }else{
        
        fig1 <- fig1 %>% add_trace(x = dates,
                                   y = yields[,i],
                                   type = 'scatter',
                                   mode = 'lines',
                                   hovertemplate = paste(
                                       "Date: %{x:%d-%m-%Y}<br>",
                                       "Maturity: %{text}<br>",
                                       "Yield: %{y}<br>",
                                       "<extra></extra>"),
                                   hoverinfo = 'x+y+name',
                                   name = rename_maturities[i],
                                   text = rename_maturities[i],
                                   line = list( color = colors1[i] )
        )
        
    }
    
}

fig1 <- fig1 %>% layout(title = "<b>2D View of Brazil Yield Curves</b>",
                        yaxis = list(
                            title = "",
                            tickformat = "%",
                            nticks = 5,
                            ticktext = list("5%", "10%", "15%", "20% yield <br> per year"),
                            tickvals = list(.05, .10, .15, .20),
                            tickmode = "array"),
                        xaxis = list(
                            title = "Dates",
                            rangeslider = list(visible = T))
)

fig1