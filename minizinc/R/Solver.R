#' @title Solver Class
#'

Solver = R6Class("Solver", list(
  name          = NULL,
  config        = NULL,
  #' @export
  initialize = function(name = NULL, config = NULL) {
    self$name = name
    self$config = config
  }
))
