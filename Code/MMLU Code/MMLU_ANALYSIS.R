#MMLU DATASET 
#load packages needed 
library(tidyverse)
library(readr)
library(dplyr)
library(writexl)
library(tidyr)
#import dataset
MMLU <- read_csv("MMLU_final.csv")

#start with simple analysis.
#total number of questions 
total_questions<-length(MMLU$Question)
cat("Total amount of questions:", total_questions)

#how many right questions on total? 
#GPT-3.5
correct_gpt35<-sum(MMLU$`Eval GPT-3.5`)
cat('Correct answers given by GPT-3.5:', correct_gpt35)

#GPT-4
correct_gpt4 <-sum(MMLU$`Eval GPT-4`)
cat('Correct answers given by GPT-4:', correct_gpt4)

#are there questions gpt was not able to answer? 
#this means null values in the GPT-3.5 and GPT-4 columns
sum(is.na(MMLU$`GPT-3.5`))
sum(is.na(MMLU$`GPT-4`)) #3 for gpt4

#get number of correct answers by sub-branch and branch
#GPT-3.5
MMLU_gpt35 <- MMLU %>%
  group_by(Subject) %>%
  summarize(
    `CorrectAnswersGPT-3.5` = sum(`Eval GPT-3.5`),
    `IncorrectAnswersGPT-3.5` = sum(`Eval GPT-3.5`==0),
    `UnansweredQuestionsGPT-3.5`= sum(is.na(`GPT-3.5`)),
    TotalQuestions_Subject = n()
  ) %>%
  distinct(Subject, .keep_all = TRUE) %>%
  select(
    Subject,
    `CorrectAnswersGPT-3.5`,
    `IncorrectAnswersGPT-3.5`,
    `UnansweredQuestionsGPT-3.5`,
    TotalQuestions_Subject
  )


#same but for GPT-4
MMLU_gpt4 <- MMLU %>%
  group_by(Subject) %>%
  summarize(
    `CorrectAnswersGPT-4` = sum(`Eval GPT-4`),
    `IncorrectAnswersGPT-4` = sum(`Eval GPT-4`==0),
    `UnansweredQuestionsGPT-4`=sum(is.na(`GPT-4`)),
    TotalQuestions_Subject = n()
  ) %>%
  distinct(Subject, .keep_all = TRUE) %>%
  select(
    Subject,
    `CorrectAnswersGPT-4`,
    `IncorrectAnswersGPT-4`,
    `UnansweredQuestionsGPT-4`,
    TotalQuestions_Subject
  )

MMLU_results<- merge(MMLU_gpt35, 
                     MMLU_gpt4, 
                     by = c("Subject",
                            "TotalQuestions_Subject")
                     , all.x = TRUE)


#export tables as xlsx
write_xlsx(MMLU_gpt35, 'MMLU_gpt35_results.xlsx')
write_xlsx(MMLU_gpt4, 'MMLU_gpt4_results.xlsx')
write_xlsx(MMLU_results, 'MMLU_results.xlsx')