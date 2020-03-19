#' @title Set Minizinc path
#'
#' @description
#' Provide path to Minizinc installation.
#'
#' @param path Path to Minizinc executable
#'
#' @export
set_path = function(path) {
  .globals$minizinc_path = path
}


#' @title Get Minizinc path
#'
#' @description
#' Get path to Minizinc installation
#'
#' @export
get_path = function() {
  return(.globals$minizinc_path)
}
