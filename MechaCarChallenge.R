# working directory
setwd("~/R_Analysis/01_Demo")

# dependencies
library(dplyr)
library(tidyr)
library(ggplot2)

# Deliverable 1

# Import csv as dataframe
MechaCar <- read.csv(file="MechaCar_mpg.csv", check.names = F, stringsAsFactors = F)



# Perform Linear regression using lm() function

predmpg <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechaCar)

# summary function
summary(predmpg)

ggplot(MechaCar, aes(x = vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, y = mpg)) +
  geom_point() +
  stat_smooth(method = "lm", col = "red")

# Deliverable 2

# Import csv as dataframe
Suspension <- read.csv(file="Suspension_Coil.csv", check.names = F, stringsAsFactors = F)

# Total summary dataframe
total_summary <- Suspension %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

lot_summary <- Suspension %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

# Deliverable 3

# t.test() function to determine PSI across lots
t.test(Suspension$PSI,mu=1500)

# 3 more t.test() for lots
# Lot 1
t.test(subset(Suspension,Manufacturing_Lot=="Lot1")$PSI,mu=1500)
# Lot 2
t.test(subset(Suspension,Manufacturing_Lot=="Lot2")$PSI,mu=1500)
# Lot 3
t.test(subset(Suspension,Manufacturing_Lot=="Lot3")$PSI,mu=1500)
