setwd("D:\\data")
datafile=read.csv('./zscoredata.csv',he=T)

#数据标准化
zscoredfile=scale(datafile)

#数据写入
write.csv(zscoredfile,'./tmp/zscoreddata.csv')


