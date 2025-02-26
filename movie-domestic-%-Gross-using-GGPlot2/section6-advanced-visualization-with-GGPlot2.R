movies <- read.csv("D:\\Computer1\\Developer tools\\R\\projects\\section6Advanced-visualization-GGPlot2\\data\\S6-Movie-Ratings.csv")
head(movies)
colnames(movies)<- c("Film","Genre","CriticRating","AudienceRating","BudgetMillions","Year")
head(movies)
tail(movies)
str(movies)
summary(movies)

factor(movies$Year) # convert the column into a factor
movies$Year <- factor(movies$Year)
str(movies)

#-----------------------------Aesthetics
library(ggplot2)

ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))

#add geometry
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))+
  geom_point()

# add colour
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))+
  geom_point()

# add size
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions))+
  geom_point()

#-------------------------------------------------plotting with layers

#point
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions))+
  geom_point()

#lines
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions))+
  geom_line()

#multiple layers
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions))+
  geom_line() + geom_point()

#--------------------------------------------------overriding aesthetics
q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions))

# add geom layer
q + geom_point()

#overriding aes
q + geom_point(aes(size=CriticRating))

q + geom_point(aes(colour=BudgetMillions))

# example 3
q + geom_point(aes(x=BudgetMillions)) + xlab("Budget Millions $$$")

#example 4
q + geom_line()+geom_point()
q + geom_line(size=1)+geom_point()

q + geom_point()

#-----------------------------------------------mapping vs setting
r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

# add colour

#1. mapping:
r + geom_point(aes(colour=Genre))
#2.setting:
r + geom_point(colour="DarkGreen")

#1.Mapping
r + geom_point(aes(size=CriticRating))
#2.setting
r + geom_point(size=10)

#----------------------------------------------Histograms and density charts
s <- ggplot(data=movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth=10)

#add colour
s + geom_histogram(binwidth=10, fill="DarkGreen")
s + geom_histogram(binwidth=10, aes(fill=Genre))

# add a border
s + geom_histogram(binwidth=10, aes(fill=Genre), colour="Black")


# density chart
s +geom_density(aes(fill=Genre), position="stack")


#-------------------------------------------starting layer tips
t <- ggplot(data=movies, aes(x=AudienceRating))
t + geom_histogram(binwidth = 10,
                   fill="white", colour="blue")
# another way
t <- ggplot(data=movies)
t + geom_histogram(binwidth = 10,
                   aes(x=AudienceRating),
                   fill="white", colour="blue")

#-----------------------------------------------------statistical transformations
?geom_smooth

u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))
u + geom_point() + geom_smooth(fill=NA)

#boxplots
u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating, colour=Genre))
u + geom_boxplot()

u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2)+geom_point()

u + geom_boxplot(size=1.2)+geom_jitter()

# another way
u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)


#--------------------------------------------------------------using facets

v <- ggplot(data=movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth = 10, aes(fill=Genre), colour="black")

#facets
v + geom_histogram(binwidth = 10, aes(fill=Genre), colour="black")+
  facet_grid(Genre~.) #Genre is the rows
v + geom_histogram(binwidth = 10, aes(fill=Genre), colour="black")+
  facet_grid(Genre~., scales = "free") 

v + geom_histogram(binwidth = 10, aes(fill=Genre), colour="black")+
  facet_grid(.~Genre) #Genre is the columns

# scatterplots
w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))
w + geom_point(size=3)

#facets
w + geom_point(size=3) + facet_grid(Genre~.)

w + geom_point(size=3) + facet_grid(.~Year)

w + geom_point(size=3) + facet_grid(Genre~Year)

w + geom_point(size=3) + geom_smooth() + facet_grid(Genre~Year)

w + geom_point(aes(size=BudgetMillions)) + geom_smooth() + facet_grid(Genre~Year)

#-------------------------------------------coordinates
m <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, size=BudgetMillions, colour=Genre))

m + geom_point()

#zoom in
m + geom_point() + xlim(50,100) + ylim(50,100)

#won't work always
n <- ggplot(data=movies, aes(x=BudgetMillions))
n +  geom_histogram(binwidth = 10, aes(fill=Genre), colour="black")

n +  geom_histogram(binwidth = 10, aes(fill=Genre), colour="black") + ylim(0,50)

#use coord_cartesian()
n +  geom_histogram(binwidth = 10, aes(fill=Genre), colour="black") + 
  coord_cartesian(ylim = c(0,50))


w + geom_point(aes(size=BudgetMillions)) + 
  geom_smooth() + 
  facet_grid(Genre~Year) +
  coord_cartesian(ylim = c(0,100))

#-----------------------------------------------------add themes

o <- ggplot(data=movies, aes(x=BudgetMillions))
h <- o + geom_histogram(binwidth = 10, aes(fill=Genre), colour="black")
h

#axes labels
h + xlab("Money Axis") +
  ylab("Number of Movies")

# label formatting
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color = "DarkGreen", size=15), 
        axis.title.y = element_text(color = "DarkGreen", size=15))

# tick mark formatting
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color = "DarkGreen", size=15), 
        axis.title.y = element_text(color = "DarkGreen", size=15),
        axis.text.x = element_text(size=15),
        axis.text.y = element_text(size=15))

# legend formatting
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  theme(axis.title.x = element_text(color = "DarkGreen", size=15), 
        axis.title.y = element_text(color = "DarkGreen", size=15),
        axis.text.x = element_text(size=15),
        axis.text.y = element_text(size=15),
        legend.title = element_text(size=15),
        legend.text = element_text(size=15),
        legend.position = c(1,1),
        legend.justification = c(1,1)
        
        )

#title
h + xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(color = "DarkGreen", size=15), 
        axis.title.y = element_text(color = "DarkGreen", size=15),
        axis.text.x = element_text(size=15),
        axis.text.y = element_text(size=15),
        
        legend.title = element_text(size=15),
        legend.text = element_text(size=15),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(colour="DarkBlue", size=15)
  )

















