# import data
mov <- read.csv("D:\\Computer1\\Developer tools\\R\\projects\\section6Advanced-visualization-GGPlot2\\movie-domestic-%-Gross-using-GGPlot2\\Section6-Homework-Data.csv")

# data exploration
head(mov)
summary(mov)
str(mov)

library(ggplot2)

# filter1 for the dataframe
filt <- (mov$Genre == "action") | (mov$Genre == "adventure") | (mov$Genre == "animation") | (mov$Genre == "comedy") | (mov$Genre == "drama")

# filter2: if any studio of these following --- is true
filt2 <- mov$Studio %in% c("Buena Vista Studios", "WB", "Fox", "Universal", "Sony", "Paramount Pictures")


mov2 <- mov[filt & filt2,]
mov2
head(mov2)

# prepare the plot's data and aes layers:
p <- ggplot(data=mov2, aes(x=Genre, y=Gross...US))
p

# add geometries
q <- p + 
  geom_jitter(aes(size=Budget...mill., color=Studio)) + 
  geom_boxplot(alpha=0.7, outlier.color = NA)
q

# non-data ink
q <- q +
  xlab("Genre") + ylab("Gross % US") + ggtitle("Domestic Gross % by Genre")
q

# theme
q <- q + theme(
  axis.title.x = element_text(color = "Blue",size=30),
  axis.title.y = element_text(color = "Blue",size=30),
  axis.text.x = element_text(size=20),
  axis.text.y = element_text(size=20),
  plot.title = element_text(size=20),
  legend.title = element_text(size=20),
  legend.text = element_text(size=20),
  #text= element_text(family="")
)
q

q$labels$size <- "Budget $M"
q



