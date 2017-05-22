##
ctrl<-c(4.17,5.58,5.18,6.11,4.5,4.61,5.17,4.53,5.33,5.14)
trt1<-c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
trt2<-c(6.31,5.12,5.54,5.5,5.37,5.29,4.92,6.15,8.5,5.26)

##input data
ctrl<-scan("plantgrowthctrl.txt")
trt1<-scan("plantgrowthtrt1.txt")
trt2<-scan("plantgrowthtrt2.txt")
## average
ctrl.avg<-mean(ctrl)
trt1.avg<-mean(trt1)
trt2.avg<-mean(trt2)
##median
ctrl.med<-median(ctrl)
trt1.med<-median(trt1)
trt2.med<-median(trt2)
##stdev
ctrl.sd<-sd(ctrl)
trt1.sd<-sd(trt1)
trt2.sd<-sd(trt2)
##
summary(ctrl)
## simple plotting
plot(ctrl,main="Plant Yield",ylab="kg")
points(trt1,pch=2)
points(trt2,pch=3)
##  점들을 선으로 이음
plot(ctrl,main="Plant Yield",ylab="kg",type="b")
points(trt1,pch=2,type="b")
points(trt2,pch=3,type="b")
###
plot(ctrl,main="Plant Yield",ylab="kg",type="b",lty=1)
points(trt1,pch=2,type="b", lty=2)
points(trt2,pch=3,type="b", lty=3)
## min, max control
plot(ctrl,main="Plant Yield",ylab="kg",type="b",lty=1, ylim=c(3.5,6.5))
points(trt1,pch=2,type="b", lty=2)
points(trt2,pch=3,type="b", lty=3)
## line width
plot(ctrl,main="Plant Yield",ylab="kg",type="b",lty=1, ylim=c(3.5,6.5),lwd=2)
points(trt1,pch=2,type="b", lty=2,lwd=2)
points(trt2,pch=3,type="b", lty=3,lwd=2)
## line color
plot(ctrl,main="Plant Yield",ylab="kg",type="b",lty=1, ylim=c(3.5,6.5),lwd=2,col=1)
points(trt1,pch=2,type="b", lty=2,lwd=2,col=2)
points(trt2,pch=3,type="b", lty=3,lwd=2,col=3)
### plotting
plot(ctrl,main="Plant Yield",ylab="kg",type="b", lty=1,ylim=c(3.5,6.5),lwd=2,col=2)
points(trt1,pch=4,type="b", lty=2,lwd=1.5, col=3)
points(trt2,pch=2,type="b",lty=3, lwd=2, col=4)

##
blog<-read.csv("blog.csv")

##
plot(ctrl)
?par

