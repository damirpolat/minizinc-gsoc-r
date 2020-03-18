test_that("eval works", {
  var1 = Variable$new(type = "int", kind = "decision", domain = c(0, 10))
  var2 = Variable$new(type = "int", kind = "decision", domain = c(0, 5))
  constr = Constraint$new(constraint = "<", variables = c(var1, var2))
  model = Model$new(decision = c(var1, var2), constraints = c(constr),
                    objective = "satisfy")
  solver = Solver$new(name = "gecode")
  set_path("/home/damir/software/MiniZincIDE-2.4.2-bundle-linux/bin/minizinc")
  res = eval_model(model, solver)
  
  test_named(res)
})