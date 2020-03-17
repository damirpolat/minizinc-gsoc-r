#' @title Solver Class
#'
#' @description
#' Solver is a class to describe a Minizinc solver.
#' It contains information that is needed to define a Minizinc solver, such as
#' a name of the solver and its configuration.
#'
#' @export
#' @examples
#' # Create a solver object
#' s = Solver$new(name = "gecode")
#' s$name
#' s$config
Solver = R6Class("Solver",
  public = list(
    #' @field name
    #' A character name of solver. Default is "gecode".
    name  = "gecode",

    #' @field config
    #' A list of configuration passed to Minizinc solver.
    config = NULL,

    #' @description
    #' Creates a new instance of Solver class.
    #' @param name
    #' @param config
    initialize = function(name = NULL, config = NULL) {
      self$name = name
      self$config = config
    }
  )
)
