#import packages and excel file
library(readxl)
library(ggplot2)
MathQA_dist <- read_excel("C:/Users/Bia/OneDrive/Ambiente de Trabalho/TESE_2024/DATASETS TESE/DATASET_ANSWERS/MathQA/MathQA_results.xlsx", 
                             sheet = "BINOMIAL DIST")


#lets plot binomial dist
#starting with gain
gain_gpt35 <- 0:90
size_g_35<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters` == "n", "Gain"]
size_g_35 <- as.numeric(size_g_35)
prob_g_35<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters`== "p (for GPT-3.5)", "Gain"]
prob_g_35 <- as.numeric(prob_g_35$Gain)
dist_gain35 <- dbinom(gain_gpt35, size_g_35, prob_g_35)

# Create data frame
df_gain35 <- data.frame(x = gain_gpt35, y = dist_gain35, model= 'GPT-3.5')

ggplot(df_gain35, aes(x, y)) +
  geom_bar(stat = "identity", fill = "#00897B") +
  labs(x = "Number of Successes", y = "Probability",
       title = "Binomial Distribution for GPT-3.5 (Gain)")

#going with gain for gpt4
gain_gpt4 <- 0:90
size_g_4<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters` == "n", "Gain"]
size_g_4 <- as.numeric(size_g_4)
prob_g_4<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters`== "p (for GPT-4)", "Gain"]
prob_g_4 <- as.numeric(prob_g_4$Gain)
dist_gain4 <- dbinom(gain_gpt4, size_g_4, prob_g_4)

# Create data frame
df_gain4 <- data.frame(x = gain_gpt4, y = dist_gain4, model='GPT-4')

ggplot(df_gain4, aes(x, y)) +
  geom_bar(stat = "identity", fill = "#00695C") +
  labs(x = "Number of Successes", y = "Probability",
       title = "Binomial Distribution for GPT-4 (Gain)")


#general
general_gpt35 <- 0:90
size_gen_35<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters` == "n", "General"]
size_gen_35 <- as.numeric(size_gen_35)
prob_gen_35<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters`== "p (for GPT-3.5)", "General"]
prob_gen_35 <- as.numeric(prob_gen_35$General)
dist_gen35 <- dbinom(general_gpt35, size_gen_35, prob_gen_35)

# Create data frame
df_gen35 <- data.frame(x = general_gpt35, y = dist_gen35, model='GPT-3.5')

ggplot(df_gen35, aes(x, y)) +
  geom_bar(stat = "identity", fill = "#00897B") +
  labs(x = "Number of Successes", y = "Probability",
       title = "Binomial Distribution for GPT-3.5 (General)")

#going with gain for gpt4
general_gpt4 <- 0:90
size_gen_4<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters` == "n", "General"]
size_gen_4 <- as.numeric(size_gen_4)
prob_gen_4<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters`== "p (for GPT-4)", "General"]
prob_gen_4 <- as.numeric(prob_gen_4$General)
dist_gen4 <- dbinom(general_gpt4, size_gen_4, prob_gen_4)

# Create data frame
df_gen4 <- data.frame(x = general_gpt4, y = dist_gen4, model='GPT-4')

ggplot(df_gen4, aes(x, y)) +
  geom_bar(stat = "identity", fill = "#00695C") +
  labs(x = "Number of Successes", y = "Probability",
       title = "Binomial Distribution for GPT-4 (General)")

#geometry
geo_gpt35 <- 0:90
size_geo_35<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters` == "n", "Geometry"]
size_geo_35 <- as.numeric(size_geo_35)
prob_geo_35<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters`== "p (for GPT-3.5)", "Geometry"]
prob_geo_35 <- as.numeric(prob_geo_35$Geometry)
dist_geo35 <- dbinom(geo_gpt35, size_geo_35, prob_geo_35)

# Create data frame
df_geo35 <- data.frame(x = geo_gpt35, y = dist_geo35, model='GPT-3.5')

ggplot(df_geo35, aes(x, y)) +
  geom_bar(stat = "identity", fill = "#00897B") +
  labs(x = "Number of Successes", y = "Probability",
       title = "Binomial Distribution for GPT-3.5 (Geometry)")

#going with gain for gpt4
geo_gpt4 <- 0:90
size_geo_4<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters` == "n", "Geometry"]
size_geo_4 <- as.numeric(size_geo_4)
prob_geo_4<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters`== "p (for GPT-4)", "Geometry"]
prob_geo_4 <- as.numeric(prob_geo_4$Geometry)
dist_geo4 <- dbinom(geo_gpt4, size_geo_4, prob_geo_4)

# Create data frame
df_geo4 <- data.frame(x = geo_gpt4, y = dist_geo4, model='GPT-4')

ggplot(df_geo4, aes(x, y)) +
  geom_bar(stat = "identity", fill = "#00695C") +
  labs(x = "Number of Successes", y = "Probability",
       title = "Binomial Distribution for GPT-4 (Geometry)")

