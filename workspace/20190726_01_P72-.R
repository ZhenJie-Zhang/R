# p72 清單(lists)----
item <- list(thing="hat", size=8.25)
item

# p75 資料讀取與寫入----
# - http://hadley.nz/
# - https://github.com/tidyverse/readr
install.packages("tidyverse")
library(tidyverse)
?dplyr::lag()
read_delim("E:/R/riii/data/match.txt", col_names = T, delim = "|")
read_csv("E:/R/riii/data/2330.csv", col_names = T)

library(readxl)
read_excel("E:/R/riii/data/FinancialReport.xlsx", col_names = T)

library(jsonlite)
json_data <- fromJSON("E:/R/riii/data/rent.json")
json_data <- as.tibble(json_data)

library(XML)
url <- 'http://opendata.epa.gov.tw/ws/Data/ATM00698/?$format=xml'
weather <- xmlToDataFrame(url)
View(weather)
str(weather)

# p80 流程控制(Flow Control)----
x = 5; 
if(x > 3){  
  print("x > 3"); 
}else{ 
  print("x <= 3"); 
}

if(x > 3) print("x > 3") else print("x <= 3")
ifelse(x>3, "x > 3", "x < 3")

data("iris")
iris$new_species = factor(ifelse(iris$Species == 'setosa', 'IsSetosa', "NotSetosa"))

mat = matrix(rep(1, 9^2), nrow=9)

for(i in 1:nrow(mat)){
  for(j in 1:ncol(mat)){
    mat[i,j]=i*j
    # mat[i,j] = paste(i,"*",j,"= ",i*j)
    # mat[i,j]=sprintf("%d * %d = %d", i, j, i*j)
  }
}
mat

mat1 = matrix(1:9, nrow = 9)
mat2 = matrix(1:9, ncol = 9)
mat1 %*% mat2

match <- read.table("E:/R/riii/data/match.txt", sep ="|")
str(match)

x = matrix(rep(-1, length(levels(match$V1))^2), nrow=length(levels(match$V1)))
colnames(x) <- rownames(x) <- c(levels(match$V1))
for(i in 1:nrow(x)){
  for(j in 1:ncol(x)){
    x[i,j]= ifelse(i==j, -1, match$V3[i*j])
  }
}
x

x = list(c(1,2,3,4), c(5,6,7,8))
lapply(x, sum)

m1 = matrix(1:4, byrow=T, nrow=2)
m2 = matrix(5:8, byrow=T, nrow=2)
li = list(m1, m2)
lapply(li, mean)
lapply(li, function(e) e[1,])

save(iris, file='iris.Rdata')
load("E:/R/riii/Statistics/cdc.Rdata")
str(cdc)
cdc$exerany = as.factor(cdc$exerany)
cdc$hlthplan = as.factor(cdc$hlthplan)
cdc$smoke100 = as.factor(cdc$smoke100)
table(cdc$exerany)
table(cdc$genhlth)
table(cdc$exerany) / nrow(cdc)
table(cdc$exerany) / length(cdc$exerany)
paste(table(cdc$exerany) / nrow(cdc) * 100, '%')

table(cdc$gender, cdc$exerany)
apply(table(cdc$gender, cdc$exerany), 1, function(e){ e / sum(e)})
prop.table(table(cdc$gender, cdc$exerany), 1)


table(cdc$gender, cdc$genhlth, cdc$exerany)

table(paste(cdc$gender, cdc$genhlth, sep='_'), cdc$exerany)
table(cut(cdc$height, seq(45,95,by=5)))
table(cut(cdc$height, seq(45,95,by=5),right=F))
table(cut(cdc$height, seq(45,95,by=5),right=T))

mean(cdc$weight)
median(cdc$weight)
as.numeric(names(which.max(table(cdc$weight))))
Mode <- function(v){
  unique(v)[which.max(tabulate(match(v, unique(v))))]
}
Mode(cdc$weight)
range(cdc$weight)
IQR(cdc$weight)
quantile(cdc$weight)
quantile(cdc$weight, 0.25)
quantile(cdc$weight, 0.75)
var(cdc$weight)
sqrt(var(cdc$weight))
sd(cdc$weight)
summary(cdc$weight)

View(cdc)
str(cdc)
cov(cdc[,5:8])
cor(cdc[,5:8])

table(cdc$smoke100)
barplot(table(cdc$smoke100))
barplot(table(cdc$smoke100),xlab='有無吸菸',ylab='人數',
        names.arg=c('無','有'),
        main='有無吸菸習慣',col='blue')
pie(table(cdc$smoke100))
pie(table(cdc$genhlth))
pie(table(cdc$genhlth), col = rainbow(5))

pct = round(table(cdc$genhlth) / length(cdc$genhlth) *100,1)
labels = paste(names(pct),pct,"%")
pie(table(cdc$genhlth), labels = labels)

gender_smokers = table(cdc$gender, cdc$smoke100)
mosaicplot(gender_smokers)

hist(cdc$height)

par(mfrow=c(3,1))
hist(cdc$height)
hist(cdc$height, breaks = 30)
hist(cdc$height, breaks = 50)

stem(cdc$weight)
stem(sample(cdc$age, 100))

par(mfrow=c(1,1))
boxplot(cdc$height, ylab='Height', main='Box plot of Height')
boxplot(cdc$height, ylab='Height', main='Box plot of Height', horizontal=T)
boxplot(cdc$weight ~ cdc$gender, ylab='Weight', main='Box plot of Height')
boxplot(cdc$age ~ cdc$gender)

bmi = (cdc$weight/cdc$height^2) * 703
boxplot(bmi ~ cdc$genhlth)

plot(cdc$weight, cdc$height)
plot(cdc$weight, cdc$wtdesire)

plot(cdc[,c('height', 'weight', 'wtdesire')])

# https://rpubs.com/skydome20/R-Note4-Plotting_System
library(ggplot2)
plot(density(cdc$age), xlab="age", ylab='density')
plot(density(cdc$weight), xlab="age", ylab='density')
qplot(cdc$age, geom = "density", xlab="age", ylab='density')
qplot(cdc$weight, geom = "density", xlab="weight", ylab='density')

png(filename = 'E:/R/test123.png')
plot(cdc$weight, cdc$height)
dev.off()

install.packages('DataExplorer')
library(DataExplorer)
create_report(cdc)
introduce(iris)
dummify(iris)
