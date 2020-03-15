#Variable.R
#Damir Pulatov

Variable = R6Class("Variable", list(
  type       = NULL,
  kind       = NULL,
  value      = NULL,
  domain     = NULL,
  initialize = function(type, kind, value = NULL, domain = NULL) {
    self$type      = type
    self$kind      = kind
    if(kind == "parameter" && !is.null(value)) {
      self$value = value
    }
    if(kind == "decision" && !is.null(domain)) {
      self$domain = domain
    }
  }
))
