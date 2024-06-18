library(readxl)
library(ggplot2)
library(fastDummies)
library(gridExtra)

mathqa <- read_excel("MTHQA_FINAL.xlsx")
View(mathqa)


# Create dummy variable
mathqa_df <- dummy_cols(mathqa, 
                   select_columns = "Sub-Branch")


#check graphs for gpt35
gain35<-ggplot(mathqa_df, aes(x=`Sub-Branch_Gain`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Gain")
general35<-ggplot(mathqa_df, aes(x=`Sub-Branch_General`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs General")
geo35<-ggplot(mathqa_df, aes(x=`Sub-Branch_Geometry`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Geometry")
other35<-ggplot(mathqa_df, aes(x=`Sub-Branch_Other`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Other")
phys35<-ggplot(mathqa_df, aes(x=`Sub-Branch_Physics`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Physics")
prob35<-ggplot(mathqa_df, aes(x=`Sub-Branch_Probability`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Probability")
words35<-ggplot(mathqa_df, aes(x=`Number of Words`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Number of Words")

math35 <- arrangeGrob(
  gain35, general35, geo35,
  other35, phys35, prob35,
  NULL, words35, NULL,
  nrow = 3, ncol = 3
)


# Save the grob as a PNG file
ggsave("math35.png", math35, width = 20, height = 15)

#create model
mathmodel35 <- glm(`Eval GPT-3.5` ~ `Number of Words` + 
                `Sub-Branch_Gain` + 
                `Sub-Branch_General` +
                `Sub-Branch_Geometry` +
                `Sub-Branch_Other`+
                `Sub-Branch_Physics`,
                data = mathqa_df, family = "binomial")

summary(mathmodel35)

#same for gpt4
gain4<-ggplot(mathqa_df, aes(x=`Sub-Branch_Gain`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Gain")
general4<-ggplot(mathqa_df, aes(x=`Sub-Branch_General`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs General")
geo4<-ggplot(mathqa_df, aes(x=`Sub-Branch_Geometry`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Geometry")
other4<-ggplot(mathqa_df, aes(x=`Sub-Branch_Other`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Other")
phys4<-ggplot(mathqa_df, aes(x=`Sub-Branch_Physics`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Physics")
prob4<-ggplot(mathqa_df, aes(x=`Sub-Branch_Probability`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Probability")
words4<-ggplot(mathqa_df, aes(x=`Number of Words`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Number of Words")

math4 <- arrangeGrob(
  gain4, general4, geo4,
  other4, phys4, prob4,
  NULL, words4, NULL,
  nrow = 3, ncol = 3
)


# Save the grob as a PNG file
ggsave("math4.png", math4, width = 20, height = 15)

#create model
mathmodel4 <- glm(`Eval GPT-4` ~ `Number of Words` + 
                     `Sub-Branch_Gain` + 
                     `Sub-Branch_General` +
                     `Sub-Branch_Geometry` +
                     `Sub-Branch_Other`+
                     `Sub-Branch_Physics`,
                   data = mathqa_df, family = "binomial")

summary(mathmodel4)

