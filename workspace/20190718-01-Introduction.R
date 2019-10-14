# https://github.com/YuHsuanLin/riii/blob/master/db103/db103_20190718.Rmd
# R intro ----
### RDemo 
#使用範例資料
data(anscombe)
#使用資料中x1,y1變數畫出點散布圖
plot(y1 ~ x1, data = anscombe)
#建立回歸模型並assign到lmfit變數中
lmfit <- lm(y1~x1, data=anscombe) 
#在點散佈圖上加上迴歸線
abline(lmfit, col="red")

height_vec <- c(180, 169, 173)
names(height_vec)
names(height_vec) <- c("Brian", "Toby", "Sherry")
names(height_vec)
height_vec > 175
height_vec <= 175
height_vec > 175 | height_vec < 170
height_vec < 175 & height_vec > 170
seq(1,20)
height_vec[0]
height_vec[1]

h = c(180,169,173)
w <- c(73, 87, 43)
bmi <- w / ((h/100)^2)
bmi[bmi < 18.5 | bmi >= 24]
seq()
seq(from=1, to=10)
seq(from=1, to=10, by=2)
seq(from=1, to=10, length.out = 4)
1:10
range(1,10)
height_vec
names(height_vec)[1] <- "Brian"
as.Date("2018.1.1", format("%Y.%m.%d"))
setwd("E:/R/riii/data/")
test.data = read.csv("2330.csv", header=T)
# 找出股票資料(2330.csv)中，2018年1月到12月間台積電最高收盤價(close) ----
tw2330_2017 <- tw2330[as.Date(tw2330$Date) >= "2017-01-01" & as.Date(tw2330$Date) < "2018-01-01",]
max(tw2330[as.Date(tw2330$Date) >= "2017-01-01" & as.Date(tw2330$Date) < "2018-01-01","Close"])
tw2330_2017[tw2330_2017$Close == max(tw2330[as.Date(tw2330$Date) >= "2017-01-01" & as.Date(tw2330$Date) < "2018-01-01","Close"]),]
tw2330_2017[tw2330_2017$Close == max(tw2330_2017$Close),]
# Ref. solution
order(tw2330_2017$Close, decreasing = T)
tw2330_2017[order(tw2330_2017$Close, decreasing = T),]
head(tw2330_2017[order(tw2330_2017$Close, decreasing = T),], 5)
tw2330_2017[order(tw2330_2017$Close, decreasing = T),][1,"Close"]
tw2330_2017[order(tw2330_2017$Close, decreasing = T),][1,]$Close
