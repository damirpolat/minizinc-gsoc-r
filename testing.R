library(devtools)
document()
remove.packages("minizinc")
install_local(".", build_vignettes = TRUE, upgrade = "never")
.rs.restartR()
rm(list=ls())
library(minizinc)

set_path("/home/damir/software/MiniZincIDE-2.4.2-bundle-linux/bin/minizinc")

p1 = Variable$new(type = "int", value = 3, kind = "parameter")
v1 = Variable$new(type = "int", kind = "decision", domain = c(1, p1$value), 
                  name = "v1")
v2 = Variable$new(type = "int", kind = "decision", domain = c(1, p1$value), 
                  name = "v2")
v3 = Variable$new(type = "int", kind = "decision", domain = c(1, p1$value), 
                  name = "v3")
v4 = Variable$new(type = "int", kind = "decision", domain = c(1, p1$value),
                  name = "v4")
v5 = Variable$new(type = "int", kind = "decision", domain = c(1, p1$value),
                  name = "v5")
v6 = Variable$new(type = "int", kind = "decision", domain = c(1, p1$value),
                  name = "v6")
v7 = Variable$new(type = "int", kind = "decision", domain = c(1, p1$value),
                  name = "v7")
vars = c(v1, v2, v3, v4, v5, v6, v7)

c1 = Constraint$new(constraint = "!=", variables = c(v1, v2))
c2 = Constraint$new(constraint = "!=", variables = c(v1, v3))
c3 = Constraint$new(constraint = "!=", variables = c(v2, v3))
c4 = Constraint$new(constraint = "!=", variables = c(v2, v4))
c5 = Constraint$new(constraint = "!=", variables = c(v3, v4))
c6 = Constraint$new(constraint = "!=", variables = c(v3, v5))
c7 = Constraint$new(constraint = "!=", variables = c(v3, v6))
c8 = Constraint$new(constraint = "!=", variables = c(v4, v5))
c9 = Constraint$new(constraint = "!=", variables = c(v5, v6))
constr = c(c1, c2, c3, c4, c5, c6, c7, c8, c9)


m = Model$new(parameter = c(p1), decision = vars, constraints = constr, 
              objective = "satisfy")
s = Solver$new(name  = "gecode")
res = solve(m, s)

# print solution
for(i in 1:length(vars)) {
  cmd = sprintf("%s = %s", vars[[i]]$get_name(), vars[[i]]$value)
  print(eval(cmd))
}
