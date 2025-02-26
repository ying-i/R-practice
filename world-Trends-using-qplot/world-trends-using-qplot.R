# run Section5-Homework-Vectors.R file

#load data
data <- read.csv("D:\\Computer1\\Developer tools\\R\\projects\\section5DataFrames\\world-Trends-using-qplot\\S5-Homework-Data.csv")
head(data)
tail(data)
str(data)
summary(data)

# filter dataframe
data1960 <- data[data$Year==1960,]
data2013 <- data[data$Year==2013,]

head(data1960)

nrow(data1960) #187 rows
nrow(data2013) #187 rows

# create the additional dataframes
add1960 <- data.frame(Code=Country_Code, Life.Exp=Life_Expectancy_At_Birth_1960)
add2013 <- data.frame(Code=Country_Code, Life.Exp=Life_Expectancy_At_Birth_2013)

# check summary
summary(add1960)
summary(add2013)

head(add1960)

# merge the pairs of dataframes
merged1960 <- merge(data1960, add1960, by.x="Country.Code", by.y="Code")
merged2013 <- merge(data2013, add2013, by.x="Country.Code", by.y="Code")
head(merged1960)
head(merged2013)

# delete columns
merged1960$Year <- NULL
merged2013$Year <- NULL

qplot(data=merged1960, x=Fertility.Rate, y=Life.Exp,
      color=Region, size=I(3), alpha=I(0.6), 
      main="Life Expectancy vs Fertility(1960)")

qplot(data=merged2013, x=Fertility.Rate, y=Life.Exp,
      color=Region, size=I(3), alpha=I(0.6), 
      main="Life Expectancy vs Fertility(2013)")




