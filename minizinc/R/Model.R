#Model.R
#Damir Pulatov

Model = R6Class("Model", list(
  variables     = NULL,
  constraints   = NULL,
  solver        = "gecode",
  objective     = NULL,
  initialize = function(variables = NULL, constraints = NULL, solver = NULL, 
                        objective = NULL) {
    self$variables = variables
    self$constraints = constraints
    self$solver = solver
    self$objective = objective
  }    
  solve = function() {
   #different action depending on objective 
  }
))