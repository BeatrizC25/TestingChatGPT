#import packages and excel file
library(readxl)
library(ggplot2)
SocLang_dist <- read_excel("C:/Users/Bia/OneDrive/Ambiente de Trabalho/TESE_2024/DATASETS TESE/DATASET_ANSWERS/SocLang/SocLang_results.xlsx", 
                          sheet = "BINOMIAL DIST")


#lets plot binomial dist
#gpt35
lang_gpt35 <- 0:90
size_lang_35<- SocLang_dist[SocLang_dist$`Binomial Distribution Parameters` == "n", "Figurative-language"]
size_lang_35 <- as.numeric(size_lang_35)
prob_lang_35<- SocLang_dist[SocLang_dist$`Binomial Distribution Parameters`== "p (for GPT-3.5)", "Figurative-language"]
prob_lang_35 <- as.numeric(prob_lang_35$'Figurative-language')
dist_lang35 <- dbinom(lang_gpt35, size_lang_35, prob_lang_35)

# Create data frame
df_lang35 <- data.frame(x = lang_gpt35, y = dist_lang35, model= 'GPT-3.5')

ggplot(df_lang35, aes(x, y)) +
  geom_bar(stat = "identity", fill = "#00897B") +
  labs(x = "Number of Successes", y = "Probability",
       title = "Binomial Distribution for GPT-3.5 (Figurative-language)")

#starting with Figurative-language
lang_gpt4 <- 0:90
size_lang_4<- SocLang_dist[SocLang_dist$`Binomial Distribution Parameters` == "n", "Figurative-language"]
size_lang_4 <- as.numeric(size_lang_4)
prob_lang_4<- SocLang_dist[SocLang_dist$`Binomial Distribution Parameters`== "p (for GPT-4)", "Figurative-language"]
prob_lang_4 <- as.numeric(prob_lang_4$'Figurative-language')
dist_lang4 <- dbinom(lang_gpt4, size_lang_4, prob_lang_4)

# Create data frame
df_lang4 <- data.frame(x = lang_gpt4, y = dist_lang4, model= 'GPT-4')

ggplot(df_lang4, aes(x, y)) +
  geom_bar(stat = "identity", fill = "#00897B") +
  labs(x = "Number of Successes", y = "Probability",
       title = "Binomial Distribution for GPT-4 (Figurative-language)")

combined_lang <- rbind(df_lang35, df_lang4)

ggplot(combined_lang, aes(x = x, y = y, fill = model)) +
  geom_bar(stat = "identity", alpha = 0.5, position='dodge') +
  scale_fill_manual(values = c("#26A69A", "#004D40"), labels = c("GPT-3.5", "GPT-4")) +
  labs(x = "Number of Successes", y = "Probability", title = "Comparison of Binomial Distributions for GPT-3.5 and GPT-4 (Figurative-language)")
