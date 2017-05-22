
install.packages("KoNLP")
install.packages("wordcloud")
install.packages("stringr")
install.packages("rjava")
install.packages("ggplot2")
library(KoNLP)# 패키지 LOading
library(wordcloud)


useSejongDic()# 세종 사전 사용 알림

a<-c("우리나라 이름은 대한민국입니다. 옆에는 일본도 있습니다")
extractNoun(a) #명사추출

b<-c("우리나라 이름은 대한민국이며 영어로는 korea 입니다", "옆나라는 일본이며 영어로는 japen입니다")
c<-sapply(b, extractNoun,USE.NAMES = F) #두문장이상 명사추출
c

mergeUserDic(data.frame("대한민국","ncn"))#단어사전추가
mergeUserDic(data.frame("일본","ncn"))
c<-sapply(b, extractNoun,USE.NAMES = F)
c


wordcloud(c(letters,LETTERS,0:9),seq(1,1000,len=62))

library(RColorBrewer)
palete<-brewer.pal(9,"Set1")
wordcloud(c(letters,LETTERS,0:9),seq(1,1000,len=62),colors=palete)

txt<-readLines("노무현대통령연설문.txt")
nouns<-sapply(txt,extractNoun,USE.NAMES = F)
head(unlist(nouns),50)# 명사 50개만 추출
write(unlist(nouns),"noh2.txt")
rev<-read.table("noh2.txt")
nrow(rev)
wordcount<-table(rev)
head(sort(wordcount,decreasing=T),50)
library(RColorBrewer)
palete<-brewer.pal(9,"Set1")
wordcloud(names(wordcount),freq = wordcount,scale=c(5,0.5),rot.per = 0.25,min.freq = 1,
          random.order = F,ramdom.color=T,colors=palete)


txt2<-readLines("박근혜대통령후보수락문.txt")
nouns2<-sapply(txt2,extractNoun,USE.NAMES = F)
head(unlist(nouns2),50)
write(unlist(nouns2),"noh3.txt")
rev2<-read.table("noh3.txt")
nrow(rev2)
wordcount2<-table(rev2)
head(sort(wordcount2,decreasing=T),50)
library(RColorBrewer)
palete<-brewer.pal(9,"Set1")
wordcloud(names(wordcount2),freq = wordcount2,scale=c(5,0.5),rot.per = 0.25,min.freq = 1,
          random.order = F,ramdom.color=T,colors=palete)

txt3<-readLines("국정교과서.txt")
order<-sapply(txt2,extractNoun,USE.NAMES = F)
c=unlist(order)
order<-Filter(function(x){nchar(x)>=2},c)
order<-gsub("일간워스트",order)
order<-gsub("html",order)
order<-gsub("우황청심환",order)
order<-gsub("82쿡",order)
order<-gsub("엠엘비파크",order)
order

head(unlist(order),20)
write(unlist(order),"noh4.txt")
rev<-read.table("noh4.txt")
nrow(rev)
wordcount<-table(rev)
head(sort(wordcount,decreasing=T),20)
library(RColorBrewer)
palete<-brewer.pal(9,"Set1")
wordcloud(names(wordcount),freq = wordcount,scale=c(5,0.5),rot.per = 0.25,min.freq = 1,
          random.order = F,ramdom.color=T,colors=palete)
wordcount
pie(wordcount,main="국정교과서", col=rainbow(10),cex=0.8,labels=labels.default())


