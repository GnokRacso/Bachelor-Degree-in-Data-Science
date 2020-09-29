# Import library
library(readxl)

setwd("D:\\Users\\User\\Desktop\\RDS1\\Sem 1\\Statistics For Data Science")

# Import data from xlsx file
mydata <- read_excel("Alibaba_dataset.xlsx")

# Display the original dataset
mydata

# Format dataset
mydata <- ts(mydata[,1], frequency = 4, start = c(2015,1))

# Display the time series data
mydata

# Plot the Observed Time Series Data
plot.ts(mydata, main = "Time Series Plot")

# Transformation using log()
# mydata <- log(mydata)
# plot.ts(mydata, main = "Time Series Plot", ylab="Log(Revenue in RMB millions)")

# ARIMA (CHECK ANS)
library(forecast)
model <- auto.arima(mydata)
model
attributes(model)
acf(model$residuals, main = "Correlogram")
pacf(model$residuals, main = "Partial Correlogram")

# Decomposition of additive time series
mydatacomponents <- decompose(mydata, type = "multiplicative")
mydatacomponents
mydatacomponents$seasonal
plot(mydatacomponents, col="black", type = 'o')

# Differencing
mydata_diff <- ts(diff(mydata, differences = 1, lag = 1))
plot(mydata_diff, main = "Differencing Time Series Plot")
acf(mydata_diff)
pacf(mydata_diff)

# Seasonal Differencing
mydata_diff2 <- ts(diff(mydata_diff, differences = 1, lag = 4))
plot(mydata_diff2, main = "Differencing Time Series Plot")
acf(mydata_diff2)
pacf(mydata_diff2)

# AR(1) Compare AIC
fit_ar = arima(mydata, order = c(1,1,0), seasonal=list(order=c(0,1,0), period = 4))
fit_ar
fit_resid = residuals(fit_ar)
Box.test(fit_resid, lag = 20, type = 'Ljung-Box')
### p-value > 0.5, my acf graph is a pure white noise series, means my time series is not depends on MA model


# MA(1) Compare AIC
fit_ma = Arima(mydata, order = c(0,1,1), seasonal=list(order=c(0,1,0), period = 4))
fit_ma
fit_resid = residuals(fit_ma)
Box.test(fit_resid, lag = 4, type = 'Ljung-Box')

# Forecast
predict(fit_ar,n.ahead = 5)
forecast_sales <- forecast(fit_ar, h = 2 * 4, level = c(95.0))
plot(forecast_sales)