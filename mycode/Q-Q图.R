##Q-Qͼ
par(mfrow=c(1,3))
y<-rt(200,df=5)
qqnorm(y);qqline(y,col=2)
qqplot(y,rt(300,df=5))
#��ϰ
data(precip)
qqnorm(precip,ylab="Precipitiation[in/yr] for 70 us cities");qqline(
  precip,col=3)
par(mfrow=c(1,1))
