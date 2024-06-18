library(readxl)
library(ggplot2)

comsen <- read_excel("C:/Users/Bia/OneDrive/Ambiente de Trabalho/TESE_2024/DATASETS TESE/DATASET_ANSWERS/ComSen/COMSEN_final_.xlsx")
View(comsen)

comsen_35_model <- glm(`Eval GPT-3.5` ~ `Number of Words`, data = comsen, family = "binomial")
summary(comsen_35_model)


ggplot(comsen, aes(x=`Number of Words`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
              ggtitle("GPT-3.5 vs Number of Words (CommonSenseQA)")

comsen_4_model <- glm(`Eval GPT-4` ~ `Number of Words`, data = comsen, family = "binomial")
summary(comsen_4_model)


ggplot(comsen, aes(x=`Number of Words`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
              ggtitle("GPT-4 vs Number of Words (CommonSenseQA)")

