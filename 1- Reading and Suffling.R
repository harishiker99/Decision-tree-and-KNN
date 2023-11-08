# Step 1: Import the data
path <- 'https://raw.githubusercontent.com/guru99-edu/R-Programming/master/titanic_data.csv'
titanic <-read.csv(path)
str(titanic)
head(titanic)
tail(titanic)

# Data is not shuffled. Split into training and testing datasets will cause a big problem!
# Generate a random vector of index from 1 to 1309.
set.seed(678) # ensures that you get the same result if you start with that same seed each time you run the same process
shuffle_index <- sample(1:nrow(titanic))
head(shuffle_index)
titanic <- titanic[shuffle_index, ]
head(titanic)
tail(titanic)
  