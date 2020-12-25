```{r}
library(MASS)
data(Boston)
View(Boston)
help(Boston)

library(xgboost)
set.seed(1)
index <- sample(1:nrow(Boston), nrow(Boston)/2)
train <- Boston[index,]
test <- Boston[-index,]

theboost <- xgboost(data = data.matrix(train[,-14]), label = data.matrix(train[,14]), nrounds = 50, verbose = 0)
thepredict <- predict(theboost, newdata = data.matrix(test[,-14]))
mean_sq_err <- mean((thepredict - test[,14])^2)
mean_sq_err

```
