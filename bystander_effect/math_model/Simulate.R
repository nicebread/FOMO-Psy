# Simulate virtual experiments from the model.
# We assume that the model is the true data generating model.
# As it is a deterministic model, each virtual participant
# will have the same response. Variability comes into the experiment by:
# (a) Different starting values for the baseResp
# (b) Randomness when the actual helping behavior is only
#     shown with a certain probability.

library(ggplot2)
library(dplyr)
source("functions.R")

n_per_group <- 20

# experimental design
df <- expand.grid(
  id = 1:n_per_group,
  NOPB = c(0, 1, 4),
  DoI = c(0.2, 0.8)
)

# interindividual variability in exogenous variables ("personality")
df$baseResp = rbeta(nrow(df), shape1=13, shape2=4)

df$helpingBeh <- psi(NOPB = df$NOPB, DoI = df$DoI, baseResp = df$baseResp)$helpingBeh

#View(df)

table(help=df$helpingBeh, NOPB=df$NOPB, DoI=df$DoI) |> prop.table(margin=c("DoI", "NOPB")) |> round(2)

# visualize
ggplot(df, aes(x = factor(NOPB), y = helpingBeh, fill = factor(DoI))) +
  stat_summary(
    fun = mean, geom = "bar",
    position = position_dodge(width = 0.9)
  ) +
  labs(x = "Number of passive bystanders", y = "p(help)", fill="Dangerousness\nof intervention") +
  theme_minimal()


# statistical analysis of the data: Do we find the expected 2-way interaction?
#------------------------------------------------

t1 <- glm(helpingBeh ~ NOPB * DoI, data = df, family = binomial)
summary(t1)

