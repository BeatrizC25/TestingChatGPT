library(readxl)
library(ggplot2)
library(fastDummies)
library(gridExtra)

medq <- read_excel("medq_final.xlsx")
View(medq)


# Create dummy variable
medq_df <- dummy_cols(medq, 
                      select_columns = "Subject")


#check graphs for gpt35
anaes35<-ggplot(medq_df, aes(x=`Subject_Anaesthesia`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Anaesthesia")
anat35<-ggplot(medq_df, aes(x=`Subject_Anatomy`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Anatomy")
bioc35<-ggplot(medq_df, aes(x=`Subject_Biochemistry`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Biochemistry")
dent35<-ggplot(medq_df, aes(x=Subject_Dental, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Dental")
ent35<-ggplot(medq_df, aes(x=`Subject_ENT`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs ENT")
for35<-ggplot(medq_df, aes(x=`Subject_Forensic Medicine`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Forensic Medicine")
gyn35<-ggplot(medq_df, aes(x=`Subject_Gynaecology & Obstetrics`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Gynaecology & Obstetrics")
med35<-ggplot(medq_df, aes(x=`Subject_Medicine`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Medicine")
micro35<-ggplot(medq_df, aes(x=`Subject_Microbiology`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Microbiology")
opth35<-ggplot(medq_df, aes(x=`Subject_Ophthalmology`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Ophthalmology")
orth35<-ggplot(medq_df, aes(x=`Subject_Orthopaedics`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Orthopaedics")
path35<-ggplot(medq_df, aes(x=`Subject_Pathology`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Pathology")
ped35<-ggplot(medq_df, aes(x=`Subject_Pediatrics`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Pediatrics")
pharm35<-ggplot(medq_df, aes(x=`Subject_Pharmacology`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Pharmacology")
physio35<-ggplot(medq_df, aes(x=`Subject_Physiology`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Physiology")
psych35<-ggplot(medq_df, aes(x=`Subject_Psychiatry`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Psychiatry")
rad35<-ggplot(medq_df, aes(x=`Subject_Radiology`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Radiology")
skin35<-ggplot(medq_df, aes(x=`Subject_Skin`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Skin")
surg35<-ggplot(medq_df, aes(x=`Subject_Surgery`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Surgery")
soc35<-ggplot(medq_df, aes(x=`Subject_Social & Preventive Medicine`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Social & Preventive Medicine")
words35<-ggplot(medq_df, aes(x=`Number of Words`, y=`Eval GPT-3.5`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-3.5 vs Number of Words")

med_35 <- arrangeGrob(
  anaes35, anat35, bioc35, dent35, 
  ent35, for35, gyn35, med35, 
  micro35, opth35,orth35, path35, 
  ped35, pharm35, physio35, psych35,
  rad35, skin35, soc35, surg35, 
  NULL, NULL, words35, NULL,
  
  nrow = 6, ncol = 4
)


# Save the grob as a PNG file
ggsave("med_35.png", med_35, width = 40, height = 45)

#create model
medmodel35 <- glm(`Eval GPT-3.5` ~ `Number of Words` + 
                  `Subject_Anaesthesia` +                
                  `Subject_Anatomy`+                 
                  `Subject_Biochemistry`+               
                  `Subject_Dental` +                    
                  `Subject_ENT` +                        
                  `Subject_Forensic Medicine`     +      
                  `Subject_Gynaecology & Obstetrics`+    
                  `Subject_Medicine` +                   
                  `Subject_Microbiology`   +             
                  `Subject_Ophthalmology` +              
                  `Subject_Orthopaedics`+                
                  `Subject_Pathology`+                   
                  `Subject_Pediatrics`  +                
                  `Subject_Pharmacology` +               
                  `Subject_Physiology` +                 
                  `Subject_Psychiatry` +                 
                  `Subject_Radiology`+                   
                  `Subject_Skin` +                        
                  `Subject_Social & Preventive Medicine`,
                   data = medq_df, family = "binomial")

summary(medmodel35)

#same for gpt4
anaes4<-ggplot(medq_df, aes(x=`Subject_Anaesthesia`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Anaesthesia")
anat4<-ggplot(medq_df, aes(x=`Subject_Anatomy`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Anatomy")
bioc4<-ggplot(medq_df, aes(x=`Subject_Biochemistry`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Biochemistry")
dent4<-ggplot(medq_df, aes(x=Subject_Dental, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Dental")
ent4<-ggplot(medq_df, aes(x=`Subject_ENT`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs ENT")
for4<-ggplot(medq_df, aes(x=`Subject_Forensic Medicine`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Forensic Medicine")
gyn4<-ggplot(medq_df, aes(x=`Subject_Gynaecology & Obstetrics`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Gynaecology & Obstetrics")
med4<-ggplot(medq_df, aes(x=`Subject_Medicine`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Medicine")
micro4<-ggplot(medq_df, aes(x=`Subject_Microbiology`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Microbiology")
opth4<-ggplot(medq_df, aes(x=`Subject_Ophthalmology`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Ophthalmology")
orth4<-ggplot(medq_df, aes(x=`Subject_Orthopaedics`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Orthopaedics")
path4<-ggplot(medq_df, aes(x=`Subject_Pathology`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Pathology")
ped4<-ggplot(medq_df, aes(x=`Subject_Pediatrics`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Pediatrics")
pharm4<-ggplot(medq_df, aes(x=`Subject_Pharmacology`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Pharmacology")
physio4<-ggplot(medq_df, aes(x=`Subject_Physiology`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Physiology")
psych4<-ggplot(medq_df, aes(x=`Subject_Psychiatry`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Psychiatry")
rad4<-ggplot(medq_df, aes(x=`Subject_Radiology`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Radiology")
skin4<-ggplot(medq_df, aes(x=`Subject_Skin`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Skin")
surg4<-ggplot(medq_df, aes(x=`Subject_Surgery`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Surgery")
soc4<-ggplot(medq_df, aes(x=`Subject_Social & Preventive Medicine`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Social & Preventive Medicine")
words4<-ggplot(medq_df, aes(x=`Number of Words`, y=`Eval GPT-4`)) + geom_point() +
  stat_smooth(method="glm", color="#00897B", se=FALSE, 
              method.args = list(family=binomial)) + 
  ggtitle("GPT-4 vs Number of Words")

med_4 <- arrangeGrob(
  anaes4, anat4, bioc4, dent4, 
  ent4, for4, gyn4, med4, 
  micro4, opth4,orth4, path4, 
  ped4, pharm4, physio4, psych4,
  rad4, skin4, soc4, surg4, 
  NULL, NULL, words4, NULL,
  
  nrow = 6, ncol = 4
)


# Save the grob as a PNG file
ggsave("med_4.png", med_4, width = 40, height = 45)

#create model
medmodel4 <- glm(`Eval GPT-4` ~ `Number of Words` + 
                    `Subject_Anaesthesia` +                
                    `Subject_Anatomy`+                 
                    `Subject_Biochemistry`+               
                    `Subject_Dental` +                    
                    `Subject_ENT` +                        
                    `Subject_Forensic Medicine`     +      
                    `Subject_Gynaecology & Obstetrics`+    
                    `Subject_Medicine` +                   
                    `Subject_Microbiology`   +             
                    `Subject_Ophthalmology` +              
                    `Subject_Orthopaedics`+                
                    `Subject_Pathology`+                   
                    `Subject_Pediatrics`  +                
                    `Subject_Pharmacology` +               
                    `Subject_Physiology` +                 
                    `Subject_Psychiatry` +                 
                    `Subject_Radiology`+                   
                    `Subject_Skin` +                        
                    `Subject_Social & Preventive Medicine`,
                  data = medq_df, family = "binomial")

summary(medmodel4)