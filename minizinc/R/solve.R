#' @title Solve models
#' 
#' @description 
#' This function is used to solve a given model. 
#' 
#' @param model [\code{Model}]\cr
#'   Model that contains variables, constraints and objective. 
#' @param 
#'   Solver object that specifies both solver and its configuration. Default is gecode. 
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
  code = sprintf("%s: %s = %s;\n", parameter[[1]]$type, parameter[[1]]$name, 
                parameter[[1]]$value)
  code = sprintf("%svar %s..%s: %s;\n", code, decision[[1]]$domain[1], 
                 decision[[1]]$domain[2], decision[[1]]$name)
  code = sprintf("%svar %s..%s: %s;\n", code, decision[[2]]$domain[1], 
                 decision[[2]]$domain[2], decision[[2]]$name)
  code = sprintf("%sconstraint %s %s %s;\n", code, constraints[[1]]$variables[[1]]$name, 
                 constraints[[1]]$constraint, constraints[[1]]$variables[[2]]$name)
  
  
  #code = sprintf(code, "var ", decision[[1]]$domain[1], "..", decision[[1]]$domain[2], 
  #             ": v1;\n", sep = "")
  #code = paste(code, "var ", decision[[2]]$domain[1], "..", decision[[2]]$domain[2], 
  #             ": v2;\n", sep = "")
  
  #add constraint
  #code = paste(code, "constraint ", constraints[[1]]$variables[[1]]$name, 
  #             " ", constraints[[1]]$)
  write(code, file = "tmp.mzn", append = FALSE)
  
  cmd = paste("/home/damir/software/MiniZincIDE-2.4.2-bundle-linux/bin/minizinc tmp.mzn -o tmp.out", sep = " ")
  cmd = paste(cmd, "--output-mode json", sep = " ")
  system(cmd)
  retval = fromJSON(file = "tmp.out")
  
  return(retval)
}