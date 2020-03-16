#' @title Solve models
#'
#' @description
#' This function is used to solve a given model.
#'
#' @param model [\code{Model}]\cr
#'   Model that contains variables, constraints and objective.
#' @param solver
#'   Solver object that specifies both solver and its configuration.
#'
#' @return data.frame object with results
#' @export

solve = function(model, solver = "gecode") {
  #perform type checking and assertions
  #different action depending on objective
  decision = model$decision
  parameter = model$parameter
  constraints = model$constraints
  obj = model$objective

  #create tmp file that contains minizinc code
  ret = file.create("tmp.mzn")
  if(!ret) {
    message("Error. I'll add exception later")
  }

  #build minizinc code from objects
  code = ""

  #add parameter variables
  for(i in 1:length(parameter)) {
    code = sprintf("%s%s: %s = %s;\n", code, parameter[[i]]$type, parameter[[i]]$name,
                   parameter[[i]]$value)
  }

  #add definitions for decision variables
  for(i in 1:length(decision)) {
    code = sprintf("%svar %s..%s: %s;\n", code, decision[[i]]$domain[1],
                   decision[[i]]$domain[2], decision[[i]]$name)
  }

  #add constraints
  for(i in 1:length(constraints)) {
    code = sprintf("%sconstraint %s %s %s;\n", code, constraints[[i]]$variables[[1]]$name,
                   constraints[[1]]$constraint, constraints[[i]]$variables[[2]]$name)
  }

  write(code, file = "tmp.mzn", append = FALSE)

  #get minizinc path
  path = get_path()
  cmd = sprintf("%s tmp.mzn -o tmp.out", path)
  cmd = paste(cmd, "--output-mode json", sep = " ")
  system(cmd)
  retval = fromJSON(file = "tmp.out")

  return(retval)
}
