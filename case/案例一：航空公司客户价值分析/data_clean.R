#丢弃票价为空的记录
delet_na = datafile[-which(is.na(datafile$SUM_YR_1) |
                             is.na(datafile$SUM_YR_2)),]

#丢弃票价为0、平均折扣率不为0、总飞行公里数大于0的记录
index = ((delet_na$SUM_YR_1 == 0 & delet_na$SUM_YR_2 == 0)
         * (delet_na$avg_discount != 0)
         * (delet_na$SEG_KM_SUM > 0))
deletdata = delet_na[-which(index == 1),]

#保存清洗后的数据
cleanedfile=deletdata


