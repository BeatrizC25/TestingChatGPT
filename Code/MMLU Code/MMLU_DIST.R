#import packages and excel file
library(readxl)
library(ggplot2)
MMLU_dist <- read_excel("C:/Users/Bia/OneDrive/Ambiente de Trabalho/TESE_2024/DATASETS TESE/DATASET_ANSWERS/MMLU/MMLU_results.xlsx", 
                          sheet = "BINOMIAL DIST")


#lets plot binomial dist
#gpt35
Sociology_gpt35 <- 0:90
size_Sociology_35<- MMLU_dist[MMLU_dist$`Binomial Distribution Parameters` == "n", "Psychology/Sociology"]
size_Sociology_35 <- as.numeric(size_Sociology_35)
prob_Sociology_35<- MMLU_dist[MMLU_dist$`Binomial Distribution Parameters`== "p (for GPT-3.5)", "Psychology/Sociology"]
prob_Sociology_35 <- as.numeric(prob_Sociology_35$'Psychology/Sociology')
dist_Sociology35 <- dbinom(Sociology_gpt35, size_Sociology_35, prob_Sociology_35)

# Create data frame
df_Sociology35 <- data.frame(x = Sociology_gpt35, y = dist_Sociology35, model= 'GPT-3.5')

ggplot(df_Sociology35, aes(x, y)) +
  geom_bar(stat = "identity", fill = "#00897B") +
  labs(x = "Number of Successes", y = "Probability",
       title = "Binomial Distribution for GPT-3.5 (Psychology/Sociology)")

#starting with Psychology/Sociology
Sociology_gpt4 <- 0:90
size_Sociology_4<- MMLU_dist[MMLU_dist$`Binomial Distribution Parameters` == "n", "Psychology/Sociology"]
size_Sociology_4 <- as.numeric(size_Sociology_4)
prob_Sociology_4<- MMLU_dist[MMLU_dist$`Binomial Distribution Parameters`== "p (for GPT-4)", "Psychology/Sociology"]
prob_Sociology_4 <- as.numeric(prob_Sociology_4$'Psychology/Sociology')
dist_Sociology4 <- dbinom(Sociology_gpt4, size_Sociology_4, prob_Sociology_4)

# Create data frame
df_Sociology4 <- data.frame(x = Sociology_gpt4, y = dist_Sociology4, model= 'GPT-4')

ggplot(df_Sociology4, aes(x, y)) +
  geom_bar(stat = "identity", fill = "#00897B") +
  labs(x = "Number of Successes", y = "Probability",
       title = "Binomial Distribution for GPT-4 (Psychology/Sociology)")

combined_Sociology <- rbind(df_Sociology35, df_Sociology4)

ggplot(combined_Sociology, aes(x = x, y = y, fill = model)) +
  geom_bar(stat = "identity", alpha = 0.5, position='dodge') +
  scale_fill_manual(values = c("#26A69A", "#004D40"), labels = c("GPT-3.5", "GPT-4")) +
  labs(x = "Number of Successes", y = "Probability", title = "Comparison of Binomial Distributions for GPT-3.5 and GPT-4 (Psychology/Sociology)")
