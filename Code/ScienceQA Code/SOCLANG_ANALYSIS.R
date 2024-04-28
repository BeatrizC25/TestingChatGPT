#SOCLANG DATASET 
#load packages needed 
library(tidyverse)
library(readr)
library(dplyr)
library(writexl)
library(tidyr)
#import dataset
SocLang <- read_csv("SocLang_final.csv")

#start with simple analysis.
#total number of questions 
total_questions<-length(SocLang$Question)
cat("Total amount of questions:", total_questions)

#how many right questions on total? 
#GPT-3.5
correct_gpt35<-sum(SocLang$`Eval GPT-3.5`)
cat('Correct answers given by GPT-3.5:', correct_gpt35)

#GPT-4
correct_gpt4 <-sum(SocLang$`Eval GPT-4`)
cat('Correct answers given by GPT-4:', correct_gpt4)

#are there questions gpt was not able to answer? 
#this means null values in the GPT-3.5 and GPT-4 columns
sum(is.na(SocLang$`GPT-3.5`))
sum(is.na(SocLang$`GPT-4`)) #2 for gpt4

#get number of correct answers by sub-branch and branch
#GPT-3.5
SocLang_gpt35 <- SocLang %>%
  group_by(`Topic`, `Subject`) %>%
  summarize(
    `CorrectAnswersGPT-3.5` = sum(`Eval GPT-3.5`),
    `IncorrectAnswersGPT-3.5` = sum(`Eval GPT-3.5`==0),
    `UnansweredQuestionsGPT-3.5`= sum(is.na(`GPT-3.5`)),
    TotalQuestions_Topic = n()
  ) %>%
  ungroup() %>%
  group_by(`Subject`) %>%
  mutate(
    TotalQuestions_Subject = sum(TotalQuestions_Topic)
  ) %>%
  distinct(`Subject`, `Topic`, .keep_all = TRUE) %>%
  select(
    `Subject`,
    `Topic`,
    `CorrectAnswersGPT-3.5`,
    `IncorrectAnswersGPT-3.5`,
    `UnansweredQuestionsGPT-3.5`,
    TotalQuestions_Subject
  )


#same but for GPT-4
SocLang_gpt4 <- SocLang %>%
  group_by(`Topic`, `Subject`) %>%
  summarize(
    `CorrectAnswersGPT-4` = sum(`Eval GPT-4`),
    `IncorrectAnswersGPT-4` = sum(`Eval GPT-4`==0),
    `UnansweredQuestionsGPT-4`=sum(is.na(`GPT-4`)),
    TotalQuestions_Topic = n()
  ) %>%
  ungroup() %>%
  group_by(`Subject`) %>%
  mutate(
    TotalQuestions_Subject = sum(TotalQuestions_Topic)
  ) %>%
  distinct(`Subject`, `Topic`, .keep_all = TRUE) %>%
  select(
    `Subject`,
    `Topic`,
    `CorrectAnswersGPT-4`,
    `IncorrectAnswersGPT-4`,
    `UnansweredQuestionsGPT-4`,
    TotalQuestions_Subject
  )

SocLang_results<- merge(SocLang_gpt35, 
                     SocLang_gpt4, 
                     by = c("Topic", "Subject",
                            "TotalQuestions_Subject")
                     , all.x = TRUE)


#export tables as xlsx
write_xlsx(SocLang_gpt35, 'SocLang_gpt35_results.xlsx')
write_xlsx(SocLang_gpt4, 'SocLang_gpt4_results.xlsx')
write_xlsx(SocLang_results, 'SocLang_results.xlsx')