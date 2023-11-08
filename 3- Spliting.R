# Step 3: create train/test set
# 80/20 split 80 PERCENT TRAIN

# if train =True, it returns train otherwise test
create_train_test <- function(data, size = 0.8, train = TRUE) {
  n_row = nrow(data)
  total_row = size * n_row
  train_sample <- 1:total_row
  if (train == TRUE) {
    return (data[train_sample, ])
  } else {
    return (data[-train_sample, ])
  }
}

# function brings back a test set if train argument is false;
data_train <- create_train_test(clean_titanic, 0.8, train = TRUE)
data_test <- create_train_test(clean_titanic, 0.8, train = FALSE)
dim(data_train)
dim(data_test)

# use the function prop.table() combined with table() to verify if the randomization process is correct.
prop.table(table(data_train$survived))
prop.table(table(data_test$survived))
# percent of each label in train and test dataset


#n = nrow(clean_titanic)
#trainIndex = sample(1:n, size = round(0.8*n), replace=FALSE)
#train_set = clean_titanic[trainIndex ,]
#test_set = clean_titanic[-trainIndex ,]
#prop.table(table(train_set$survived))
#prop.table(table(test_set$survived))

