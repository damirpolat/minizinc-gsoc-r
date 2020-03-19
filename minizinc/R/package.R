#' R Interface to Minizinc
#'
#' The goal of this package is to bring the power of Minizinc constraint
#' modeling language to R users in a way that does not require any
#' knowledge of Minizinc.
#' Users can describe their constraint optimization problems in R objects.
#' The package then converts these problems to Minizinc language.
#' The results are parsed back into R objects. This way users
#' still have the access to all features and constraints provided by
#' Minizinc as well as low-level solvers without knowing anything
#' about lower-level details.
#'
#' @docType package
#' @name minizinc
NULL

# package level environment
.globals = env()
.globals$minizinc_path = NULL
.globals$types = c("int", "float", "bool", "string")
.globals$kinds = c("parameter", "decision")
.globals$constraints = c("==", "!=", "<", ">", ">=", "<=")
.globals$objectives = c("satisfy", "maximize", "minimize")
