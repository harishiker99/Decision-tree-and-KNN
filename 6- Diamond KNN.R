##because diamonds dataset is in ggplot2 package
library(ggplot2)
##load data
data(diamonds)

##store it as data frame
dia <- data.frame(diamonds)
set.seed(123)
##create a random number equal 80% of total number of rows
ran <- sample(1:nrow(dia), 0.8 * nrow(dia))

##the normalization function is created
nor <-function(x) { (x -min(x))/(max(x)-min(x))   }

##normalization function is created
dia_nor <- as.data.frame(lapply(dia[,c(1,5,6,7,8,9,10)], nor))

##training dataset extracted
dia_train <- dia_nor[ran,]

##test dataset extracted
dia_test <- dia_nor[-ran,]

str(dia)
##the 2nd column of training dataset because that is what we need to predict about testing dataset
##also convert ordered factor to normal factor
dia_target <- as.factor(dia[ran,2])

##the actual values of 2nd couln of testing dataset to compaire it with values that will be predicted
##also convert ordered factor to normal factor
test_target <- as.factor(dia[-ran,2])

##run knn function
library(class)
# Use the prob parameter to get the proportion of votes for the winning class. prob = TRUE parameter to compute the vote proportions
pr <- knn(dia_train, dia_test, cl=dia_target,k=20, prob = T)

# Get the "prob" attribute from the predicted classes.
# Use the attr() function to obtain the vote proportions for the predicted class. These are stored in the attribute "prob"
prob <- attr(pr, "prob")

# Examine the first several predictions
head(pr)

# Examine the proportion of votes for the winning class
head(prob)

##create the confucion matrix
tb <- table(pr, test_target)

##check the accuracy
accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(tb)

plot(pr)

