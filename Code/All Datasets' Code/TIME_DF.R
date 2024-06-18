#import libraries and dataset
library(readr)
library(writexl)
time_df <- read_csv("time_df.csv")

#export as excel file
write_xlsx(time_df, 'Time_DF.xlsx')


