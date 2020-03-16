#' @title set_path
#' 
#' @description Set Minizinc path
#' 
#' @param path Path to Minizinc executable
#' 
#' @export
set_path = function(path) {
  .globals$minizinc_path = path
}


#' @title get_path
#' 
#' @description Get Minizinc path
#' 
#' @export
get_path = function() {
  return(.globals$minizinc_path)
}
