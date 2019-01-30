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

# Adding the geom_text() for inserting label instead of points
# Warning: Bad Plot

ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) + geom_text(label=rownames(mtcars), color= "red")

# Working on aesthetic mapping

ggplot(mtcars, aes(x=mpg, y=qsec, color=factor(cyl),shape=factor(am), size= hp/wt)) + geom_point()


# Modifying Aesthetics
cyl.am <- ggplot(mtcars, aes(x = factor(cyl), fill = factor(am)))
val = c("#E41A1C", "#377EB8")
lab = c("Manual", "Automatic")
cyl.am +
  geom_bar(position = "dodge") +
  scale_x_discrete("Cylinders") + 
  scale_y_continuous("Number") +
  scale_fill_manual("Transmission", 
                    values = val,
                    labels = lab) 

# Overcoming Overplotting

ggplot(diamonds, aes(x=clarity, y= carat, color=price)) + geom_point(alpha=0.5, position="jitter")


# Scatter PLot with Jittering

ggplot(Vocab, aes(x=education, y=vocabulary))+geom_jitter(alpha=0.2, shape=1)

# Plotting Histograms

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(aes(y= ..density..),binwidth= 1, fill = "#377EB8")


# Draw a bar plot of cyl, filled according to am
ggplot(mtcars, aes(x =cyl, fill = am)) + geom_bar()

# Change the position argument to stack
ggplot(mtcars, aes(x =cyl, fill = am)) + geom_bar(position = "stack")


# Change the position argument to fill
ggplot(mtcars, aes(x =cyl, fill = am)) + geom_bar(position = "fill")


# Change the position argument to dodge
ggplot(mtcars, aes(x =cyl, fill = am)) + geom_bar(position = "dodge")

# A basic histogram, add coloring defined by cyl
ggplot(mtcars, aes(mpg,fill=cyl)) +
  geom_histogram(binwidth = 1)

# Change position to identity
ggplot(mtcars, aes(mpg,fill=cyl)) +
  geom_histogram(binwidth = 1, position="identity")


# Change geom to freqpoly (position is identity by default)
ggplot(mtcars, aes(mpg,color=cyl)) +
  geom_freqpoly()

# Plot education on x and vocabulary on fill
# Use the default brewed color palette
ggplot(Vocab, aes(x = education, fill = vocabulary)) +
  geom_bar(position = "fill") +
  scale_fill_brewer()
