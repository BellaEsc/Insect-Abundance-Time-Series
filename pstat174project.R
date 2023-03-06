# PSTAT174 Project: Data Exploration

dataloc <- './DataSource/data/InsectAbundanceBiomassData.csv'
data <- read.csv(dataloc)
data
?range
range(data$Year)
# The range of years of this data
range(data$Number)
data_nona <- na.omit(data)
range(data_nona$Number)
barplot(data_nona$Number)
dim(data_nona)
range(data_nona$Year)
data_nona

number
library(dplyr)

agg_tbl <- data_nona %>% group_by(Year) %>% 
  summarise(mean_num=mean(Number),
            .groups = 'drop')
agg_tbl
df_agg <- as.data.frame(agg_tbl)

bug_ts <- ts(df_agg$mean_num, start=1925, end=2018)
plot.ts(bug_ts)
