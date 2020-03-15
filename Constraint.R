#Constraint.R
#Damir Pulatov

Constraint = R6Class("Constraint", list(
  constraint       = NULL,
  variables        = NULL,
  initialize = function(constraint = NULL, variables = NULL) {
    self$constraint = constraint
    self$variables = variables
  }    
))