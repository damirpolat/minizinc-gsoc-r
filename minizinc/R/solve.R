#' @title Solve models
#'
#' @description
#' This function is used to solve a given model. The function returns
#' solution in list format.
#'
#'
#' @param model \code{\link{Model}}
#'   Object of class Model.
#' @param solver
#'   Object of class Solver.
#'
#' @return list with results
#' @export
#' @examples
#' # Create and solve a Minizinc model
#' var1 = Variable$new(type = "int", kind = "decision", domain = c(0, 10))
#' var1 = Variable$new(type = "int", kind = "decision", domain = c(0, 5))
#'
#' constr = Constraint$new(constraint = "<", variables = c(var1, var2))
#'
#' model = Model$new(decision = c(var1, var2), constraints = c(constr),
#'                   objective = "satisfy")
#' solver = Solver$new(name = "gecode")
#'
#' res = solve(model, solver)
#' print(res)
solve = function(model, solver) {
  # perform type checking and assertions
  # different action depending on objective
  decision = model$decision

  if(!is.null(model$parameter)) {
    parameter = model$parameter
  } else {
    parameter = NULL
  }

  constraints = model$constraints
  obj = model$objective

  # create tmp file that contains minizinc code
  ret = file.create("tmp.mzn")
  if(!ret) {
    stop("Cannot create a file with Minizinc code. Check permissions.",
         call. = TRUE)
  }

  # build minizinc code from objects
  code = ""

  # add parameter variables
  if(!is.null(parameter)) {
    for(i in 1:length(parameter)) {
      code = sprintf("%s%s: %s = %s;\n", code, parameter[[i]]$type,
                     parameter[[i]]$get_name(), parameter[[i]]$value)
    }
  }

  # add definitions for decision variables
  for(i in 1:length(decision)) {
    code = sprintf("%svar %s..%s: %s;\n", code, decision[[i]]$domain[1],
                   decision[[i]]$domain[2], decision[[i]]$get_name())
  }

  # add constraints
  for(i in 1:length(constraints)) {
    code = sprintf("%sconstraint %s %s %s;\n", code,
                   constraints[[i]]$variables[[1]]$get_name(), constraints[[i]]$constraint,
                   constraints[[i]]$variables[[2]]$get_name())
  }

  write(code, file = "tmp.mzn", append = FALSE)

  # get minizinc path
  path = get_path()
  if(is.null(path)) {
    stop("Path to Minizinc is not set. Set path using set_path()", call. = TRUE)
  }
  cmd = sprintf("%s tmp.mzn -o tmp.out", path)
  cmd = sprintf("%s --solver %s", cmd, solver$name)
  cmd = sprintf("%s --output-mode json", cmd)
  system(cmd)
  retval = fromJSON(file = "tmp.out")

  return(retval)
}
