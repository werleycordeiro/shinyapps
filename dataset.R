yields <- read.csv("https://www.dropbox.com/s/8iyb4vhbljoxfhh/Brazil_Yield_Curves.csv?dl=1", header = TRUE)
rownames(yields) <- yields[,1]
yields <- yields[,-c(1,6,7,8,10,11,12,14)]/100
maturities <- colnames(yields)
dates <- as.Date(rownames(yields), format="%d-%m-%Y")
matrix <- t(yields)