##饼图
par(bg="gray")
pie(rep(1,24),col=rainbow(24),radius = 0.9)
title(main = "A Sample Color wheel",cex.main=1.4,font.main=3)
title(xlab = "(Use this as test of monitor linearity)",cex.lab=0.8,
      font.lab=3)
##制作销售数据的饼图
pie.sales<-c(0.12,0.3,0.26,0.16,0.04,0.12)
names(pie.sales)<-c("Blueberry","Cherry","Apple","Boston Cream",
                    "Other","Iphone")
pie(pie.sales,col=c("red","violetred1","green","cornsilk","cyan",
                    "yellow"))
title(main="January Pie Sales",cex.main=1.8,font.main=1)
title(xlab = "(Don't try this at home kids)",cex.lab=0.8,font.lab=3)
##示例1
par(mfrow=c(2,2))
slices<-c(10,12,4,16,8)
lbls<-c("US","UK","Australia","Germany","France")
pie(slices,labels = lbls,main="Pie CHart with percentages")
pct<-round(slices/sum(slices)*100)
lbls2<-paste(lbls,"",pct,"%",sep="")
pie(slices,labels = lbls,col=rainbow(length(lbls2)),main="Pie
    CHart with percentages")
##3D的饼图
install.packages('plotrix')
library(plotrix)
pie3D(slices,labels = lbls,explode=0.1,main="3D Pie Chart")
##利用表格来做饼图
mytable<-table(state.region)
lbls3<-paste(names(mytable),mytable,spe="")
pie(mytable,labels = lbls3,main="Pie CHart from a table")
##扇形图：饼图变种，同时展示相对数量和相互差异的方法
par(mfrow=c(1,1))
fan.plot(slices,labels=lbls,main="Fan Plot")