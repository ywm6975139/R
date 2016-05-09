##散点图和Loess曲线
x<-seq(0,10,0.1)
y<-sin(x)+rnorm(101)
plot(x,y)
#局部多项式回归拟合模型
lines(x,predict(loess(y~x)))
lines(x,predict(loess(y~x,span=0.75,degree = 2)))
z=loess(y~x);lines(x,z$fit)
##局部加权多项式回归拟合模型
lines(lowess(x,y))
##点图：在简单的刻度上绘制大量的标签值
dotchart(mtcars$mpg,labels = row.names(mtcars),cex = 0.7,
         main="Gas mileage for Car Models",
         xlab = "Miles Per Gallon")
x<-mtcars[order(mtcars$mpg),]
x$color[x$cyl==4]<-"red"
x$color[x$cyl==6]<-"blue"
x$color[x$cyl==8]<-"green"
dotchart(x$mpg,labels=row.names(x),cex=0.7,groups = x$cyl,
         gcolor = "black",color = x$color,pch=19,
         main = "Gas Mileage for car Models\ngrouped by cylinder",
         xlab = "Mils Per Gallon")