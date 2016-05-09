##直方图
x<-scan()
22 25 24 12 29 5 8 35 44 53 34 56 31 38 47 20 1 7 43 69 73 79 89 88 42 47 55 78 26 33
hist(x)
hist(x,probability = TRUE)
rug(jitter(x))
hist(x,breaks = 10)
hist(x,breaks = c(0,10,20,30,40,50,60,max(x)))
##在直方图中添加折线图
x<-c(.314,.289,.282,.279,.267,.265,.256,.250,.249,.211,.161)
tmp<-hist(x)
lines(c(min(tmp$breaks),tmp$mids,max(tmp$breaks)),c(0,tmp$counts,0),type="l")
#type= "p "在图形中数据显示为点
#type= "l "在图形中数据显示为线
#type= "b "在图形中数据显示为点和连接线
#type= "o "在图形中数据点覆盖在线上
#type= "h "在图形中数据显示为从点到x轴的垂直线
#type= "s "在图形中数据显示为阶梯图
#type= "n "在图形中数据不显示
##添加曲线
data("faithful")
attach(faithful)
hist(eruptions,15,prob=T)
lines(density(eruptions))
#练习：用mtcars数据集画直方图，要求：将四张图形画在一个画布上，
#第一幅图：画出每加仑油耗的直方图，第二幅图：油耗，横坐标组距12，
#颜色是红色，命名横轴，命名标题，第三幅图：
par(mfrow=c(2,2))
hist(mtcars$mpg)
hist(mtcars$mpg,breaks = 12,col="red",xlab = "miles per gallon",
     main = "Coloered histogram with 12 bins")
hist(mtcars$mpg,freq=FALSE,breaks = 12,col="red",xlab = "miles",
     main = "Histogram,rug plot,density curve")
rug(jitter(mtcars$mpg))
lines(density(mtcars$mpg),col="blue",lwd=2)
x<-mtcars$mpg
h<-hist(x,breaks=12,col="red",xlab ="Miles Per Gallon" ,main ="Histogram
with normal curve and box" )
xfit<-seq(min(x),max(x),length=40)
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))
yfit<-yfit*diff(h$mids[1:2]*length(x))
lines(xfit,yfit,col="blue",lwd=2)
box()
