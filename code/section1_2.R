#Phenotypes Assessment
library(COPDSexualDimorphism.data)
data(lgrc.expr.meta)

#1
table(expr.meta$gender)

#2
summary(expr.meta$pkyrs)
median(expr.meta$pkyrs)

#3
hist(expr.meta$pkyrs)
qqnorm(expr.meta$pkyrs)
qqline(expr.meta$pkyrs)

#4
boxplot(pkyrs~gender, data=expr.meta)

#5
expr.meta$pyp1 = expr.meta$pkyrs+1
library(MASS)
lm1 = lm(pyp1~gender, data=expr.meta)
a<-boxcox(lm1)
a
a$x[which.max(a$y)]