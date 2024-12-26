#Exploratory Data Analysis

#Data Overview
data("mtcars")

# View the first few rows
head(mtcars)

# Dataset structure
str(mtcars)

# Summary statistics
summary(mtcars)

#Distribution of miles per gallon
# Histogram of mpg
install.packages("tidyverse")
library(tidyverse)
library(ggplot2)

#Plot Histogram
histogram_1<-ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(binwidth = 2, fill = "blue", color = "white") +
  labs(
    title = "Distribution of Miles Per Gallon",
    x = "Miles Per Gallon (mpg)",
    y = "Count of Cars"
  )
histogram_1
ggsave("figures/histogram_1.png", width=8, height=6)

#Interpretation:
#The histogram shows that most cars in the data set have a miles-per-gallon (MPG) value 
#between 15 and 25. This suggests that the data set primarily 
#consists of cars with mid-range fuel efficiency. A few cars achieve higher MPG, 
#indicating better fuel economy.

#Relationship between Horsepower(hp) and Miles per gallon(mpg)

# Scatter plot of hp vs mpg
scatterplot<-ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point(color = "red") +
  geom_smooth(method = "lm", color = "blue", se = FALSE) +
  labs(
    title = "Horsepower vs Miles Per Gallon",
    x = "Horsepower (hp)",
    y = "Miles Per Gallon (mpg)"
  )

scatterplot
ggsave("figures/scatterplot.png", width=8, height=6)

#Interpretation:
#The scatter plot reveals a clear negative relationship between horsepower 
#and fuel efficiency. Cars with higher horsepower tend to have lower MPG, 
#indicating that more powerful engines are generally less fuel-efficient.

#Miles per Gallon (mpg) by Number of Cylinders (cyl)

# Boxplot of mpg grouped by number of cylinders
boxplot_cylinders<- ggplot(mtcars, aes(x = factor(cyl), y = mpg)) +
  geom_boxplot(fill = "green", color = "black") +
  labs(
    title = "Miles Per Gallon by Number of Cylinders",
    x = "Number of Cylinders",
    y = "Miles Per Gallon (mpg)"
  )

boxplot_cylinders
ggsave("figures/boxplot_cylinders.png", width = 8, height = 6)

#Interpretation:
#The boxplot shows that cars with fewer cylinders (4) have higher MPG values, 
#while those with more cylinders (6 or 8) have lower MPG. 
#This indicates that engine size and configuration significantly impact fuel efficiency.

#Correlation Heatmap
# Load the necessary library
install.packages("corrplot")
library(corrplot)

# Calculate the correlation matrix
cor_matrix <- cor(mtcars)

# Create a heatmap of the correlation matrix
correlation_heatmap <- corrplot(cor_matrix, method = "color", addCoef.col = "black")

ggsave("figures/correlation_heatmap.png", width = 8, height = 6)

#Interpretation:
#The heatmap highlights the relationships between variables in the dataset. 
#Key observations:
#mpg is negatively correlated with hp (horsepower) and wt (weight), meaning heavier cars and those with more horsepower tend to have lower fuel efficiency.
#cyl (cylinders) is strongly correlated with disp (displacement) and wt (weight), showing that larger engines are associated with heavier cars.

#Pairwise Scatter Plot
pairs_plot <- pairs(mtcars[, c("mpg", "hp", "wt", "disp")], main = "Pairwise Scatter Plots")

# Save the pairwise scatter plot in the 'graphs' folder
ggsave("figures/pairwise_scatter_plots.png", width = 8, height = 6)

#Interpretation:
#The pairwise scatter plots provide a closer look at relationships between variables. 
#For instance:mpg decreases as wt (weight) increases.
#A linear pattern is evident between disp (displacement) and hp (horsepower), suggesting a strong positive correlation.














