# 3D
colors <- c("#edf4fe","#70bdf2","#315d7e","#243d53")

fig <- plot_ly(x = dates,
               y = maturities,
               z = matrix,
               colorbar=list(
                   title='Rates',
                   ticktext = list("5%", "10%", "15%", "20%"),
                   tickvals = list(.05, .10, .15,.20)
               ),
               hovertemplate = paste(
                   "Date: %{x:%d-%m-%Y}<br>",
                   "Maturity: %{y}<br>",
                   "Yield: %{z}<br>",
                   "<extra></extra>"),
               colors = colors,
               #width = 1200,
               #height = 700,
               contours = list(y = list(show = TRUE, color = "#629abd", highlightcolor = "#ff0000") ),
               type = "surface"
)

fig <- fig %>% layout(title = "<b>3D View of Brazil Yield Curves</b>",
                      scene = list(
                          aspectmode = 'manual',
                          aspectratio = list(x = 3.75, y = 1.875, z = 1.5),
                          camera = list(eye = list(x = 3.5, y = -2.88, z = .5)),
                          xaxis = list(
                              title = "",
                              type = 'date',
                              tickformat = "%Y",
                              nticks = 17
                          ),
                          yaxis = list(
                              title = "",
                              tickangle = 10,
                              ticktext = list("3-month <br> DI rate","6-month", "9-month", "1-year", "2-year", "3-year", "4-year", "5-year", "6-year"),
                              tickvals = list("M3", "M6", "M9", "M12", "M24", "M36", "M48", "M60", "M72")
                          ),
                          zaxis = list(
                              title = "",
                              tickformat = "%",
                              nticks = 5,
                              side = "right",
                              ticktext = list("5%", "10%", "15%", "20% yield <br> per year"),
                              tickvals = list(.05, .10, .15,.20),
                              tickmode = "array")
                      )
)

fig <- fig %>% add_trace(x = dates, 
                         y = maturities[1],
                         z = matrix[1,],
                         type="scatter3d",
                         mode="lines",
                         line = list(color = "black", width = 4),
                         name = "3-month <br> DI rates"
)

fig <- fig %>% add_trace(x = dates,
                         y = maturities[9],
                         z = matrix[9,],
                         type = "scatter3d",
                         mode = "lines",
                         line = list(color = "#629abd", width = 4), showlegend = F
)

fig <- fig %>% add_trace(x = dates[ncol(matrix)],
                         y = maturities,
                         z = matrix[,ncol(matrix)],
                         type = "scatter3d",
                         mode = "lines",
                         line = list(color = "orange", width = 4),
                         name = paste0("Date: ", dates[ncol(matrix)])
)

options(warn = -1)

fig
