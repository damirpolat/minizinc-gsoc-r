#' @title Constraint Class
#'
#' @description
#' Constraint is a class to describe Minizinc constraints on variables.
#' It contains information that is needed to define a Minizinc constraint, such as
#' type of constraint (==, >, etc.) and variables involved in a given constraint.
#'
#' @export
#'

Constraint = R6Class("Constraint",
  public = list(
    #' @field constraint
    #' Constraints specify the Boolean expressions that the decision variables
    #' must satisfy to be a valid solution to the model.
    #' For now, only relational operators are supported:
    #' ==, !=, <, >, <=, >=.
    #'
    #' Taken from Minizinc documentation.
    constraint = NULL,

    #' @field variables
    #' A list of objects of
    #' \code{\link{Variable}} class.
    variables = NULL,

    #' @description
    #' Creates a new instance of this [R6][R6::R6Class] class.
    #' @param constraint
    #' @param variables
    initialize = function(constraint = NULL, variables = NULL) {
      self$constraint = constraint
      self$variables = variables
      private$.static$constraint = private$.static$constraint + 1
      private$.name = paste("c", private$.static$constraint, sep = "")
    },

    #' @description
    #' Returns constraint name that is used in Minizinc
    get_name = function() {
      return(private$.name)
    }
  ),

  private = list(
    #' @field name
    #' Constraint character name for internal use within Minizinc model.
    .static = env(constraint = 0),

    .name = NULL
  )

)
