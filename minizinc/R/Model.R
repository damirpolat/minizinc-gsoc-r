#' @title Model Class
#'

Model = R6Class("Model", list(
  parameter     = NULL,
  decision      = NULL,
  constraints   = NULL,
  objective     = NULL,
  #' @export
  initialize = function(parameter = NULL, decision = NULL, constraints = NULL,
                        objective = NULL) {
    self$parameter = parameter
    self$decision = decision
    self$constraints = constraints
    self$objective = objective
  }
))
