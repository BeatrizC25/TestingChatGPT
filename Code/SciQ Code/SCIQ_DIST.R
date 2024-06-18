#import packages and excel file
library(readxl)
library(ggplot2)
SciQ_dist <- read_excel("C:/Users/Bia/OneDrive/Ambiente de Trabalho/TESE_2024/DATASETS TESE/DATASET_ANSWERS/SciQ/SciQ_results.xlsx", 
                          sheet = "BINOMIAL DIST")


#lets plot binomial dist
#gpt35
Microbiology_data_gpt35 <- 0:90
size_Microbiology_data_35<- SciQ_dist[SciQ_dist$`Binomial Distribution Parameters` == "n", "Microbiology"]
size_Microbiology_data_35 <- as.numeric(size_Microbiology_data_35)
prob_Microbiology_data_35<- SciQ_dist[SciQ_dist$`Binomial Distribution Parameters`== "p (for GPT-3.5)", "Microbiology"]
prob_Microbiology_data_35 <- as.numeric(prob_Microbiology_data_35$'Microbiology')
dist_Microbiology_data35 <- dbinom(Microbiology_data_gpt35, size_Microbiology_data_35, prob_Microbiology_data_35)

# Create data frame
df_Microbiology_data35 <- data.frame(x = Microbiology_data_gpt35, y = dist_Microbiology_data35, model= 'GPT-3.5')

ggplot(df_Microbiology_data35, aes(x, y)) +
  geom_bar(stat = "identity", fill = "#00897B") +
  labs(x = "Number of Successes", y = "Probability",
       title = "Binomial Distribution for GPT-3.5 (Microbiology)")

#starting with Microbiology
Microbiology_data_gpt4 <- 0:90
size_Microbiology_data_4<- SciQ_dist[SciQ_dist$`Binomial Distribution Parameters` == "n", "Microbiology"]
size_Microbiology_data_4 <- as.numeric(size_Microbiology_data_4)
prob_Microbiology_data_4<- SciQ_dist[SciQ_dist$`Binomial Distribution Parameters`== "p (for GPT-4)", "Microbiology"]
prob_Microbiology_data_4 <- as.numeric(prob_Microbiology_data_4$'Microbiology')
dist_Microbiology_data4 <- dbinom(Microbiology_data_gpt4, size_Microbiology_data_4, prob_Microbiology_data_4)

# Create data frame
df_Microbiology_data4 <- data.frame(x = Microbiology_data_gpt4, y = dist_Microbiology_data4, model= 'GPT-4')

ggplot(df_Microbiology_data4, aes(x, y)) +
  geom_bar(stat = "identity", fill = "#00897B") +
  labs(x = "Number of Successes", y = "Probability",
       title = "Binomial Distribution for GPT-4 (Microbiology)")

combined_Microbiology_data <- rbind(df_Microbiology_data35, df_Microbiology_data4)

ggplot(combined_Microbiology_data, aes(x = x, y = y, fill = model)) +
  geom_bar(stat = "identity", alpha = 0.5, position='dodge') +
  scale_fill_manual(values = c("#26A69A", "#004D40"), labels = c("GPT-3.5", "GPT-4")) +
  labs(x = "Number of Successes", y = "Probability", title = "Comparison of Binomial Distributions for GPT-3.5 and GPT-4 (Microbiology)")


