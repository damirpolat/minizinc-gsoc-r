#' @title Variable Class
#'
#' @description
#' Variable is a class to describe both parameter and decision variables.
#' It contains information that is needed to define a Minizinc variable, such as
#' type (int, bool, float, etc), kind (decision, parameter), value, domain.
#'
#' @export
#'

Variable = R6Class("Variable", list(
  #' @field type
  #' Type of variable (int, float, bool, etc.).
  type       = NULL,

  #' @field kind
  #' Kind of variable (parameter, decision).
  kind       = NULL,

  #' @field value
  #' Value assigned to this variable. Value is only meaningful for
  #' parameter variables.
  value      = NULL,

  #' @field domain
  #' Domain of valid values for a decision variable. Domain is only
  #' meaningful for decision variables.
  domain     = NULL,

  #' @field name
  #' Name of variable as it will appear in Minizinc.
  name       = NULL,
  static     = env(parameter = 0,
                   decision = 0),

  #' @section Construction:
  #'
  #' ```
  #' v = Variable$new(type, kind, value, domain)
  #' ```
  #'
  #' * `type` :: `character(1)`\cr
  #' Type of the variable.
  #'
  #' * `kind` :: `character(1)`\cr
  #' Variable kind.
  #'
  #' * `kind` :: `character(1)`\cr
  #' Value of the variable.
  #'
  #' * `domain` :: `list(1)`\cr
  #' Variable domain.
  #'
  #' Creates a new instance of this [R6][R6::R6Class] class.
  initialize = function(type, kind, value = NULL, domain = NULL) {
    self$type      = type
    self$kind      = kind
    if(kind == "parameter" && !is.null(value)) {
      self$value = value
    }
    if(kind == "decision" && !is.null(domain)) {
      self$domain = domain
    }

    #update variable name counts
    if(self$kind == "parameter") {
      self$static$parameter = self$static$parameter + 1
      self$name = paste("p", self$static$parameter, sep = "")
    }
    if(self$kind == "decision") {
      self$static$decision = self$static$decision + 1
      self$name = paste("d", self$static$decision, sep = "")
    }
  }
))
