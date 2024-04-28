#MATHQA DATASET 
#load packages needed 
library(tidyverse)
library(readr)
library(dplyr)
library(writexl)
library(tidyr)
#import dataset
MathQA<- read_csv("MathQA_final.csv")

#start with simple analysis.
#total number of questions 
total_questions<-length(MathQA$Question)
cat("Total amount of questions:", total_questions)

#how many right questions on total? 
#GPT-3.5
correct_gpt35<-sum(MathQA$`Eval GPT-3.5`)
cat('Correct answers given by GPT-3.5:', correct_gpt35)

#GPT-4
correct_gpt4 <-sum(MathQA$`Eval GPT-4`)
cat('Correct answers given by GPT-4:', correct_gpt4)

#are there questions gpt was not able to answer? 
#this means null values in the GPT-3.5 and GPT-4 columns
sum(is.na(MathQA$`GPT-3.5`)) #4 for gpt3.5
sum(is.na(MathQA$`GPT-4`)) #7 for gpt4

#get number of correct answers by sub-branch and branch
#GPT-3.5
MathQA_gpt35 <- MathQA %>%
  group_by(`Sub-Branch`) %>%
  summarize(
    `CorrectAnswersGPT-3.5` = sum(`Eval GPT-3.5`),
    `IncorrectAnswersGPT-3.5` = sum(`Eval GPT-3.5`==0),
    `UnansweredQuestionsGPT-3.5`= sum(is.na(`GPT-3.5`)),
    TotalQuestions_Subbranch = n()
  ) %>%
  distinct(`Sub-Branch`, .keep_all = TRUE) %>%
  select(
    `Sub-Branch`,
    `CorrectAnswersGPT-3.5`,
    `IncorrectAnswersGPT-3.5`,
    `UnansweredQuestionsGPT-3.5`,
    `TotalQuestions_Subbranch`
  )


#same but for GPT-4
MathQA_gpt4 <- MathQA %>%
  group_by(`Sub-Branch`) %>%
  summarize(
    `CorrectAnswersGPT-4` = sum(`Eval GPT-4`),
    `IncorrectAnswersGPT-4` = sum(`Eval GPT-4`==0),
    `UnansweredQuestionsGPT-4`=sum(is.na(`GPT-4`)),
    TotalQuestions_Subbranch = n()
  ) %>%
  distinct(`Sub-Branch`, .keep_all = TRUE) %>%
  select(
    `Sub-Branch`,
    `CorrectAnswersGPT-4`,
    `IncorrectAnswersGPT-4`,
    `UnansweredQuestionsGPT-4`,
    `TotalQuestions_Subbranch`
  )

MathQA_results<- merge(MathQA_gpt35, 
                     MathQA_gpt4, 
                     by = c("Sub-Branch", 
                            "TotalQuestions_Subbranch")
                     , all.x = TRUE)


#export tables as xlsx
write_xlsx(MathQA_gpt35, 'MathQA_gpt35_results.xlsx')
write_xlsx(MathQA_gpt4, 'MathQA_gpt4_results.xlsx')
write_xlsx(MathQA_results, 'MathQA_results.xlsx')