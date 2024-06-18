library(readxl)
library(ggplot2)
library(fastDummies)
library(gridExtra)

all <- read_excel("NUMBER_WORDS_ALL.xlsx", 
                  sheet = "N. Words for R")
View(all)

# Create dummy variable
all_df <- dummy_cols(all, 
                      select_columns = "Dataset")

#check graphs for gpt35
comsen35<-ggplot(all_df, aes(x=`Dataset_CommonSenseQA`, y=`EVAL GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs CommonSenseQA")
math35<-ggplot(all_df, aes(x=`Dataset_MathQA`, y=`EVAL GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs MathQA")
med35<-ggplot(all_df, aes(x=`Dataset_MedQA`, y=`EVAL GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs MedQA")
mmlu35<-ggplot(all_df, aes(x=`Dataset_MMLU`, y=`EVAL GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs MMLU")
sicq35<-ggplot(all_df, aes(x=`Dataset_SciQ`, y=`EVAL GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs SciQ")
soc35<-ggplot(all_df, aes(x=`Dataset_SocLang`, y=`EVAL GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs SocLang")
words35<-ggplot(all_df, aes(x=`Number of Words`, y=`EVAL GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Number of Words")

all35 <- arrangeGrob(
  comsen35, math35, med35,
  mmlu35, sicq35, soc35,
  NULL, words35, NULL,
  nrow = 3, ncol = 3
)

# Save the grob as a PNG file
ggsave("all35.png", all35, width = 15, height = 15)
ggsave("words35.png", words35, width=15, heigh=7)

#model
allmodel35<- glm(`EVAL GPT-3.5` ~ `Number of Words` + 
                   `Dataset_CommonSenseQA` + 
                   `Dataset_MathQA` +
                   `Dataset_MedQA` +
                   `Dataset_MMLU`+
                   `Dataset_SciQ`,
                 data = all_df, family = "binomial")
summary(allmodel35)

#same for gpt4
#check graphs for gpt4
comsen4<-ggplot(all_df, aes(x=`Dataset_CommonSenseQA`, y=`EVAL GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs CommonSenseQA")
math4<-ggplot(all_df, aes(x=`Dataset_MathQA`, y=`EVAL GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs MathQA")
med4<-ggplot(all_df, aes(x=`Dataset_MedQA`, y=`EVAL GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs MedQA")
mmlu4<-ggplot(all_df, aes(x=`Dataset_MMLU`, y=`EVAL GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs MMLU")
sicq4<-ggplot(all_df, aes(x=`Dataset_SciQ`, y=`EVAL GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs SciQ")
soc4<-ggplot(all_df, aes(x=`Dataset_SocLang`, y=`EVAL GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs SocLang")
words4<-ggplot(all_df, aes(x=`Number of Words`, y=`EVAL GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Number of Words")

all4 <- arrangeGrob(
  comsen4, math4, med4,
  mmlu4, sicq4, soc4,
  NULL, words4, NULL,
  nrow = 3, ncol = 3
)

# Save the grob as a PNG file
ggsave("all4.png", all4, width = 15, height = 15)
ggsave("words4.png", words4, width=15, heigh=7)

#model
allmodel4<- glm(`EVAL GPT-4` ~ `Number of Words` + 
                   `Dataset_CommonSenseQA` + 
                   `Dataset_MathQA` +
                   `Dataset_MedQA` +
                   `Dataset_MMLU`+
                   `Dataset_SciQ`,
                 data = all_df, family = "binomial")
summary(allmodel4)

### extra things
all_new <- read_excel("NUMBER_WORDS_ALL.xlsx", 
                      sheet = "Words_% for R")
View(all_new) 

## see relation between n words and % correct answers

png("plot35.png", width = 800, height = 600)
plot(all_new$'Avg N. Words', all_new$'% Correct GPT-3.5', 
     col = "#00897B",
     main = "Comparing Avg. Number of Words with % of Correct Answers by GPT-3.5",
     #abline(model), 
     xlab = "Avg. Number of Words", 
     ylab = "Correct Answers by GPT-3.5 (mean)")
dev.off()

words_gpt35 <- lm(`% Correct GPT-3.5`~ `Avg N. Words`, 
                  data = all_new)
summary(words_gpt35)

#for gpt4

png("plot4.png", width = 800, height = 600)
plot(all_new$'Avg N. Words', all_new$'% Correct GPT-4', 
     col = "#00897B",
     main = "Comparing Avg. Number of Words with % of Correct Answers by GPT-4",
     #abline(model), 
     xlab = "Avg. Number of Words", 
     ylab = "Correct Answers by GPT-4 (mean)")
dev.off()

words_gpt4 <- lm(`% Correct GPT-4`~ `Avg N. Words`, 
                  data = all_new)
summary(words_gpt4)