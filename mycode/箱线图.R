#箱型图（盒图、盒须图）
#五数概括
#目的：1、找孤立点、离群点,2.观测异常值，1.5*IQR以外的值,3.数据汇总
par(bg="green")
n<-10
g<-gl(n,100,n*100)
x<-rnorm(n*100)+sqrt(as.numeric(g))
boxplot(split(x,g),col="red",notch = TRUE)
#练习：给图表加上一个标题表示这幅箱型图的含义
boxplot(mtcars$mpg,main="Sample",ylab="mpg")
boxplot.stats(mtcars$mpg)
varvas<-TRUE
boxplot(mpg~cyl,data = mtcars,main="AAAAA",xlab="Noc",ylab="Mpg")
#练习：为不同的缸数，不同的变速箱类型的车型来绘制油耗的箱线图，给箱线图着色,
#6幅箱线图,2种颜色，颜色可以重复使用3次
mtcars$cyl.f<-factor(mtcars$cyl,levels = c(4,6,8),labels=c("4","6","8"))
mtcars$am.f<-factor(mtcars$am,levels = c(0,1),labels=c("auto","standard"))
boxplot(mpg~am.f*cyl.f,data = mtcars,varwidth=TRUE,col=c("red","yellow"),
        main="mpg by auto",xlab="at")
#小提琴图：箱线图和核密度图的结合
install.packages("vioplot")
library(vioplot)
x1<-mtcars$mpg[mtcars$cyl==4]
x2<-mtcars$mpg[mtcars$cyl==6]
x3<-mtcars$mpg[mtcars$cyl==8]
vioplot(x1,x2,x3,names=c("4cyl","6cyl","8cyl"),col="green")
title("violin plots of Miles Per Gallon")
