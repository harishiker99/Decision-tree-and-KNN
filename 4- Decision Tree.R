# Step 4: Build the DT model
library(rpart) # build decision tree
library(rpart.plot) # draw decision tree
fit <- rpart(survived~., data = data_train, method = 'class') # dot means all columns
fit # lots of useless information so we need to plot
#rpart.plot(fit, extra = 106, fallen.leaves = T, cex = 1)
rpart.plot(fit, extra = 106) #106 is used for binary prediction
# why so compact plot?
str(data_train)
# age and fare have lots of level. They have to be number not factor with level

# convert age and fare to number in both test and train
data_train$fare <- as.numeric(as.character(data_train$fare))
data_train$age <- as.numeric(as.character(data_train$age))
data_test$fare <- as.numeric(as.character(data_test$fare))
data_test$age <- as.numeric(as.character(data_test$age))

fit <- rpart(survived~., data = data_train, method = 'class') 
rpart.plot(fit, extra = 106)

# Step 5: Make prediction
predict_unseen <-predict(fit, data_test[-2], type = 'class')
predict_unseen

# Step 6: Measure performance
# Create a table to count how many passengers are classified as survivors and passed away compare to the correct classification
table_mat <- table(data_test$survived, predict_unseen)
table_mat

head(data_test[which(predict_unseen != data_test$survived), ])
head(data_test)

# accuracy measurement
accuracy_Test <- sum(diag(table_mat)) / sum(table_mat)
print(paste('Accuracy for test', accuracy_Test))

### Random Forest
install.packages("randomForest")
library(randomForest)
titanic_RF <- randomForest(survived~., data = data_train)

predict_RF <- predict(titanic_RF, data_test)
table_RF <- table(data_test$survived, predict_RF)
table_RF
print(paste('Accuracy for randon forest test', sum(diag(table_RF)) / sum(table_RF)))

