library(ggplot2)

mydata = read.csv("DOT_Traffic_Speeds_NBE.csv", header = TRUE)
mydata$BOROUGH = as.factor(mydata$BOROUGH)
mydata$LINK_NAME = as.factor(mydata$LINK_NAME)
summary(mydata)

linkid = unique(mydata$LINK_ID)

# split data by link id
for(i in linkid){
  
  newdata = mydata[mydata$LINK_ID==i, ]
  write.csv(newdata, paste("linkid_", as.character(i), ".csv", sep=""), row.names=FALSE)
  
}


# barplot of speed

# delete the outliers and 0 of speed
speed = mydata$SPEED
speed = speed[-which(speed > 70)]
speed = speed[-which(speed == 0)]

newdata = data.frame("speed"=speed)
p = ggplot(newdata) + 
  geom_bar(aes(x=speed), stat="count", width=0.9, fill="#1965A9") + 
  labs(title = "Speed Hist") +
  theme(plot.title = element_text(hjust = 0.5)) + 
  theme(title=element_text(size=20))
p

