# ----------------
# DELIVERABLE ONE 
# ----------------

# load the "dplyr" package
library(dplyr)

# Import and read in the MechaCar_mpg.csv file as a dataframe

MechaCar <- read.csv(file="MechaCar_mpg.csv", check.names = F, stringsAsFactors = F)

# Perform linear regression

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar)

# Summary p-value and r-squared value for the linear regression model

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD ,data=MechaCar))


# ----------------
# DELIVERABLE TWO 
# ----------------

# Import and read in the Suspension_Coil.csv file as a dataframe

Suspension_Coil <- read.csv(file="Suspension_Coil.csv", check.names = F, stringsAsFactors = F)

# summary: mean, median, variance and standard deviation of the PSI column 

total_summary <- Suspension_Coil %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')

# Grouping manufacturing lots by the mean, median, variance and standard deviation of PSI column

lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI),Median = median(PSI), Variance = var(PSI), SD = sd(PSI) , .groups = 'keep')



# -----------------
# DELIVERABLE THREE 
# -----------------

# t-test for all the lots, pop mu = 1500 psi

t.test(Suspension_Coil$PSI,mu=mean(Suspension_Coil$PSI))

# t-test for lot 1

t.test(subset(Suspension_Coil$PSI,Suspension_Coil$Manufacturing_Lot == "Lot1"),mu=mean(Suspension_Coil$PSI))

# t-test for lot 2

t.test(subset(Suspension_Coil$PSI,Suspension_Coil$Manufacturing_Lot == "Lot2"),mu=mean(Suspension_Coil$PSI))

# t-test for lot 3

t.test(subset(Suspension_Coil$PSI,Suspension_Coil$Manufacturing_Lot == "Lot3"),mu=mean(Suspension_Coil$PSI))
