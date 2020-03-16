#' @title Constraint Class
#'

Constraint = R6Class("Constraint", list(
  constraint       = NULL,
  variables        = NULL,
  name             = NULL,
  static           = env(constraint = 0),
  #' @export
  initialize = function(constraint = NULL, variables = NULL) {
    self$constraint = constraint
    self$variables = variables
    self$static$constraint = self$static$constraint + 1
    self$name = paste("c", self$static$constraint, sep = "")
  }
))
