library(ggplot2movies)
library(ggplot2)
library(dplyr)
m <- movies
m[,25]=""
colnames(m)[25] <- "class"
for(i in 1:nrow(m)){
  if(m[i,"Short"]==1){
    m[i,"class"]="Short"
  }else if(m[i,"Romance"]==1){
    m[i,"class"]="Romance"
  }else if(m[i,"Documentary"]==1){
    m[i,"class"]="Documentary"
  }else if(m[i,"Drama"]==1){
    m[i,"class"]="Drama"
  }else if(m[i,"Comedy"]==1){
    m[i,"class"]="Comedy"
  }else if(m[i,"Animation"]==1){
    m[i,"class"]="Animation"
  }else if(m[i,"Action"]==1){
    m[i,"class"]="Action"
  } 
} 
options(dplyr.width = Inf)
head(m)
ggplot(m,aes(class))+geom_bar()
summarise(group_by(m,class),median(rating))



