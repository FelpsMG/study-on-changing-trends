library(trend)


dataBase <- read_csv("yourCSVfile.csv")

# V2 is the column with the data we want to verify the trend
# the column with de TNN for example.

mk.test(dataBase[,V2])
sens.slope(dataBase[,V2])