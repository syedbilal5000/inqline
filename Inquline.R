#reading given data 
mydata <- read.xlsx("C:/Users/abuzo/Documents/R/hackathon_data_round2.xlsx", sheet = 1, startRow = 1, colNames = TRUE);
# As I am doing timeseries analysis on only Blood_Group_Code so just considering it, and coverting it class in timeseries
ts_mydata <- ts(mydata$Blood_Group_Code,start=c(2013),end=c(2017),frequency = 12);
#conversion to numeric
a <- as.numeric(ts_mydata)
#using ARIMA for prediction
#finding value of (p,d,q)
pacf(diff(log(a)))
acf(log(a))
acf(diff(log(a)))
(fit <- arima(log(a), c(0, 1, 1),seasonal = list(order = c(0, 1, 1), period = 12)));
#predicting for next 10 years
pred <- predict(fit, n.ahead = 10*12);
