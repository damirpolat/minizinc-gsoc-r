test_that("Constraint construction works", {
  var1 = Variable$new(type = "float", kind = "decision", domain = c(-1.5, 1.5))
  var2 = Variable$new(type = "float", kind = "decision", domain = c(-1.5, 1.5))
  
  constr = Constraint$new(constraint = ">=", variables = c(var1, var2))
  expect_equal(length(constr$variables), 2)
  
  expect_error(Constraint$new(constraint = "new-constraint", variables = c(var1, var2)))
  expect_error(Constraint$new(constraint = "new-constraint", variables = c(var1, "var2")))
  expect_error(Constraint$new(constraint = "==", variables = c(var1, 
               Constraint$new(constraint = "==", variables = c(var1, var2)))))
})