#other
other_gpt35 <- 0:90
size_o_35<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters` == "n", "Other"]
size_o_35 <- as.numeric(size_o_35)
prob_o_35<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters`== "p (for GPT-3.5)", "Other"]
prob_o_35 <- as.numeric(prob_o_35$Other)
dist_other35 <- dbinom(other_gpt35, size_o_35, prob_o_35)

# Create data frame
df_other35 <- data.frame(x = other_gpt35, y = dist_other35, model='GPT-3.5')

ggplot(df_other35, aes(x, y)) +
  geom_bar(stat = "identity", fill = "#00897B") +
  labs(x = "Number of Successes", y = "Probability",
       title = "Binomial Distribution for GPT-3.5 (Other)")

#going with gain for gpt4
other_gpt4 <- 0:90
size_o_4<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters` == "n", "Other"]
size_o_4 <- as.numeric(size_o_4)
prob_o_4<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters`== "p (for GPT-4)", "Other"]
prob_o_4 <- as.numeric(prob_o_4$Other)
dist_other4 <- dbinom(other_gpt4, size_o_4, prob_o_4)

# Create data frame
df_other4 <- data.frame(x = other_gpt4, y = dist_other4, model='GPT-4')

ggplot(df_other4, aes(x, y)) +
  geom_bar(stat = "identity", fill = "#00695C") +
  labs(x = "Number of Successes", y = "Probability",
       title = "Binomial Distribution for GPT-4 (Other)")

#physics
phys_gpt35 <- 0:90
size_phys_35<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters` == "n", "Physics"]
size_phys_35 <- as.numeric(size_phys_35)
prob_phys_35<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters`== "p (for GPT-3.5)", "Physics"]
prob_phys_35 <- as.numeric(prob_phys_35$Physics)
dist_phys35 <- dbinom(phys_gpt35, size_phys_35, prob_phys_35)

# Create data frame
df_phys35 <- data.frame(x = phys_gpt35, y = dist_phys35, model='GPT-3.5')

ggplot(df_phys35, aes(x, y)) +
  geom_bar(stat = "identity", fill = "#00897B") +
  labs(x = "Number of Successes", y = "Probability",
       title = "Binomial Distribution for GPT-3.5 (Physics)")

#going with gain for gpt4
phys_gpt4 <- 0:90
size_phys_4<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters` == "n", "Physics"]
size_phys_4 <- as.numeric(size_phys_4)
prob_phys_4<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters`== "p (for GPT-4)", "Physics"]
prob_phys_4 <- as.numeric(prob_phys_4$Physics)
dist_phys4 <- dbinom(phys_gpt4, size_phys_4, prob_phys_4)

# Create data frame
df_phys4 <- data.frame(x = phys_gpt4, y = dist_phys4, model='GPT-4')

ggplot(df_phys4, aes(x, y)) +
  geom_bar(stat = "identity", fill = "#00695C") +
  labs(x = "Number of Successes", y = "Probability",
       title = "Binomial Distribution for GPT-4 (Physics)")

#probability
prob_gpt35 <- 0:90
size_prob_35<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters` == "n", "Probability"]
size_prob_35 <- as.numeric(size_prob_35)
prob_prob_35<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters`== "p (for GPT-3.5)", "Probability"]
prob_prob_35 <- as.numeric(prob_prob_35$Probability)
dist_prob35 <- dbinom(prob_gpt35, size_prob_35, prob_prob_35)

# Create data frame
df_prob35 <- data.frame(x = prob_gpt35, y = dist_prob35, model='GPT-3.5')

ggplot(df_prob35, aes(x, y)) +
  geom_bar(stat = "identity", fill = "#00897B") +
  labs(x = "Number of Successes", y = "Probability",
       title = "Binomial Distribution for GPT-3.5 (Probability)")

#going with gain for gpt4
prob_gpt4 <- 0:90
size_prob_4<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters` == "n", "Probability"]
size_prob_4 <- as.numeric(size_prob_4)
prob_prob_4<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters`== "p (for GPT-4)", "Probability"]
prob_prob_4 <- as.numeric(prob_prob_4$Probability)
dist_prob4 <- dbinom(prob_gpt4, size_prob_4, prob_prob_4)

# Create data frame
df_prob4 <- data.frame(x = prob_gpt4, y = dist_prob4, model='GPT-4')

ggplot(df_prob4, aes(x, y)) +
  geom_bar(stat = "identity", fill = "#00695C") +
  labs(x = "Number of Successes", y = "Probability",
       title = "Binomial Distribution for GPT-4 (Probability)")

#all
all_gpt35 <- 0:540
size_all_35<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters` == "n", "All"]
size_all_35 <- as.numeric(size_all_35)
prob_all_35<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters`== "p (for GPT-3.5)", "All"]
prob_all_35 <- as.numeric(prob_all_35$All)
dist_all35 <- dbinom(all_gpt35, size_all_35, prob_all_35)

