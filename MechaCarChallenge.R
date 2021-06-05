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
