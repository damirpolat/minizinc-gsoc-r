#' @description
#' The goal of this package is to bring the power of Minizinc constraint
#' modeling language to R users in a way that does not require any
#' knowledge of Minizinc.
#' Users can describe their constraint optimization problems in R objects.
#' The package then converts these problems to Minizinc language.
#' The results are parsed back into R objects. This way users
#' still have the access to all features and constraints provided by
#' Minizinc as well as low-level solvers without knowing anything
#' about lower-level details.
#' @importFrom R6 R6Class
#' @importFrom rlang env
#' @importFrom rjson fromJSON
#' @import checkmate
"_PACKAGE"
