# Do some parameter optimization: Calibrate to empirical data
source("old_exponential_function.R")

# Empirical data
NOPB <- c(0, 1, 4)  # note: in the publication, they give the group size including the focal subject, i.e., 1, 2, 5
p_help <- c(0.85, 0.62, 0.31)

plot(NOPB, p_help, type = "p", xlab = "Number of passive bystanders", ylab = "p(help)", ylim=c(0, 1.1), xlim=c(0, 10), pch=4, col="red")


# Objective function to minimize (sum of squared errors)
# This function needs to have a par argument, which is a vector of the unknown
# (to be optimized) parameters. Additional parameters (such as the empirical
# values) can be passed as additional arguments.
objective_function <- function(params) {
  y_0 <- params[1]
  y_final <- params[2]
  BSE_strength <- params[3]
  
  # Predicted p_help values based on current parameters
  predicted_p_help <- get_p_help(NOPB, y_0, y_final, BSE_strength)
  
  # Sum of squared errors between predicted and empirical p_help
  SSE <- sum((p_help - predicted_p_help)^2)
  return(SSE)
}

# Initial guesses for the parameters
initial_params <- c(y_0 = 0.9, y_final = 0.1, BSE_strength = 0.1)

# Parameter bounds (since probabilities are between 0 and 1)
lower_bounds <- c(0, 0, 0)
upper_bounds <- c(1, 1, Inf)

# Use optim to find the best-fitting parameters
# The L-BFGS-B optimizer allows to define boundaries for the parameters
optim_result <- optim(
  par = initial_params,
  fn = objective_function,
  method = "L-BFGS-B",
  lower = lower_bounds,
  upper = upper_bounds
)

optim_result

# Extract optimized parameters
optimized_params <- optim_result$par

# Display the optimized parameters
print(optimized_params)

# plot the optimized function

x <- seq(0, 10, 1)
y <- get_p_help(NOPB = x, y_0 = 0.85, y_final = 0.19, BSE_strength = 0.43)
plot(NOPB, p_help, type = "p", xlab = "Number of passive bystanders", ylab = "p(help)", ylim=c(0, 1.1), xlim=c(0, 10), pch=4, col="red")
lines(x, y, type = "l", xlab = "Number of passive bystanders", ylab = "p(help)", ylim=c(0, 1.1))


# add the 1/x function suggested by the original theory (assuming that the felt responsibility is directly translated into a prob(help))
# Calculate the 1/x function (adjusted to avoid division by zero)
y2 <- 1 / (x + 1)  # Shift x by 1 to avoid x = 0

# Add the 1/x curve to the plot
lines(x, y2, col = "blue", lty = 2)

# Add a legend to distinguish between the curves
legend("topright", legend = c("Exponential, fitted function", "Empirical Data", "1/(x+1)"),
       col = c("black", "red", "blue"), lty = c(1, NA, 2), pch = c(NA, 4, NA))

