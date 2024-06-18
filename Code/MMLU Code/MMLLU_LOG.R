library(readxl)
library(ggplot2)
library(fastDummies)
library(gridExtra)

mmlu <- read_excel("MMLU_final.xlsx")
View(mmlu)

# Create dummy variable
mmlu_df <- dummy_cols(mmlu, 
                        select_columns = "Subject")

#check graphs for gpt35
hist35<-ggplot(mmlu_df, aes(x=`Subject_History`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs History")
law35<-ggplot(mmlu_df, aes(x=`Subject_Law`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Law")
log35<-ggplot(mmlu_df, aes(x=`Subject_Logic`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Logic")
phil35<-ggplot(mmlu_df, aes(x=`Subject_Philosophy`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Philosophy")
psysoc35<-ggplot(mmlu_df, aes(x=`Subject_Psychology/Sociology`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Psychology/Sociology")
words35<-ggplot(mmlu_df, aes(x=`Number of Words`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Number of Words")


mmlu35 <- arrangeGrob(
  hist35, law35, log35,
  phil35, psysoc35, words35,
  nrow = 2, ncol = 3
)

# Save the grob as a PNG file
ggsave("mmlu35.png", mmlu35, width = 15, height = 10)

#create model
mmlumodel35 <- glm(`Eval GPT-3.5` ~ `Number of Words` + 
                     `Subject_History` + 
                     `Subject_Law` +
                     `Subject_Logic` +
                     `Subject_Philosophy`,
                   data = mmlu_df, family = "binomial")

summary(mmlumodel35)

#same for 4
hist4<-ggplot(mmlu_df, aes(x=`Subject_History`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs History")
law4<-ggplot(mmlu_df, aes(x=`Subject_Law`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Law")
log4<-ggplot(mmlu_df, aes(x=`Subject_Logic`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Logic")
phil4<-ggplot(mmlu_df, aes(x=`Subject_Philosophy`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Philosophy")
psysoc4<-ggplot(mmlu_df, aes(x=`Subject_Psychology/Sociology`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Psychology/Sociology")
words4<-ggplot(mmlu_df, aes(x=`Number of Words`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Number of Words")


mmlu4 <- arrangeGrob(
  hist4, law4, log4,
  phil4, psysoc4, words4,
  nrow = 2, ncol = 3
)

# Save the grob as a PNG file
ggsave("mmlu4.png", mmlu4, width = 15, height = 10)

#create model
mmlumodel4 <- glm(`Eval GPT-4` ~ `Number of Words` + 
                     `Subject_History` + 
                     `Subject_Law` +
                     `Subject_Logic` +
                     `Subject_Philosophy`,
                   data = mmlu_df, family = "binomial")

summary(mmlumodel4)