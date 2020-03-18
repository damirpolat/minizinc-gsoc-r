test_that("Variable construction works", {
  var = Variable$new("int", "decision", domain = c(1, 10), name = "var")
  expect_equal(var$get_name(), "var")
  expect_null(var$value)
  
  expect_error(Variable$new("new_type", "decision", domain = c(1, 10)))
  expect_error(Variable$new("int", "new-kind", domain = c(1, 10)))
})