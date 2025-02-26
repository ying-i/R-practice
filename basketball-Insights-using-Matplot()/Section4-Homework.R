myplot <- function(z, who=1:10) {
  matplot(t(z[who,,drop=F]), type="b", pch=15:18, col=c(1:4,6), main="Basketball Players Analysis")
  legend("bottomleft", inset=0.01, legend=Players[who], col=c(1:4,6), pch=15:18, horiz=F)
}
myplot(FreeThrows)
myplot(FreeThrowsAttempts)

# Free Throw Attempts/Games
myplot(FreeThrowsAttempts/Games)

# Free Throw Accuracy
myplot(FreeThrows/FreeThrowsAttempts)

# Player Style Pattern 
myplot((Points-FreeThrows)/FieldGoals)
