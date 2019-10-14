#### 圖表用法
# https://antv.alipay.com/zh-cn/vis/chart/index.html
##### documentation
# - http://docs.ggplot2.org/current/
  
##### cheat sheet
# - https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf


library('ggplot2')
load("./riii/Statistics/cdc.Rdata")
cdc$exerany = as.factor(cdc$exerany)
cdc$hlthplan = as.factor(cdc$hlthplan)
cdc$smoke100 = as.factor(cdc$smoke100)

#install.packages('esquisse')
#library('esquisse')
#esquisse::esquisser()

load("./riii/Statistics/appledaily.Rdata")

class(as.POSIXlt(appledaily[1,'dt'],format='%Y年%m月%d日%H:%M'))
class(as.POSIXct(appledaily[1,'dt'],format='%Y年%m月%d日%H:%M'))
unclass(as.POSIXlt(appledaily[1,'dt'],format='%Y年%m月%d日%H:%M'))
unclass(as.POSIXct(appledaily[1,'dt'],format='%Y年%m月%d日%H:%M'))
# install.packages("lubridate")
library(lubridate)

sub('\\)','',sub('人氣\\(','',appledaily$clicked))
library(stringr)
str_match(appledaily$clicked,"\\d+")
str_match(appledaily$clicked,"人氣\\((\\d+)\\)")