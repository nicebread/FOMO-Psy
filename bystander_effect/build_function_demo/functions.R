library(ggplot2)

#' Calculate personal responsibility (PRP)
#'
#' @param NOPB Number of passive bystanders, a non-negative integer.
#' @param R Responsibility of the actor, a numeric value between 0 and 1, inclusive.
#' @param IPRP Individual personal responsibility between 0 and 1, inclusive; the baseline value of PRP when `NOPB` is zero (i.e., when one is alone).
#' @param alpha The strength of the bystander effect. Allowed values: alpha > 0. Alpha=1 is the "classical" 1/x bystander effect at R=0. Larger values indicate a stronger bystander effect (faster decay of PRP with increasing NOPB). Default is 1.
#' @param beta Numeric coefficient for the interaction of `R` and `NOPB`: How much is the decay effect reduced by R? Allowed values: 0 < beta < alpha. Default is 0.8.
#'
#' @return The calculated personal responsibility (PRP) as a numeric value or vector between 0 and 1.
#' @examples
#' get_PRP(NOPB = 2, R = 0.5, IPRP = 1)
#' 
get_PRP <- function(NOPB, R, IPRP, alpha=1, beta=0.8) {

  # testing all inputs if they are in the allowed range.

  inputs <- list(NOPB = NOPB, R = R, IPRP = IPRP, alpha = alpha, beta = beta)
  for (name in names(inputs)) {
    value <- inputs[[name]]
    if (!is.numeric(value) || is.complex(value) || length(value) == 0L ||
        any(!is.finite(value))) {
      stop(name, " must be a non-empty numeric value or vector with no missing or non-finite values.")
    }
  }
  if (any(NOPB < 0 | NOPB != floor(NOPB))) {
    stop("NOPB must contain non-negative integers.")
  }
  if (any(R < 0 | R > 1)) {
    stop("R must be between 0 and 1, inclusive.")
  }
  if (any(IPRP < 0 | IPRP > 1)) {
    stop("IPRP must be between 0 and 1, inclusive.")
  }
  if (any(alpha <= 0)) {
    stop("alpha must be greater than 0.")
  }
  if (any(beta <= 0) || any(beta >= alpha)) {
    stop("beta must be greater than 0 and less than alpha.")
  }

  # the actual function
  PRP <- IPRP / (1 + (alpha - beta*R)*NOPB)
  return(PRP)
}

## Simulate data

df <- expand.grid(
  NOPB     = seq(0, 20, by=1),
  IPRP     = c(.5, .75, 1),
  R        = c(0, 0.5, 1)
)

# compute the output variable
# (vectorized function application)
df$PRP <- get_PRP(
  NOPB = df$NOPB, 
  R = df$R,
  IPRP = df$IPRP
)

print(head(df, 20))


## Plot

ggplot(df, aes(x=NOPB, y=PRP, color=factor(IPRP), linetype=factor(R))) +
  geom_line(linewidth=1) +
  labs(
    title = "Personal Responsibility (PRP) as a function of Number of Passive Bystanders (NOPB)",
    x = "Number of Passive Bystanders (NOPB)",
    y = "Personal Responsibility (PRP)",
    color = "Individual Personal Responsibility (IPRP)",
    linetype = "Responsibility of Actor (R)"
  ) +
  theme_minimal() +
  scale_color_brewer(palette="Set1") +
  theme(legend.position="bottom")