source("functions.R")

# ==============================================================================
# Testing the functions

# Note: As the helping behavior is probabilistic, repeated calls of this
# function will yield different results!
psi(NOPB = 1, DoI = 1, baseResp = 0.8)

psi(NOPB = 0, DoI = c(0, 0.5, 1), baseResp = 0.8)

# vectorized version
psi(NOPB = 1:3, DoI = c(1, 0.5, 0), baseResp = 0.8)



# Plot the get_feltResp function
# get_feltResp <- function(baseResp, NOPB, pDoI)
#------------------

# define the levels that should be plotted
plot_data <- expand.grid(
  baseResp = c(0.7, 0.8, 0.9),
  NOPB = 0:20,
  pDoI = c(0, 0.5, 1)
)

# nicer labels for facet
plot_data$baseResp_label <- paste("Base resp.:", plot_data$baseResp)

# compute outcome variable
plot_data$feltResp <- get_feltResp(
  baseResp = plot_data$baseResp,
  NOPB = plot_data$NOPB,
  pDoI = plot_data$pDoI
)

ggplot(plot_data, aes(x=NOPB, y=feltResp, color=factor(pDoI))) +
  geom_line() +
  facet_grid(~ baseResp_label) +
  labs(
    x="Number of passive bystanders",
    y="Felt Responsibility",
    color="Dangerousness\nof Intervention"
  ) +
  scale_y_continuous(limits=c(0, 1)) +
  theme_bw()



ggplot(plot_data, aes(x=NOPB, y=feltResp, color=factor(baseResp))) +
  geom_line() +
  facet_grid(~ pDoI_label) +
  labs(
    x="Number of passive bystanders",
    y="Felt Responsibility",
    color="Base responsibility"
  ) +
  scale_y_continuous(limits=c(0, 1)) +
  theme_bw()
