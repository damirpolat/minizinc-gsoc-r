# package level environment
.globals = env()
.globals$minizinc_path = NULL
.globals$types = c("int", "float", "bool", "string")
.globals$kinds = c("parameter", "decision")
.globals$constraints = c("==", "!=", "<", ">", ">=", "<=")
.globals$objectives = c("satisfy", "maximize", "minimize")
