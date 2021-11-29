library(dplyr)
# Delivarable 1
mecha_car <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
head(mecha_car)
lm(mpg ~ vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD, data=mecha_car)
summary(lm(mpg ~ vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD, data=mecha_car))
cor(mecha_car$vehicle_length, mecha_car$mpg)

# Simplen Linear Regression
lm(mpg ~ vehicle_length, data =mecha_car )
summary(lm(mpg ~ vehicle_length, data =mecha_car ))

#---------------------------------------------------
# Delivarable 2
suspension <- read.csv(file='Suspension_Coil.csv', check.names=F,stringsAsFactors = F)
head(suspension)
total_summary <- suspension %>% summarize(Mean = mean(PSI), Median = median(PSI), 
                                          Variance = var(PSI), SD = sd(PSI))
lot_summary <- suspension %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), 
                                                                        Variance = var(PSI), SD = sd(PSI))
#---------------------------------------------------
# Delivarable 3
sample_table <- suspension %>% sample_n(50)
t.test(sample_table$PSI, mu=1500)

#---------------------------
lot_1 <- subset(suspension, Manufacturing_Lot == "Lot1")
t.test(lot_1$PSI, mu=1500)

lot_2 <- subset(suspension, Manufacturing_Lot == "Lot2")
t.test(lot_2$PSI, mu=1500)

lot_3 <- subset(suspension, Manufacturing_Lot == "Lot3")
t.test(lot_3$PSI, mu=1500)
