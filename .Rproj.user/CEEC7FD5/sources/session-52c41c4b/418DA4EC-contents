df <- data(iris) ##load data
head(iris) ## see the studcture
set.seed(123)
## Generate a random number that is 90% of the total number of rows in dataset.
ran <- sample(1:nrow(iris), 0.9 * nrow(iris)) 
summary(iris)

## The normalization function is created. Perform min-max normalization.
# Rescales a vector x such that ts minimum value is zero and its maximum value is one.
# It does this by subtracting the minimum value from each value of x and divding by the range of x values.
nor <- function(x) { (x - min(x))/(max(x)-min(x))   }

##Run normalization on first 4 columns of dataset because they are the predictors
iris_norm <- as.data.frame(lapply(iris[,c(1,2,3,4)], nor))
summary(iris_norm)

##extract training set
iris_train <- iris_norm[ran,] 
##extract testing set
iris_test <- iris_norm[-ran,] 
##extract 5th column of train dataset because it will be used as 'cl' (label or target) argument in knn function.
iris_target_category <- iris[ran,5]
##extract 5th column of test dataset to measure the accuracy
iris_test_category <- iris[-ran,5]

##load the package class
library(class)
?knn

##run knn function
pr <- knn(iris_train, iris_test, cl=iris_target_category)
#know the predictions
pr

##create confusion matrix
tab <- table(pr,iris_test_category)
print(tab)

##this function divides the correct predictions by total number of predictions that tell us how accurate the model is.
accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(tab)
#mean(iris_test_category == pr)
plot(pr, col='red')

# finding out the optimal K
sqrt(nrow(iris_train))

# consider 12 neighbors for majority vote
pr_12 <- knn(iris_train, iris_test, cl=iris_target_category, k=12)
pr_12

tab_12 <- table(pr_12,iris_test_category)
accuracy(tab_12)

##--------------------------------
install.packages('caret')
library(caret)
result <- confusionMatrix(pr, iris_test_category)
result

#Ref https://towardsdatascience.com/k-nearest-neighbors-algorithm-with-examples-in-r-simply-explained-knn-1f2c88da405c

