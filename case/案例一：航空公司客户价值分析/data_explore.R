setwd("D:\\data")
datafile=read.csv('./air_data.csv',header=T)

#确定要探索分析的变量
col=c(15:18,20:29)#去掉日期型变量

#输出变量最值、缺失情况
summary(datafile[,col])
