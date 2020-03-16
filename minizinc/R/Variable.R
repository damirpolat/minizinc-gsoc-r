#' @title Variable Class
#'

Variable = R6Class("Variable", list(
  type       = NULL,
  kind       = NULL,
  value      = NULL,
  domain     = NULL,
  name       = NULL,
  static     = env(parameter = 0,
                   decision = 0),
  #' @export
  initialize = function(type, kind, value = NULL, domain = NULL) {
    self$type      = type
    self$kind      = kind
    if(kind == "parameter" && !is.null(value)) {
      self$value = value
    }
    if(kind == "decision" && !is.null(domain)) {
      self$domain = domain
    }

    #update variable name counts
    if(self$kind == "parameter") {
      self$static$parameter = self$static$parameter + 1
      self$name = paste("p", self$static$parameter, sep = "")
    }
    if(self$kind == "decision") {
      self$static$decision = self$static$decision + 1
      self$name = paste("d", self$static$decision, sep = "")
    }
  }
))
