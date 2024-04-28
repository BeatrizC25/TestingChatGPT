#import packages and excel file
library(readxl)
library(ggplot2)
ComSen_dist <- read_excel("C:/Users/Bia/OneDrive/Ambiente de Trabalho/TESE_2024/DATASETS TESE/DATASET_ANSWERS/ComSen/ComSen_results.xlsx", 
                        sheet = "BINOMIAL DIST")


#lets plot binomial dist
#gpt35
all_comsen_gpt35 <- 0:90
size_all_comsen_35<- ComSen_dist[ComSen_dist$`Binomial Distribution Parameters` == "n", "All"]
size_all_comsen_35 <- as.numeric(size_all_comsen_35)
prob_all_comsen_35<- ComSen_dist[ComSen_dist$`Binomial Distribution Parameters`== "p (for GPT-3.5)", "All"]
prob_all_comsen_35 <- as.numeric(prob_all_comsen_35$'All')
dist_all_comsen35 <- dbinom(all_comsen_gpt35, size_all_comsen_35, prob_all_comsen_35)

# Create data frame
df_all_comsen35 <- data.frame(x = all_comsen_gpt35, y = dist_all_comsen35, model= 'GPT-3.5')

ggplot(df_all_comsen35, aes(x, y)) +
  geom_bar(stat = "identity", fill = "#00897B") +
  labs(x = "Number of Successes", y = "Probability",
       title = "Binomial Distribution for GPT-3.5 (All)")

#starting with All
all_comsen_gpt4 <- 0:90
size_all_comsen_4<- ComSen_dist[ComSen_dist$`Binomial Distribution Parameters` == "n", "All"]
size_all_comsen_4 <- as.numeric(size_all_comsen_4)
prob_all_comsen_4<- ComSen_dist[ComSen_dist$`Binomial Distribution Parameters`== "p (for GPT-4)", "All"]
prob_all_comsen_4 <- as.numeric(prob_all_comsen_4$'All')
dist_all_comsen4 <- dbinom(all_comsen_gpt4, size_all_comsen_4, prob_all_comsen_4)

# Create data frame
df_all_comsen4 <- data.frame(x = all_comsen_gpt4, y = dist_all_comsen4, model= 'GPT-4')

ggplot(df_all_comsen4, aes(x, y)) +
  geom_bar(stat = "identity", fill = "#00897B") +
  labs(x = "Number of Successes", y = "Probability",
       title = "Binomial Distribution for GPT-4 (All)")

combined_all_comsen <- rbind(df_all_comsen35, df_all_comsen4)

ggplot(combined_all_comsen, aes(x = x, y = y, fill = model)) +
  geom_bar(stat = "identity", alpha = 0.5, position='dodge') +
  scale_fill_manual(values = c("#26A69A", "#004D40"), labels = c("GPT-3.5", "GPT-4")) +
  labs(x = "Number of Successes", y = "Probability", title = "Comparison of Binomial Distributions for GPT-3.5 and GPT-4 (All)")
