##简单的图形组合
attach(mtcars)
opar<-par(no.readonly=TRUE)
par(mfrow=c(2,2))
plot(wt,mpg,main="Scatterplot of wt vs.mpg")
plot(wt,disp,main="Scatterplot of wt vs.disp")
hist(wt,main="Histogram of wt")
boxplot(wt,main="Boxplot of wt")
par(opar)
detach(mtcars)
##layout函数的调用带参
attach(mtcars)
layout(matrix(c(1,1,2,3),2,2,byrow=TRUE))
hist(wt)
hist(disp)
hist(mpg)
detach(mtcars)
##第一行图形高度是第二行图形高度的1/3
##右下角图形宽度是左下角图形宽度的1/4
attach(mtcars)
layout(matrix(c(1,1,2,3),2,2,byrow=TRUE),
       heights = c(1,2),widths = c(3,1))
hist(wt)
hist(disp)
hist(mpg)
detach(mtcars)
##坐标控制
opar<-par(no.readonly=TRUE)
par(fig=c(0,0.8,0,0.8))
plot(mtcars$wt,mtcars$mpg,xlab="Miles per Gallon",
     ylab="Car weight")
par(fig=c(0,0.8,0.55,1),new=TRUE)
boxplot(mtcars$wt,horizontal=TRUE,axes=FALSE)
par(fig=c(0.65,1,0,0.8),new=TRUE)
boxplot(mtcars$mpg,horizontal=TRUE,axes=FALSE)
mtext("Fnhanced Scatterplot",side=3,line=3)
par(opar)