# Create data frame
df_all35 <- data.frame(x = all_gpt35, y = dist_all35, model='GPT-3.5')

ggplot(df_all35, aes(x, y)) +
  geom_bar(stat = "identity", fill = "#00897B") +
  labs(x = "Number of Successes", y = "Probability",
       title = "Binomial Distribution for GPT-3.5 (All)")

#going with gain for gpt4
all_gpt4 <- 0:540
size_all_4<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters` == "n", "All"]
size_all_4 <- as.numeric(size_all_4)
prob_all_4<- MathQA_dist[MathQA_dist$`Binomial Distribution Parameters`== "p (for GPT-4)", "All"]
prob_all_4 <- as.numeric(prob_all_4$All)
dist_all4 <- dbinom(all_gpt4, size_all_4, prob_all_4)

# Create data frame
df_all4 <- data.frame(x = all_gpt4, y = dist_all4, model='GPT-4')

ggplot(df_all4, aes(x, y)) +
  geom_bar(stat = "identity", fill = "#00695C") +
  labs(x = "Number of Successes", y = "Probability",
       title = "Binomial Distribution for GPT-4 (All)")

#combined plots
#GAIN
# Combine both data frames
combined_gain <- rbind(df_gain35, df_gain4)

ggplot(combined_gain, aes(x = x, y = y, fill = model)) +
  geom_bar(stat = "identity", alpha=0.5, position='dodge') +
  scale_fill_manual(values = c("#26A69A", "#004D40"), labels = c("GPT-3.5", "GPT-4")) +
  labs(x = "Number of Successes", y = "Probability", title = "Comparison of Binomial Distributions for GPT-3.5 and GPT-4 (Gain)")

#General
# Combine both data frames
combined_gen <- rbind(df_gen35, df_gen4)

ggplot(combined_gen, aes(x = x, y = y, fill = model)) +
  geom_bar(stat = "identity", alpha = 0.5, position='dodge') +
  scale_fill_manual(values = c("#26A69A", "#004D40"), labels = c("GPT-3.5", "GPT-4")) +
  labs(x = "Number of Successes", y = "Probability", title = "Comparison of Binomial Distributions for GPT-3.5 and GPT-4 (General)")

#Geometry
# Combine both data frames
combined_geo <- rbind(df_geo35, df_geo4)

ggplot(combined_geo, aes(x = x, y = y, fill = model)) +
  geom_bar(stat = "identity", alpha = 0.5, position='dodge') +
  scale_fill_manual(values = c("#26A69A", "#004D40"), labels = c("GPT-3.5", "GPT-4")) +
  labs(x = "Number of Successes", y = "Probability", title = "Comparison of Binomial Distributions for GPT-3.5 and GPT-4 (Geometry)")

#other
# Combine both data frames
combined_other <- rbind(df_other35, df_other4)

ggplot(combined_gain, aes(x = x, y = y, fill = model)) +
  geom_bar(stat = "identity", alpha = 0.5, position='dodge') +
  scale_fill_manual(values = c("#26A69A", "#004D40"), labels = c("GPT-3.5", "GPT-4")) +
  labs(x = "Number of Successes", y = "Probability", title = "Comparison of Binomial Distributions for GPT-3.5 and GPT-4 (Other)")

#physics
# Combine both data frames
combined_phys <- rbind(df_phys35, df_phys4)

ggplot(combined_phys, aes(x = x, y = y, fill = model)) +
  geom_bar(stat = "identity", alpha = 0.5, position='dodge') +
  scale_fill_manual(values = c("#26A69A", "#004D40"), labels = c("GPT-3.5", "GPT-4")) +
  labs(x = "Number of Successes", y = "Probability", title = "Comparison of Binomial Distributions for GPT-3.5 and GPT-4 (Physics)")

#probability
# Combine both data frames
combined_prob <- rbind(df_prob35, df_prob4)

ggplot(combined_prob, aes(x = x, y = y, fill = model)) +
  geom_bar(stat = "identity", alpha = 0.5, position='dodge') +
  scale_fill_manual(values = c("#26A69A", "#004D40"), labels = c("GPT-3.5", "GPT-4")) +
  labs(x = "Number of Successes", y = "Probability", title = "Comparison of Binomial Distributions for GPT-3.5 and GPT-4 (Probability)")

#ALL
# Combine both data frames
combined_all <- rbind(df_all35, df_all4)

ggplot(combined_all, aes(x = x, y = y, fill = model)) +
  geom_bar(stat = "identity", alpha = 0.5, position='dodge') +
  scale_fill_manual(values = c("#26A69A", "#004D40"), labels = c("GPT-3.5", "GPT-4")) +
  labs(x = "Number of Successes", y = "Probability", title = "Comparison of Binomial Distributions for GPT-3.5 and GPT-4 (All)")


