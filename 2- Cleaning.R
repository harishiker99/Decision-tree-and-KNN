# Step 2: Clean the dataset
library(dplyr)

# Drop variables
# Add label to variable pclass and survived;
# Remove observations with "?";

str(titanic)
#first drop home.dest & cabin & name, ...
#second convert pclass and survided to level
clean_titanic <- titanic %>%
  select(-c(home.dest, cabin, name, x, ticket)) %>% 
  #Convert to factor level
  mutate(pclass = factor(pclass, levels = c(1, 2, 3), labels = c('Upper', 'Middle', 'Lower')),
         survived = factor(survived, levels = c(0, 1), labels = c('No', 'Yes'))) 
str(clean_titanic)
head(clean_titanic)
tail(clean_titanic)

#find the number of row with "?" for each column
dirty <- sapply(1:ncol(clean_titanic), function(x){
  dirty.num <- sum(clean_titanic[, x] == "?")
  #(cbind(dirty.num, x))
})
dirty

#clean question mark
clean_titanic <- clean_titanic %>% filter(age != "?", fare != "?", embarked != "?")

# Alternative way 
#clean_titanic <- clean_titanic[!clean_titanic$age == "?", ]
#clean_titanic <- clean_titanic[!clean_titanic$fare == "?", ]
#clean_titanic <- clean_titanic[!clean_titanic$embarked == "?", ]

str(clean_titanic)
head(clean_titanic)
tail(clean_titanic)

 #subset1 <-select(titanic, -c(home.dest, cabin, name, x, ticket))
#subset2 <- mutate(subset1, pclass = factor(pclass, levels = c(1, 2, 3), labels = c('Upper', 'Middle', 'Lower')), survived = factor(survived, levels = c(0, 1), labels = c('No', 'Yes'))) 
#glimpse(clean_titanic) 
