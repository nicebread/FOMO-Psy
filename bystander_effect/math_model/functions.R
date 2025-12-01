#' Compute perceived danger of intervention
#'
#' For simplicity, the agent perfectly perceives the objective danger,
#' which is on the same scale (identity function).
#'
#' @param DoI The objective danger of intervention
#' @return The perceived danger of intervention
#'
get_pDoI <- function(DoI) {
  DoI
}


#' Compute felt responsibility
#'
#' The base responsibility of "helping when alone" is divided by the
#' number of passive bystanders. The strength of the bystander effect
#' is modulated by the factor alpha, which is itself a function of
#' the perceived danger of intervention.
#'
#' @param baseResp The probability to help when one is alone.
#' @param NOPB The number of passive bystanders
#' @param alpha An attenuation/boost factor for the decline/steepness
#'              of the 1/x curve.
#'              Ranges from 0 to Inf, where 0=no bystander effect (BSE),
#'              1=classical BSE and values > 1 stronger-than-classical BSEs.
#' @param pDoI The perceived danger of intervention (ranging from 0..1)
#' @return The felt responsibility
#'
get_feltResp <- function(baseResp, NOPB, pDoI) {
  alpha <- (0.8 - pDoI*0.8)+0.2
  feltResp <- baseResp / (alpha*NOPB + 1)
  return(feltResp)
}


#' Compute observable helping behavior
#'
#' For simplicity, the felt responsibility (which is already scaled from 0 to 1)
#' is directly interpreted as a probability, which is converted to a
#' binary decision (help? yes/no) by a draw from a Bernoulli distribution.
#'
#' @param feltResp felt responsibility
#' @return Manifest (observable) helping behavior (yes/no)
#'
get_helpingBeh <- function(feltResp) {
  # the Bernoulli function is equivalent to rbinom with size=1
  rbinom(n=length(feltResp), size=1, prob=feltResp)
}


# ==============================================================================
#' Connect everything to a super-function of the psyche
#'
#' All atomic functions are combined into the psi-function:
#' This takes all external variables as input and returns the
#' observable helping behavior as output.
#' It also returns the internal variable "felt responsibility"
#' for monitoring.
#'
#' @param NOPB Number of passive bystanders
#' @param DoI Objective danger of intervention
#' @param baseResp Base probability to help when alone
#'
psi <- function(NOPB, DoI, baseResp) {
  # Compute the perceived danger of intervention
  pDoI <- get_pDoI(DoI)

  # Compute the felt responsibility
  feltResp <- get_feltResp(baseResp, NOPB, pDoI)

  # Get observable helping behavior
  helpingBeh <- get_helpingBeh(feltResp)

  return(list(helpingBeh = helpingBeh, feltResp = feltResp))
}
# ==============================================================================
