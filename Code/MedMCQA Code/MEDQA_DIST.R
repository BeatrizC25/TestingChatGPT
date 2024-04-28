#import packages and excel file
library(readxl)
library(ggplot2)
MedQ_dist <- read_excel("C:/Users/Bia/OneDrive/Ambiente de Trabalho/TESE_2024/DATASETS TESE/DATASET_ANSWERS/MedQ/MedQ_results.xlsx", 
                          sheet = "BINOMIAL DIST")


#lets plot binomial dist
#gpt35
Surgery_med_gpt35 <- 0:90
size_Surgery_med_35<- MedQ_dist[MedQ_dist$`Binomial Distribution Parameters` == "n", "Surgery"]
size_Surgery_med_35 <- as.numeric(size_Surgery_med_35)
prob_Surgery_med_35<- MedQ_dist[MedQ_dist$`Binomial Distribution Parameters`== "p (for GPT-3.5)", "Surgery"]
prob_Surgery_med_35 <- as.numeric(prob_Surgery_med_35$'Surgery')
dist_Surgery_med35 <- dbinom(Surgery_med_gpt35, size_Surgery_med_35, prob_Surgery_med_35)

# Create data frame
df_Surgery_med35 <- data.frame(x = Surgery_med_gpt35, y = dist_Surgery_med35, model= 'GPT-3.5')

ggplot(df_Surgery_med35, aes(x, y)) +
  geom_bar(stat = "identity", fill = "#00897B") +
  labs(x = "Number of Successes", y = "Probability",
       title = "Binomial Distribution for GPT-3.5 (Surgery)")

#starting with Surgery
Surgery_med_gpt4 <- 0:90
size_Surgery_med_4<- MedQ_dist[MedQ_dist$`Binomial Distribution Parameters` == "n", "Surgery"]
size_Surgery_med_4 <- as.numeric(size_Surgery_med_4)
prob_Surgery_med_4<- MedQ_dist[MedQ_dist$`Binomial Distribution Parameters`== "p (for GPT-4)", "Surgery"]
prob_Surgery_med_4 <- as.numeric(prob_Surgery_med_4$'Surgery')
dist_Surgery_med4 <- dbinom(Surgery_med_gpt4, size_Surgery_med_4, prob_Surgery_med_4)

# Create data frame
df_Surgery_med4 <- data.frame(x = Surgery_med_gpt4, y = dist_Surgery_med4, model= 'GPT-4')

ggplot(df_Surgery_med4, aes(x, y)) +
  geom_bar(stat = "identity", fill = "#00897B") +
  labs(x = "Number of Successes", y = "Probability",
       title = "Binomial Distribution for GPT-4 (Surgery)")

combined_Surgery_med <- rbind(df_Surgery_med35, df_Surgery_med4)

ggplot(combined_Surgery_med, aes(x = x, y = y, fill = model)) +
  geom_bar(stat = "identity", alpha = 0.5, position='dodge') +
  scale_fill_manual(values = c("#26A69A", "#004D40"), labels = c("GPT-3.5", "GPT-4")) +
  labs(x = "Number of Successes", y = "Probability", title = "Comparison of Binomial Distributions for GPT-3.5 and GPT-4 (Surgery)")
