test_that("Model construction works", {
  var1 = Variable$new(type = "float", kind = "decision", domain = c(-1.5, 1.5))
  var2 = Variable$new(type = "float", kind = "decision", domain = c(-1.5, 1.5))
  constr = Constraint$new(constraint = ">=", variables = c(var1, var2))
  model = Model$new(decision = c(var1, var2), constraints = c(constr), objective = "satisfy")
  expect_null(model$parameter) 
  
  expect_error(Model$new(decision = c(var1, var2), constraints = c(constr), objective = "objective"))
  expect_error(Model$new(decision = c(var1, "var2"), constraints = c(constr), objective = "maximize"))
  expect_error(Model$new(decision = c(var1, var2), constraints = c("constr"), objective = "minimize"))
})