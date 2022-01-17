library(plotly)

mat1 <- read.csv("https://www.dropbox.com/s/wm752lt42kmaz5j/IPCA_EXP.csv?dl=1", header = TRUE)
mat1 <- data.frame( as.Date(mat1[,1], format="%Y-%m-%d"), mat1[,2] )
colnames(mat1) <- c("Dates","Rates")
ipca_obs <- read.csv("https://www.dropbox.com/s/ftoch8td085c9qh/IPCA_Observado.csv?dl=1", header = TRUE, sep=",")

#
year <- "2021"

df <- mat1[mat1[,1]> paste0(year,"-01-01") & mat1[,1]<= paste0(year,"-12-31"),]
trace <- ipca_obs[ipca_obs[,1]==year,2]

fig <- plot_ly(df,
	y = ~Rates,
	x = ~Dates,
	type = "scatter",
	mode = "lines",
	hovertemplate = paste("Expectativa em<br>",
                        "Date: %{x:%d-%m-%Y}<br>",
                        "Rate: %{y}<br>",
                        "<extra></extra>"),
    name = "IPCA Expectativa" 
	)

fig <- fig %>%
  		add_trace(x = df[,"Dates"], y = trace, type = "scatter", mode = "lines", name = "IPCA Observado",
		hovertemplate = paste(
			paste0("Date: ",year,"<br>"),
			"Rate: %{y}<br>")
		)
fig
