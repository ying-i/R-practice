
Salary 
#---------------------------------

# 28. Metrices
#[row, column]

# -----------------------------
# 29.building first Matrix
Salary
Games
MinutesPlayed

matrix()
?rbind() # connects rows into a vector
?cbind() # connects columns into a vector


?matrix
my.data <- 1:20 #1 to 20
my.data

A <- matrix(my.data, 4, 5) # create a matrix
A
A[2,3]

B <- matrix(my.data, 4, 5, byrow=T)
B
B[2,5]

#rbind() # combine by rows
r1 <- c("I", "am", "happy")
r2 <- c("what", "a", "day")
r3 <- c(1,2,3)
C <- rbind(r1, r2, r3)
C

# cbind() combine by columns
c1 <- 1:5
c2 <- -1:-5
D <- cbind(c1,c2)
D


#--------------------------------------------
#31.Colnames() and Rownames()
# Named vectors
Charlie <- 1:5
Charlie

names(Charlie) #NULL
# give name
names(Charlie) <- c("a", "b", "c", "d", "e")
Charlie
Charlie["d"]
names(Charlie) 

# clear name
names(Charlie) <- NULL
Charlie

# Naming Matrix Dimensions
temp.vec <- rep(c("a", "b", "Zz"),each=3)# replicate 3 times
temp.vec
rep(c("a", "b", "Zz"),times=3)
rep(c("a", "b", "Zz"),each=3)

Bravo <- matrix(temp.vec, 3,3)
Bravo
rownames(Bravo) <- c("how", "are", "you")
Bravo
colnames(Bravo) <- c("X", "Y", "Z")
Bravo

Bravo["are", "Y"]
Bravo["are", "Y"] <- 0
Bravo

rownames(Bravo)
rownames(Bravo)<-NULL
Bravo

#------------------------------------------------------------
# 32.Matrix operations
Games
rownames(Games)
colnames(Games)
Games["LeBronJames", "2012"]

FieldGoals
round(FieldGoals/Games, 1)

round(MinutesPlayed/Games)

#---------------------------------------------
# Visualization with Matplot()
?matplot
FieldGoals
t(FieldGoals) # transport table
matplot(t(FieldGoals), type="b",pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4,6),pch=15:18, horiz=F)

#-----------------------------------------------------------------------------------
#34.subsetting
x <- c("a", "b","c","d","e")
x
x[c(1,5)]
x[1]

Games
Games[1:3,6:10]
Games[c(1,10),]
Games[,c("2008","2009")]

Games[1,]
Games[1,5]
Games[1,,drop=F]
Games[1,5,drop=F]

#----------------------------------------------------
# visualization subsets
Data <- MinutesPlayed[1:3,]
Data
t(Data)
matplot(t(Data), type="b",pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players[1:3], col=c(1:4,6),pch=15:18, horiz=F)

Data <- MinutesPlayed[1,,drop=F]
matplot(t(Data), type="b",pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players[1], col=c(1:4,6),pch=15:18, horiz=F)

#----------------------------------------------------------
#create own function
myfunction <- function(){
  Data <- MinutesPlayed[1,,drop=F]
  matplot(t(Data), type="b",pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[1], col=c(1:4,6),pch=15:18, horiz=F)
}
myfunction


myfunction <- function(rows){
  Data <- MinutesPlayed[rows,,drop=F]
  matplot(t(Data), type="b",pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4,6),pch=15:18, horiz=F)
}
myfunction(1:10)


myfunction <- function(data,rows){
  Data <- data[rows,,drop=F]
  matplot(t(Data), type="b",pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4,6),pch=15:18,horiz=F) 
}
myfunction(Salary,1:2)


myfunction <- function(data,rows=1:10){ #set default value of rows
  Data <- data[rows,,drop=F]
  matplot(t(Data), type="b",pch=15:18, col=c(1:4,6))
  legend("bottomleft", inset=0.01, legend=Players[rows], col=c(1:4,6),pch=15:18, horiz=F)
}
myfunction(Salary)








