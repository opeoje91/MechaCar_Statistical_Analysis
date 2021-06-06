library(dplyr)
#import csv file as a dataframe
mCar <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
#generate multiple linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mCar)
#generate summary statistics
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mCar)) 
#import csv file as a table
sus_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
#create summary table with the three columns
total_summary <- sus_table %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI), SD= sd(PSI), .groups = 'keep') 

lot_summary <- sus_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI), SD= sd(PSI), .groups = 'keep') 

#compare PSI versus population means
t.test((sus_table$PSI),mu=1500)

#sus_Lot1 <- sus_table %>% filter(Manufacturing_Lot=="Lot1") 
#sus_Lot2 <- sus_table %>% filter(Manufacturing_Lot=="Lot2")
#sus_Lot3 <- sus_table %>% filter(Manufacturing_Lot=="Lot3")#select only data points where the year is 1999

#t.test((sus_Lot1$PSI), (sus_Lot2$PSI),  mu=1500)
t.test((sus_table$PSI),mu=1500, subset=(sus_table$Manufacturing_Lot=="Lot1"))
t.test((sus_table$PSI),mu=1500, subset=(sus_table$Manufacturing_Lot=="Lot2"))
t.test((sus_table$PSI),mu=1500, subset=(sus_table$Manufacturing_Lot=="Lot3"))