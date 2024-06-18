library(readxl)
library(ggplot2)
library(fastDummies)
library(gridExtra)

soclang <- read_excel("soclang_final.xlsx")
View(soclang)

# Create dummy variable
soclang_df <- dummy_cols(soclang, 
                        select_columns = "Topic")

#check graphs for gpt35
eco35<-ggplot(soclang_df, aes(x=`Topic_Economics`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Economics")
fig35<-ggplot(soclang_df, aes(x=`Topic_Figurative-language`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Figurative-language")
gram35<-ggplot(soclang_df, aes(x=`Topic_Grammar`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Grammar")
punct35<-ggplot(soclang_df, aes(x=`Topic_Punctuation`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Punctuation")
ref35<-ggplot(soclang_df, aes(x=`Topic_Reference-skills`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Reference-skills")
write35<-ggplot(soclang_df, aes(x=`Topic_Writing-strategies`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Writing-strategies")
verbs35<-ggplot(soclang_df, aes(x=`Topic_Verbs`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Verbs")
words35<-ggplot(soclang_df, aes(x=`Number of Words`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Number of Words")

soclang35 <- arrangeGrob(
  eco35, gram35, fig35,
  punct35, ref35, write35,
  verbs35, words35, NULL,
  nrow = 3, ncol = 3
)


# Save the grob as a PNG file
ggsave("soclang35.png", soclang35, width = 20, height = 15)

#create model
soclangmodel35 <- glm(`Eval GPT-3.5` ~ `Number of Words` + 
                     `Topic_Economics` + 
                     `Topic_Grammar` +
                     `Topic_Figurative-language` +
                     `Topic_Punctuation` + `Topic_Writing-strategies`+
                     `Topic_Verbs`,
                   data = soclang_df, family = "binomial")

summary(soclangmodel35)

#same for gpt4
eco4<-ggplot(soclang_df, aes(x=`Topic_Economics`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Economics")
fig4<-ggplot(soclang_df, aes(x=`Topic_Figurative-language`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Figurative-language")
gram4<-ggplot(soclang_df, aes(x=`Topic_Grammar`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Grammar")
punct4<-ggplot(soclang_df, aes(x=`Topic_Punctuation`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Punctuation")
ref4<-ggplot(soclang_df, aes(x=`Topic_Reference-skills`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Reference-skills")
write4<-ggplot(soclang_df, aes(x=`Topic_Writing-strategies`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Writing-strategies")
verbs4<-ggplot(soclang_df, aes(x=`Topic_Verbs`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Verbs")
words4<-ggplot(soclang_df, aes(x=`Number of Words`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Number of Words")

soclang4 <- arrangeGrob(
  eco4, gram4, fig4,
  punct4, ref4, write4,
  verbs4, words4, NULL,
  nrow = 3, ncol = 3
)


# Save the grob as a PNG file
ggsave("soclang4.png", soclang4, width = 20, height = 15)

#create model
soclangmodel4 <- glm(`Eval GPT-4` ~ `Number of Words` + 
                        `Topic_Economics` + 
                        `Topic_Grammar` +
                        `Topic_Figurative-language` +
                        `Topic_Punctuation` + `Topic_Writing-strategies`+
                        `Topic_Verbs`,
                      data = soclang_df, family = "binomial")

summary(soclangmodel4)