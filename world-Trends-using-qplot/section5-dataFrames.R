
?read.csv()

#Method 1: select the file manually
stats <- read.csv(file.choose())
stats
rm(stats)
#Method 2: set working directory and read data
getwd()
#setwd("D:\\Computer1\\Developer tools\\R\\projects\\section5DataFrames\\data")
stats <- read.csv("D:\\Computer1\\Developer tools\\R\\projects\\section5DataFrames\\data\\S5-Demographic-Data.csv")
stats

#--------------------------------------------------------------- exploring data
stats
nrow(stats) # check how many rows
ncol(stats) # check how many columns
head(stats) # top six rows
head(stats, n=10)
tail(stats) # bottom six rows
tail(stats, n=8)
str(stats)# structures
summary(stats)

#------------------------------------------------------using $ sign
stats
head(stats)
stats[3,3]
stats[3,"birth.rate"]
stats$Internet.users[2]
stats[,"Internet.users"]
#-----------------------------------------------------basic operations with a DataFrame
stats[1:10,] #subsetting
stats[c(4,100),]

stats[1,] # for datafrmaes, no need for drop=F
is.data.frame(stats[1,])TRUE
stats[,1]
is.data.frame(stats[,1]) #FALSE
stats[,1,drop=F]
is.data.frame(stats[,1,drop=F])#TRUE
# multiple columns
head(stats)
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users
# add column
stats$MyCalc <- stats$Birth.rate * stats$Internet.users
head(stats)

stats$xyz <- 1:5 
head(stats, n=10)

# remove a clumn
stats$MyCalc <- NULL # assign it to NULL
head(stats)
stats$xyz <- NULL # assign it to NULL
head(stats)


#--------------------------------------------------------------filtering data

stats$Internet.users
filter <- stats$Internet.users < 2
stats[filter,]
stats[stats$Birth.rate > 40,]
stats[stats$Birth.rate > 40 & stats$Internet.users<2,]
stats[stats$Income.Group == "High income",]


#--------------------------------------------------------------qplot
?qplot
library(ggplot2)
qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Income.Group,y=Birth.rate, size=I(3))
qplot(data=stats, x=Income.Group,y=Birth.rate, size=I(3), colour=I("blue"))
qplot(data=stats, x=Income.Group,y=Birth.rate, geom="boxplot")

qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(3), colour=Income.Group)

#-------------------------------------------------------creating dataframes

#mydf <- data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)
#head(mydf)
#colnames(mydf)<-c("Country", "Codes", "Region")
#rm(mydf)

mydf <- data.frame(Country=Countries_2012_Dataset,Code=Codes_2012_Dataset,Regions=Regions_2012_Dataset)
head(mydf)
tail(mydf)
summary(mydf)

#---------------------------------------------------------merging dataframes

head(stats)
head(mydf)

merged <- merge(stats, mydf, by.x = "Country.Code", by.y = "Code")
head(merged)
merged$Country <- NULL

#-----------------------------------------------------Visualization
qplot(data=merged, x=Internet.users, y=Birth.rate, colour=Regions)

#shapes
qplot(data=merged, x=Internet.users, y=Birth.rate, colour=Regions, shape=I(15))

#transpanrency
qplot(data=merged, x=Internet.users, y=Birth.rate, 
      colour=Regions, shape=I(15), alpha=I(0.5))

#Title
qplot(data=merged, x=Internet.users, y=Birth.rate, 
      colour=Regions, shape=I(15), alpha=I(0.5), main="Birth Rate vs Internet Users")










