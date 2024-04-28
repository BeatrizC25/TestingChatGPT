#SCIQ DATASET 
#load packages needed 
library(tidyverse)
library(readr)
library(dplyr)
library(writexl)
library(tidyr)
#import dataset
SciQ <- read_csv("SciQ_final.csv")

#start with simple analysis.
#total number of questions 
total_questions<-length(SciQ$Question)
cat("Total amount of questions:", total_questions)

#how many right questions on total? 
#GPT-3.5
correct_gpt35<-sum(SciQ$`Eval GPT-3.5`)
cat('Correct answers given by GPT-3.5:', correct_gpt35)

#GPT-4
correct_gpt4 <-sum(SciQ$`Eval GPT-4`)
cat('Correct answers given by GPT-4:', correct_gpt4)

#are there questions gpt was not able to answer? 
#this means null values in the GPT-3.5 and GPT-4 columns
sum(is.na(SciQ$`GPT-3.5`))
sum(is.na(SciQ$`GPT-4`)) #six for gpt4

#get number of correct answers by sub-branch and branch
#GPT-3.5
SciQ_gpt35 <- SciQ %>%
  group_by(`Sub-Branch`, `Main Branch`) %>%
  summarize(
    `CorrectAnswersGPT-3.5` = sum(`Eval GPT-3.5`),
    `IncorrectAnswersGPT-3.5` = sum(`Eval GPT-3.5`==0),
    `UnansweredQuestionsGPT-3.5`= sum(is.na(`GPT-3.5`)),
    TotalQuestions_Subbranch = n()
  ) %>%
  ungroup() %>%
  group_by(`Main Branch`) %>%
  mutate(
    TotalQuestions_Branch = sum(TotalQuestions_Subbranch)
  ) %>%
  distinct(`Main Branch`, `Sub-Branch`, .keep_all = TRUE) %>%
  select(
    `Main Branch`,
    `Sub-Branch`,
    `CorrectAnswersGPT-3.5`,
    `IncorrectAnswersGPT-3.5`,
    `UnansweredQuestionsGPT-3.5`,
    TotalQuestions_Branch
  )


#same but for GPT-4
SciQ_gpt4 <- SciQ %>%
  group_by(`Sub-Branch`, `Main Branch`) %>%
  summarize(
    `CorrectAnswersGPT-4` = sum(`Eval GPT-4`),
    `IncorrectAnswersGPT-4` = sum(`Eval GPT-4`==0),
    `UnansweredQuestionsGPT-4`=sum(is.na(`GPT-4`)),
    TotalQuestions_Subbranch = n()
  ) %>%
  ungroup() %>%
  group_by(`Main Branch`) %>%
  mutate(
    TotalQuestions_Branch = sum(TotalQuestions_Subbranch)
  ) %>%
  distinct(`Main Branch`, `Sub-Branch`, .keep_all = TRUE) %>%
  select(
    `Main Branch`,
    `Sub-Branch`,
    `CorrectAnswersGPT-4`,
    `IncorrectAnswersGPT-4`,
    `UnansweredQuestionsGPT-4`,
    TotalQuestions_Branch
  )

SciQ_results<- merge(SciQ_gpt35, 
                     SciQ_gpt4, 
                     by = c("Sub-Branch", "Main Branch",
                            "TotalQuestions_Branch")
                     , all.x = TRUE)


#export tables as xlsx
write_xlsx(SciQ_gpt35, 'SciQ_gpt35_results.xlsx')
write_xlsx(SciQ_gpt4, 'SciQ_gpt4_results.xlsx')
write_xlsx(SciQ_results, 'SciQ_results.xlsx')








