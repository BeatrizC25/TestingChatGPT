#COMSEN DATASET 
#load packages needed 
library(tidyverse)
library(readr)
library(dplyr)
library(writexl)
library(tidyr)
#import dataset
ComSen <- read_csv("ComSen_final.csv")

#start with simple analysis.
#total number of questions 
total_questions<-length(ComSen$Question)
cat("Total amount of questions:", total_questions)

#how many right questions on total? 
#GPT-3.5
correct_gpt35<-sum(ComSen$`Eval GPT-3.5`)
cat('Correct answers given by GPT-3.5:', correct_gpt35)

#GPT-4
correct_gpt4 <-sum(ComSen$`Eval GPT-4`)
cat('Correct answers given by GPT-4:', correct_gpt4)

#are there questions gpt was not able to answer? 
#this means null values in the GPT-3.5 and GPT-4 columns
sum(is.na(ComSen$`GPT-3.5`))
sum(is.na(ComSen$`GPT-4`)) #3 for gpt4

#get number of correct answers by sub-branch and branch
#GPT-3.5
ComSen_gpt35 <- ComSen %>%
  summarize(
    `CorrectAnswersGPT-3.5` = sum(`Eval GPT-3.5`),
    `IncorrectAnswersGPT-3.5` = sum(`Eval GPT-3.5`==0),
    `UnansweredQuestionsGPT-3.5`= sum(is.na(`GPT-3.5`)),
    TotalQuestions = n())
  select(
    `CorrectAnswersGPT-3.5`,
    `IncorrectAnswersGPT-3.5`,
    `UnansweredQuestionsGPT-3.5`,
    TotalQuestions
  )


#same but for GPT-4
ComSen_gpt4 <- ComSen %>%
  summarize(
    `CorrectAnswersGPT-4` = sum(`Eval GPT-4`),
    `IncorrectAnswersGPT-4` = sum(`Eval GPT-4`==0),
    `UnansweredQuestionsGPT-4`=sum(is.na(`GPT-4`)),
    TotalQuestions = n()
  ) 
  select(
    `CorrectAnswersGPT-4`,
    `IncorrectAnswersGPT-4`,
    `UnansweredQuestionsGPT-4`,
    TotalQuestions
  )

ComSen_results<- merge(ComSen_gpt35, 
                     ComSen_gpt4, 
                     all.x = TRUE)


#export tables as xlsx
write_xlsx(ComSen_gpt35, 'ComSen_gpt35_results.xlsx')
write_xlsx(ComSen_gpt4, 'COmSen_gpt4_results.xlsx')
write_xlsx(ComSen_results, 'ComSen_results.xlsx')
