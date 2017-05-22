
install.packages("KoNLP")
install.packages("wordcloud")
install.packages("stringr")
install.packages("rjava")
install.packages("ggplot2")
library(KoNLP)# ��Ű�� LOading
library(wordcloud)


useSejongDic()# ���� ���� ��� �˸�

a<-c("�츮���� �̸��� ���ѹα��Դϴ�. ������ �Ϻ��� �ֽ��ϴ�")
extractNoun(a) #��������

b<-c("�츮���� �̸��� ���ѹα��̸� ����δ� korea �Դϴ�", "������� �Ϻ��̸� ����δ� japen�Դϴ�")
c<-sapply(b, extractNoun,USE.NAMES = F) #�ι����̻� ��������
c

mergeUserDic(data.frame("���ѹα�","ncn"))#�ܾ�����߰�
mergeUserDic(data.frame("�Ϻ�","ncn"))
c<-sapply(b, extractNoun,USE.NAMES = F)
c


wordcloud(c(letters,LETTERS,0:9),seq(1,1000,len=62))

library(RColorBrewer)
palete<-brewer.pal(9,"Set1")
wordcloud(c(letters,LETTERS,0:9),seq(1,1000,len=62),colors=palete)

txt<-readLines("�빫������ɿ�����.txt")
nouns<-sapply(txt,extractNoun,USE.NAMES = F)
head(unlist(nouns),50)# ���� 50���� ����
write(unlist(nouns),"noh2.txt")
rev<-read.table("noh2.txt")
nrow(rev)
wordcount<-table(rev)
head(sort(wordcount,decreasing=T),50)
library(RColorBrewer)
palete<-brewer.pal(9,"Set1")
wordcloud(names(wordcount),freq = wordcount,scale=c(5,0.5),rot.per = 0.25,min.freq = 1,
          random.order = F,ramdom.color=T,colors=palete)


txt2<-readLines("�ڱ���������ĺ�������.txt")
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

txt3<-readLines("����������.txt")
order<-sapply(txt2,extractNoun,USE.NAMES = F)
c=unlist(order)
order<-Filter(function(x){nchar(x)>=2},c)
order<-gsub("�ϰ�����Ʈ",order)
order<-gsub("html",order)
order<-gsub("��Ȳû��ȯ",order)
order<-gsub("82��",order)
order<-gsub("��������ũ",order)
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
pie(wordcount,main="����������", col=rainbow(10),cex=0.8,labels=labels.default())

