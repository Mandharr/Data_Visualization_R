library('ggplot2')

str(mtcars)

ggplot(mtcars, aes(x= cyl, y= mpg)) + geom_point() # 4 5 6 7 8 

ggplot(mtcars, aes(x = factor(cyl), y= mpg)) + geom_point() #  4 6 8 

ggplot(mtcars, aes(x = wt, y = mpg, color = disp)) +
  geom_point()    # Setting Color to displacement

ggplot(mtcars, aes(x = wt, y = mpg, size = disp)) +
  geom_point()    # Setting size to displacement

data("diamonds")
str(diamonds)

ggplot(diamonds, aes(x = carat, y = price)) + geom_point() # Normal Plot

# Geom_smooth draws a line over the points
ggplot(diamonds, aes(x = carat, y = price)) + geom_point() + geom_smooth() 

# Add just the line
ggplot(diamonds, aes(x = carat, y = price)) + geom_smooth()

# Make the scatter plot point transparent
ggplot(diamonds, aes(x = carat, y = price, color = clarity)) + geom_point(alpha = 0.4)

# Plot only the line
ggplot(diamonds, aes(x = carat, y = price, color = clarity)) + geom_smooth()

# Adding multiple layers in the ggplot

dia_plot <- ggplot(diamonds, aes(x = carat, y = price))
dia_plot + geom_point(aes(color = clarity)) 

# Add smooth without shades and plot points with clairty to color
dia_plot + geom_point(alpha =0.2) + geom_smooth(aes(col = clarity), se = FALSE) 

# Plotting with Linear Model
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +geom_point() + geom_smooth(method = "lm", se = FALSE) + geom_smooth(aes(group = 1),se = FALSE, method = "lm", linetype = 2)

# Tidy Date : iris.tidy

library(tidyr)
iris.tidy <- iris %>% gather(key, Value, -Species) %>% separate(key, c("Part", "Measure"), "\\.")

iris$Flower <- 1:nrow(iris)
iris.wide <- iris %>%
  gather(key, value, -Species, -Flower) %>%
  separate(key, c("Part", "Measure"), "\\.") %>%
  spread(Measure, value)

# plotting above mentioned iris.wide data

ggplot(iris.wide, aes(x = Length, y = Width, color = Part)) +
  geom_jitter() +
  facet_grid(. ~ Species)

# Applying various Aesthetics

# Change Shape (Circle) and Size
ggplot(mtcars, aes(x= wt,y=mpg,col= factor(cyl))) +
  geom_point(shape=1, size=4)

# CHange Shape to 21 and add 2 aesthetic to a dot

ggplot(mtcars, aes(x = wt, y = mpg, fill = factor(cyl), col=factor(am))) +
  geom_point(shape = 21, size = 4, alpha=0.6)

# various aesthetics on cyl:

ggplot(mtcars, aes(x=wt, y=mpg, alpha=cyl)) + geom_point()

ggplot(mtcars, aes(x=wt, y=mpg, shape=factor(cyl))) + geom_point()

ggplot(mtcars, aes(x=wt, y=mpg,label=cyl)) + geom_point()  + geom_text()


# Chnaging the aesthetic and attributes 
# The attribute values has more precedence

my_color <- "#4ABEFF"
ggplot(mtcars, aes(x=wt, y=mpg, col=cyl)) + geom_point()

ggplot(mtcars, aes(x=wt, y=mpg, col=cyl)) + geom_point(color=my_color)

ggplot(mtcars, aes(x=wt, y=mpg, fill=cyl)) + geom_point(size=10, shape=23, color=my_color)
