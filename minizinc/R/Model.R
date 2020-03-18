#' @title Model Class
#'
#' @description
#' Model is a class to describe a Minizinc model.
#' It contains information that is needed to define a Minizinc model, such as
#' a list of variables, constraints and model objective (e.g. satisfy).
#'
#' @export
#' @examples
#' # Create variables, constraints and put them in a model
#' v1 = Variable$new(type = "int", kind = "decision", domain = c(0, 10))
#' v2 = Variable$new(type = "int", kind = "decision", domain = c(0, 5))
#'
#' constr = Constraint$new(constraint = "<", variables = c(v1, v2))
#'
#' model = Model$new(decision = c(v1, v2), constraints = c(constr),
#'                   objective = "satisfy")
#' model$decision
#' model$constraints
Model = R6Class("Model",
  public = list(
    #' @field parameter
    #' A list of parameter \code{\link{Variable}} objects.
    parameter = NULL,

    #' @field decision
    #' A list of decision \code{\link{Variable}} objects.
    decision = NULL,

    #' @field constraints
    #' A list of \code{\link{Constraint}} objects.
    constraints = NULL,

    #' @field objective
    #' Model objective, which can be either of satisfy, maximize or minimize.
    objective = NULL,

    #' @description
    #' Creates a new instance of Model class.
    #' @param parameter
    #' @param decision
    #' @param constraints
    #' @param objective
    initialize = function(parameter = NULL, decision = NULL, constraints = NULL,
                          objective = NULL) {
      self$parameter = parameter
      self$decision = decision
      self$constraints = constraints
      self$objective = objective
    }
  )
)
