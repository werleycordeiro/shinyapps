library(plotly)

# IPCA
ipca1 <- read.csv("https://www.dropbox.com/s/wm752lt42kmaz5j/IPCA_EXP.csv?dl=1", header = TRUE)
ipca1 <- data.frame( as.Date(ipca1[,1], format="%Y-%m-%d"), ipca1[,2] )
colnames(ipca1) <- c("Dates","Rates")
ipca_obs <- read.csv("https://www.dropbox.com/s/ftoch8td085c9qh/IPCA_Observado.csv?dl=1", header = TRUE, sep=",")

# Selic

selic1 <- read.csv("https://www.dropbox.com/s/590cfyoysy03nmt/Selic_EXP.csv?dl=1", header = TRUE, sep=";")
selic1 <- data.frame( as.Date(selic1[,1], format="%m/%d/%Y"), selic1[,2] )
colnames(selic1) <- c("Dates","Rates")
selic_obs <- read.csv("https://www.dropbox.com/s/pcoiqda5aao193k/Selic_Observada.csv?dl=1", header = TRUE, sep=",")

#
year <- "2021"
variable <- "IPCA"
      
      if(variable=="IPCA"){
        
        mat1 <- ipca1
        df_obs <- ipca_obs
        
      }else{
        
        mat1 <- selic1
        df_obs <- selic_obs
        
      }
      
        df <- mat1[mat1[,1]> paste0(year,"-01-01") & mat1[,1]<= paste0(year,"-12-31"),]
        trace <- df_obs[df_obs[,1]==year,2]
        
        fig3 <- plot_ly(df,
                       y = ~Rates,
                       x = ~Dates,
                       type = "scatter",
                       mode = "lines",
                       hovertemplate = paste("Expectations on<br>",
                                             "Date: %{x:%d-%m-%Y}<br>",
                                             "Rate: %{y}<br>",
                                             "<extra></extra>"),
                       name = paste0(variable," Expectations") 
        )
        
        fig3 <- fig3 %>%
            add_trace(x = df[,"Dates"], y = trace, type = "scatter", mode = "lines", name = paste0(variable," end of year"),
                      hovertemplate = paste(
                          paste0("Date: ",year,"<br>"),
                          "Rate: %{y}<br>")
            )
        fig3
