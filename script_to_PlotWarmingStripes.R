#this script is based on
#https://dominicroye.github.io/en/2018/how-to-create-warming-stripes-in-r/

library(tidyverse)
library(lubridate)
library(RColorBrewer)

# fileName, titleImg and captionImg need to be string
# dataBase need to be a dataset 
  
#import the annual temperatures
dataBase <- read_csv("yourCSVfile.csv")
fileName = "the file name"
titleImg = "the img title"
captionImg = "the img caption"
  
# V1 = column with date
# V2 = column with temperature
dataBase <- select(dataBase, V1, V2)
  
#rename the temperature column
dataBase <- rename(dataBase, ta = V2)

#missing values -99.9 or NA
summary(dataBase) 

dataBase <- mutate(dataBase, ta = ifelse(ta == -99.9, NA, ta))
dataBase <- mutate(dataBase, date = str_c(V1, "01-01", sep = "-") %>% ymd())
  
theme_strip <- theme_minimal()+
  theme(axis.text.y = element_blank(),
        axis.line.y = element_blank(),
        axis.title = element_blank(),
        panel.grid.major = element_blank(),
        legend.title = element_blank(),
        axis.text.x = element_text(vjust = 3),
        panel.grid.minor = element_blank(),
        plot.title = element_text(size = 14, face = "bold")
  )
  
  
col_strip <- brewer.pal(11, "RdBu")
  
brewer.pal.info


png(filename=paste(fileName,".png"))

ggplot(dataBase,
       aes(x = date, y = 1, fill = ta))+
  geom_tile()+
  scale_x_date(date_breaks = "5 years",
               date_labels = "%Y",
               expand = c(0, 0))+
  scale_y_continuous(expand = c(0, 0))+
  scale_fill_gradientn(colors = rev(col_strip))+
  guides(fill = guide_colorbar(barwidth = 1))+
  labs(title = titleImg,
       caption = captionImg)+
  theme_strip
  
dev.off ();
