library(readxl)
library(ggplot2)
library(fastDummies)
library(gridExtra)

sciq <- read_excel("SCIQ_FINAL.xlsx")
View(sciq)

# Create dummy variables
sciq_df_all <- dummy_cols(sciq, 
                        select_columns = "Sub-Branch")

sciq_df <- dummy_cols(sciq, 
                      select_columns = "Main Branch")


#check graphs for gpt35
bio35<-ggplot(sciq_df, aes(x=`Main Branch_Biology`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Biology")
chem35<-ggplot(sciq_df, aes(x=`Main Branch_Chemistry`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Chemistry")
earth35<-ggplot(sciq_df, aes(x=`Main Branch_Earth Sciences`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Earth Sciences")
envi35<-ggplot(sciq_df, aes(x=`Main Branch_Environmental Science`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Environmental Science")
phys35<-ggplot(sciq_df, aes(x=`Main Branch_Physics`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Physics")
words35<-ggplot(sciq_df, aes(x=`Number of Words`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Number of Words")

sciq35 <- arrangeGrob(
  bio35, chem35, earth35,
  envi35, phys35, words35,
  nrow = 2, ncol = 3
)

# Save the grob as a PNG file
ggsave("sciq35.png", sciq35, width = 20, height = 15)

#create model
sciqmodel35 <- glm(`Eval GPT-3.5` ~ `Number of Words` + 
                     `Main Branch_Biology` + 
                     `Main Branch_Chemistry` +
                     `Main Branch_Earth Sciences` +
                     `Main Branch_Physics`,
                   data = sciq_df, family = "binomial")

summary(sciqmodel35)

#same for 4
bio4<-ggplot(sciq_df, aes(x=`Main Branch_Biology`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Biology")
chem4<-ggplot(sciq_df, aes(x=`Main Branch_Chemistry`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Chemistry")
earth4<-ggplot(sciq_df, aes(x=`Main Branch_Earth Sciences`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Earth Sciences")
envi4<-ggplot(sciq_df, aes(x=`Main Branch_Environmental Science`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Environmental Science")
phys4<-ggplot(sciq_df, aes(x=`Main Branch_Physics`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Physics")
words4<-ggplot(sciq_df, aes(x=`Number of Words`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Number of Words")

sciq4 <- arrangeGrob(
  bio4, chem4, earth4,
  envi4, phys4, words4,
  nrow = 2, ncol = 3
)

# Save the grob as a PNG file
ggsave("sciq4.png", sciq4, width = 20, height = 15)

#create model
sciqmodel4 <- glm(`Eval GPT-4` ~ `Number of Words` + 
                     `Main Branch_Biology` + 
                     `Main Branch_Chemistry` +
                     `Main Branch_Earth Sciences` +
                     `Main Branch_Physics`,
                   data = sciq_df, family = "binomial")

summary(sciqmodel4)

