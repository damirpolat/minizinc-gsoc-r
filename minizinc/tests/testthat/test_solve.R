test_that("eval works", {
  set_path("/home/damir/software/MiniZincIDE-2.4.2-bundle-linux/bin/minizinc")
  
  var1 = Variable$new(type = "int", kind = "decision", domain = c(0, 10))
  var2 = Variable$new(type = "int", kind = "decision", domain = c(0, 5))
  constr = Constraint$new(constraint = "<", variables = c(var1, var2))
  model = Model$new(decision = c(var1, var2), constraints = c(constr),
                    objective = "satisfy")
  solver = Solver$new(name = "gecode")
  res = eval_model(model, solver)
  expect_true(res)
  
  var1 = Variable$new(type = "int", kind = "decision", domain = c(0, 10))
  var2 = Variable$new(type = "int", kind = "decision", domain = c(11, 20))
  constr = Constraint$new(constraint = ">", variables = c(var1, var2))
  model = Model$new(decision = c(var1, var2), constraints = c(constr),
                    objective = "satisfy")
  solver = Solver$new(name = "gecode")
  res = eval_model(model, solver)
  expect_false(res)
})