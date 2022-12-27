health<-read.table('healthCare.txt',stringsAsFactors = TRUE)
health
require(foreign)
require(nnet)
require(ggplot2)
require(reshape2)
install.packages("reshape2")
with(health,table(migr,provider))
with(health,table(avail,provider))
with(health,table(eth,provider))
with(health,do.call(rbind,tapply(n,provider,function(x) c(M=mean(x), SD=sd(x)))))
ggplot(health, aes(fill=provider, y=n, x=eth)) + 
  geom_bar(position="stack", stat="identity")
ggplot(health, aes(fill=provider, y=n, x=migr)) + 
  geom_bar(position="stack", stat="identity")
ggplot(health, aes(fill=provider, y=n, x=avail)) + 
  geom_bar(position="stack", stat="identity")
health$prov2<-relevel(health$provider,ref="midwife")
test<-multinom(prov2~eth+avail+migr,data=health)
summary(test)
z<-summary(test)$coefficients/summary(test)$standard.errors
z
p<-(1-pnorm(abs(z),0,1))*2
p
exp(coef(test))
head(pp<-fitted(test))
deviance(multinom(prov2~1,data=health))~deviance(test)
