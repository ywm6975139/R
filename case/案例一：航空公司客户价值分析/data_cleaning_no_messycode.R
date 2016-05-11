#说明：每个步骤基本都有2到3种方法，每种方法产生的数据集应当是一致的
#数据导入
#一. 设定session工作路径
setwd("E:/tmp")



#二. 载入数据, 注意设定 stringsAsFactor=FALSE
air_data <- read.csv("E:/tmp/air_data.csv")
#查看 air_data
View(air_data)

#加载dplyr包
library(dplyr)




#三.载入需要的列
#方法1 通过列序号加载
names(air_data)
air_data1 <- air_data[,c(2,10,11,15,16,17,19,29)] 

#方法2 通过dplyr的select 语句
air_data2 <- select(air_data
                    ,FFP_DATE
                    ,LOAD_TIME
                    ,FLIGHT_COUNT
                    ,SUM_YR_1
                    ,SUM_YR_2
                    ,SEG_KM_SUM
                    ,LAST_FLIGHT_DATE
                    ,avg_discount)




#四.剔除na
#方法1 dplyr 包中的filter
summary(air_data1) #查看na所在的列

air_dataNoNa1 <- filter(air_data1,(is.na(SUM_YR_1)|is.na(SUM_YR_2))==FALSE)

#方法2 base
air_dataNoNa2 <- air_data2[(is.na(air_data2$SUM_YR_1)
                            |is.na(air_data2$SUM_YR_2))==FALSE,]

#方法3 na.omit删除所有na出现的行
air_dataNoNa3 <- na.omit(air_data2)

检查行数是否一致
nrow(air_dataNoNa1)
nrow(air_dataNoNa2)
nrow(air_dataNoNa3)




#五.筛选所有没有支付（SUM_YR_1,SUM_YR_2都为0）
#且飞行长度大于0（SEG_KM_SUM>0)且折扣不为0 (avg_discount!=0)的人
#四个条件同时满足

#方法1 base
air_dataCl1 <- air_dataNoNa1[(air_dataNoNa1$SUM_YR_1==0
                              &air_dataNoNa1$SUM_YR_2==0
                              &air_dataNoNa1$SEG_KM_SUM>0
                              &air_dataNoNa1$avg_discount!=0) ==FALSE,]
#方法2 dplyr filter
air_dataCl2 <- filter(air_dataNoNa1,(SUM_YR_1==0
                                     &SUM_YR_2==0
                                     &SEG_KM_SUM>0
                                     &avg_discount!=0
) ==FALSE
)




# 六. 添加需要分析L和R

#步骤解析
#1. 主要用到difftime函数 取出两个时间字段的时间差
#2. 由于difftime的参数需要时间类型，
#所以需要将原始的character/factor类型用as.Date转换为日期类型
#3.由于最后的标准化和kmeans需要的是数值型字段，所以在算出时间差之后
#还要用as.numeric转换为数值型，/30是为了以月为单位

#方法1 base
air_dataCl1$L <- as.numeric(
  difftime(
    as.Date(air_dataCl1$LOAD_TIME)
    ,as.Date(air_dataCl1$FFP_DATE)
    ,units = "days")
)/30

air_dataCl1$R <- as.numeric(
  difftime(
    as.Date(air_dataCl1$LOAD_TIME)
    ,as.Date(air_dataCl1$LAST_FLIGHT_DATE)
    ,units = "days")
)/30

#方法2 dplyr mutate
air_dataCl2 <- mutate(air_dataCl2
                      ,L=as.numeric(
                        difftime(as.Date(LOAD_TIME)
                                 ,as.Date(FFP_DATE)
                                 ,units = "days"))/30
                      ,R=as.numeric(difftime(as.Date(LOAD_TIME)
                                             ,as.Date(LAST_FLIGHT_DATE),units = "days"))/30
)




#方法3 base transform
air_dataCl2 <- transform(air_dataCl2,L=as.numeric(
  difftime(as.Date(LOAD_TIME)
           ,as.Date(FFP_DATE)
           ,units = "days"))/30
  ,R=as.numeric(difftime(as.Date(LOAD_TIME)
                         ,as.Date(LAST_FLIGHT_DATE),units = "days"))/30)


#七.删除na，取出需要的列，并且标准化
#查看是否有na
summary(air_dataCl1)
#删除na
air_dataCl1 <- na.omit(air_dataCl1)

#取出需要的列
air_dataCl1 <- select(air_dataCl1,L,R,FLIGHT_COUNT,SEG_KM_SUM,avg_discount)
#给列重命名
names(air_dataCl1) <- c("L","R","F","M","C")

#使用apply函数给每一列做标准化，可通过help(apply)查看apply的具体使用方法
air_dataSt <- apply(air_dataCl1,2,scale) #2表示列，该段意思是给scale作用于每一列

summary(air_dataSt)





# 八. Kmeans得出 聚类

result <- kmeans(air_dataSt,5)
