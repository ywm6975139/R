#图形的基本参数
#1、为了更好的观察到异常点2、更好的汇报工作
#创建图形、保存图形，修改图形的一些基本的方法
#案例1：病人对药物A和药物B的不同剂量的反应情况
dose<-c(20,30,40,50,60)
drugA<-c(16,18,22,34,50)
drugB<-c(15,20,27,31,40)
#创建一副描述变量之间关系的关系图：剂量和药物A
plot(dose,drugA,type="b")
#调用图形参数函数par
opar<-par(no.readonly = TRUE)#生成一个可修改当前图形的参数列表
par(lty=4,pch=22)
plot(dose,drugA,type="b")
par(opar)
#par函数的参数：pch：绘制点用到的符号，25个；cex绘制点符号默认大小的缩放；
#lty：指定线条的类型，1、实线，2、虚线，3、点线，4、点和虚线相间，5、长须线，6、点和长须线相间
#lwd：线条宽度
#小练习：修改案例1的图形，节点符号是黑方块，放大3倍，线条使用虚线，线条宽度放大2倍
plot(dose,drugA,type = "b",lty=2,lwd=3,pch=15,cex=3)
#颜色参数，col默认的绘图颜色
#col.axis=坐标抽刻度文字的颜色
#col.lab=坐标轴标签的颜色
#col.main=标题颜色
#col.sub=副标题颜色
#fg=前景色
#bg=背景色
#colors()：R语言中的颜色
#rainbow():连续彩虹颜色
#heat.colors():暖色
#gray():多阶灰度色
n<-10#生成10中颜色的彩虹色
mycolors<-rainbow(n)
pie(rep(1:n),labels = mycolors,col=mycolors)
mygray<-gray(0:n/n)#生成10阶的灰度色
pie(rep(1:n),labels = mygray,col=mygray)
#文本的使用：
#cex：默认缩放的倍数
#cex.axis=坐标抽刻度文字的缩放倍数
#cex.lab=坐标轴标签的缩放倍数
#cex.main=标题缩放倍数
#cex.sub=副标题缩放倍数
#font（整数表示），用于指定绘图文字字体的样式
#1、常规，2、粗体，3、斜体，4、粗斜体，5、符号字体
#font.axis=坐标抽刻度文字字体
#font.lab=坐标轴标签的字体
#font.main=标题字体
#font.sub=副标题字体
#ps:字体的磅值，1磅=1/72英寸，文本的最终大小ps*ces
#family:绘制文本时用到的字体族
#小练习：坐标轴字体样式为斜体；1.5倍默认字体大小的坐标轴字体标签
par(font.lab=3,cex.lab=1.5)
#有关图形的尺寸的应用
#pin：英寸来表示图形的尺寸（宽、高）
#mai：数值向量表达边界的大小，顺序：下左上右
#mar：英分来表示图形的尺寸，默认值：c=(5,4,4,2)+0.1
#案例2:
opar<-par(no.readonly = TRUE)
par(mfrow=c(1,2))
par(pin=c(2,3))
par(lwd=3,cex=0.7)
par(cex.axis=0.8,font.axis=3)
plot(dose,drugA,type = "b",lty=2,lwd=3,pch=19,col="red")
plot(dose,drugB,type = "b",lty=3,lwd=3,pch=8,col="blue")
par(opar)
#文本、坐标轴和图例
plot(dose,drugA,type = "b",lty=2,lwd=2,pch=8,col="red",
     main="A for DrugA",
     sub="Data",
     xlab = "X",ylab = "Y",
     xlim = c(0,60),ylim = c(0,70))
#标题：title
title(main="AA",col.main="green",sub = "Mysub",col.sub="red",xlab = "x",
      col.lab="green",cex.lab=0.75)
#自定义坐标轴：axis
#案例
x<-c(1:10)
y<-x
z<-10/x
opar<-par(no.readonly = TRUE)
par=(mar=c(5,4,4,8)+0.1)
plot(x,y,type="b",pch=21,col="red",yaxt="n",lty=3,ann=FALSE)
lines(x,z,type = "b",col="green",lty=2)
axis(2,at=x,labels = x,col.axis="red",las=2)
#练习：对Z做自定义坐标轴
axis(4,at=z,labels = round(z,digits = 2),col.axis="blue",
     las=2,cex.axis=0.7,tck=-0.01)
#添加文本文件
mtext("y=10/x",side=4,line=3,cex.lab=1,las=2,col="blue")
title("An example",xlab="x values",ylab="Y=X")
par(opar)
#次要刻度线：minor.tric
#参考线：abline
#图例
opar<-par(no.readonly = TRUE)
par(lwd=2,cex=.75,font.lab=2)
plot(dose,drugA,type ="b",pch=15,lty=1,col="red",xlim=c(0,60),ylim=c(0,60),
     main="AAAAA",xlab="XXXX",ylab="YYYY")
lines(dose,drugB,type="b",pch=17,lty=1,col="blue")
abline(h=c(30),lwd=1.5,lty=2,col="green")
install.packages("graphicsQC")
library(graphicsQC)
legend("topleft",inset = 0.005,title = "Drug Type",c("A","B"),
       lty=c(1,2),pch=c(15,17),col=c("red","blue"))
#文本标注
#matcars，美国《Motor Trend》，收集的32辆汽车（1973-1974）的11项指标
install.packages("R.matlab")
library(R.matlab)
mtcars
help(mtcars)
#英里/加仑,气缸数,发动机的排量，马力,后轴比,重量
#练习：制作一副汽车的重量和每公里油耗的关系图
attach(mtcars)
plot(wt,mpg,main = "mileage vs.weight",
     xlab = "weight",ylab = "mileage",
     pch=15,col="green")
text(wt,mpg,row.names(mtcars),cex=0.6,pos=4,col="red")
detach(mtcars)
