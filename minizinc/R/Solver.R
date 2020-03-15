#Solver.R
#Damir Pulatov

Solver = R6Class("Solver", list(
  name          = NULL,
  config        = NULL,
  initialize = function(name = NULL, config = NULL) {
    self$name = name
    self$config = config
  }    
))