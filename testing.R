library(devtools)
document()
remove.packages("minizinc")
install_local(".", upgrade = "never")
.rs.restartR()
rm(list=ls())
library(minizinc)

  
p1 = Variable$new(type = "int", value = 3, kind = "parameter")
v1 = Variable$new(type = "int", kind = "decision", domain = c(1, p1$value))
v2 = Variable$new(type = "int", kind = "decision", domain = c(1, p1$value))
c1 = Constraint$new(constraint = "!=", variables = c(v1, v2))
m = Model$new(parameter = c(p1), decision = c(v1, v2), constraints = c(c1), 
              objective = "satisfy")
s = Solver$new(name  = "gecode")
res = solve(m, s)
