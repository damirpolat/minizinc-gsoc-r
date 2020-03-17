#' @title Variable Class
#'
#' @description
#' Variable is a class to describe both parameter and decision variables.
#' It contains information that is needed to define a Minizinc variable, such as
#' type (int, bool, float, etc), kind (decision, parameter), value, domain.
#'
#' @export
#'

Variable = R6Class("Variable",
  public = list(
    #' @field type
    #' Type of variable (int, float, bool, etc.).
    type = NULL,

    #' @field kind
    #' Kind of variable (parameter, decision).
    kind = NULL,

    #' @field value
    #' Value assigned to this variable. Value is only meaningful for
    #' parameter variables.
    value = NULL,

    #' @field domain
    #' Domain of valid values for a decision variable. Domain is only
    #' meaningful for decision variables.
    domain = NULL,

    #' @description
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

      # update variable name counts
      if(self$kind == "parameter") {
        private$.static$parameter = private$.static$parameter + 1
        private$.name = paste("p", private$.static$parameter, sep = "")
      }
      if(self$kind == "decision") {
        private$.static$decision = private$.static$decision + 1
        private$.name = paste("d", private$.static$decision, sep = "")
      }
    },

    #' @description
    #' Returns variable name that is used in Minizinc model.
    get_name = function() {
      return(private$.name)
    }
  ),

  private = list(
    #' @field name
    #' Variable character name for internal use within Minizinc model.
    .name = NULL,

    .static = env(parameter = 0, decision = 0)
  )
)
