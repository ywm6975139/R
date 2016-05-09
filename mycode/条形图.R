##条形图:通过水平或者垂直的条形展示类别性变量的分布或者频率
beer=scan()
6 4 4 2 3 4 6 6 6 6 4 3 8 8 8 8 3 2 6 3 2 4 4 2 2 6 3 2 8 8
barplot(beer)
barplot(table(beer)/length(beer))
install.packages("vcd")
library(vcd)
counts<-table(Arthritis$Improved)
barplot(counts,main="Simple Bar Plot",xlab = "Improvement",
        ylab = "Frequency")
barplot(counts,main="Horizontal Bar Plot",xlab = "Frequency",
        ylab = "Improvement",horiz=T)
plot(Arthritis$Improved,main="Simple Bar Plot",xlab = "Improvement",
     ylab = "Frequency")
plot(Arthritis$Improved,main="Horizontal Bar Plot",xlab = "Frequency",
     ylab = "Improvement",horiz=T)
##堆砌条形图和分组条形图
counts<-table(Arthritis$Improved,Arthritis$Treatment)
barplot(counts,main="Simple Bar Plot",xlab = "Improvement",
        ylab = "Frequency",col=c("red","yellow","green"),
        legend=rownames(counts))
barplot(counts,main="Simple Bar Plot",xlab = "Improvement",
        ylab = "Frequency",col=c("red","yellow","green"),
        legend=rownames(counts),beside=TRUE)
#课堂练习：修改图例到合理位置
##均值条形图
states<-data.frame(state.region,state.x77)
means<-aggregate(states$Illiteracy,by=list(state.region),FUN=mean)
means<-means[order(means$x),]
barplot(means$x,names.arg=means$Group.1)
title("Mean Illiteracy Rate")
par(mar=c(5,8,4,2))
par(las=2)
counts<-table(Arthritis$Improved)
barplot(counts,main="Treatment.Outcome",horiz = TRUE,cex.name= 0.8,
        names.arg = c("No.Improvement","Some Improvement","Makered.Improvement"))
##棘状图
attach(Arthritis)
counts<-table(Treatment,Improved)
spine(counts,main="Spingogram Example")
detach(Arthritis)
