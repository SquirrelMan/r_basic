library(rvest)
library(dplyr)
# 抓取網頁原始碼
newsurl <- "http://news.ltn.com.tw/list/breakingnews"
ltn <- read_html(newsurl, encoding="UTF-8")

# 抽取列表資訊 %>% iconv(from='UTF-8', to='UTF-8') 都是UTF8就不管了
ltn %>% html_nodes('ul.list') %>% html_nodes('a.tit') 
data_ltn <- ltn %>% html_nodes('ul.list') %>% html_nodes('a.tit') 

title_ltn <- data_ltn %>% html_attr('data-desc') %>% iconv(from='UTF-8', to='UTF-8')

time_ltn <- data_ltn %>% html_nodes('span') %>% html_text() %>% iconv(from='UTF-8', to='UTF-8')

tmp_time_ltn <- c()
for(i in 1:length(time_ltn)){
  if(nchar(time_ltn[i])==5)
    tmp_time_ltn <- c(tmp_time_ltn,time_ltn[i])
}
time_ltn <- tmp_time_ltn

link_ltn <- data_ltn %>% html_attr('href') %>% iconv(from='UTF-8', to='UTF-8')

# 合併資料
ltnnews <- data.frame(time =time_ltn, title= title_ltn, link= link_ltn)
head(ltnnews,length(time_ltn))