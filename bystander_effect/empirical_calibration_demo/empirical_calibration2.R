#' Use the data from the meta-analysis to calibrate the model

library(rio)
library(ggplot2)
ma_dat <- import("raw_data/meta-analysis-data.xlsx", skip=3)

ma_dat$n_confederates <- as.numeric(ma_dat$n_confederates)

# Probability to help if alone
M_alone <- mean(ma_dat$prop_alone_helping)
hist(
  ma_dat$prop_alone_helping, 
  main=paste0("Probability to help if alone (M=", round(M_alone, 2), ")"), 
  xlab="Probability", ylab="Frequency")
abline(v=M_alone, col="red")

# Probability to help in group
plot(
  x = ma_dat$n_confederates,
  y = ma_dat$prop_group_helping,
  main="Probability to help in group", 
  xlab="Number of confederates", ylab="Individual prob to help")
abline(v=M_alone, col="red")


ggplot(ma_dat, aes(x=n_confederates, y = prop_group_helping)) + geom_point() +
  geom_smooth()


tapply(ma_dat$prop_group_helping, ma_dat$n_confederates, mean)

# OK, this does not follow the theory at all ...


# The task has a baseline probability of helping - sometimes it's easier to help, sometimes it's harder. There is a correlation: When p(help_alone) is higher, also p(help_group) is higher:

# ggplot2 variant:
ggplot(ma_dat, aes(x=prop_alone_helping, y=prop_group_helping)) +
  geom_point() + 
  ggtitle("Probability to help in group") + 
  xlab("Prob(help alone)") +
  ylab("Prob(help in group)") + 
  geom_smooth(method="lm")

cor.test(ma_dat$prop_alone_helping, ma_dat$prop_group_helping)



# Therefore, let's control for the respective probability to help if alone

# The intercept is the predicted value when all other predictors are 0
# Center prop_alone_helping to 0.8 as a reference value
ma_dat$prop_alone_helping.c <- ma_dat$prop_alone_helping - 0.8
l1 <- lm(prop_group_helping ~ prop_alone_helping.c, data=ma_dat)
summary(l1)

# Create the predicted values of prop_group_helping, holding the probability to help constant at 0.8
ma_dat$prop_group_helping.norm <- predict(l1, na.action=na.exclude)

tapply(ma_dat$prop_group_helping.norm, ma_dat$n_confederates, mean)



l2 <- lm(prop_group_helping.norm ~ n_confederates, data=ma_dat)
summary(l2)
