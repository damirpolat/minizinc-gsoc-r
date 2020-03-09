#parse.R
#Damir Pulatov
library(R6)
library(rjson)

Model = R6Class("Model", list(
  file = "tmp.mzn",
  mode = "json",
  add_string = function(code = NULL) {
    if(!is.null(code)) {
      #create tmp mzn file
      ret = file.create(self$file)
      if(!ret) {
        message("Error. I'll add exception later")
      }
      write(code, file = self$file, append = FALSE)
    }
  },
  solve = function(solver = "gecode") {
    cmd = paste("/home/damir/software/MiniZincIDE-2.4.2-bundle-linux/bin/minizinc", self$file, "-o tmp.out", sep = " ")
    cmd = paste(cmd, "--output-mode", mode, sep = " ")
    system(cmd)
    retval = fromJSON(file = "tmp.out")
    
    return(retval)
  }
))

model = Model$new()
model$add_string(code = "
var 1..10: x;
constraint (x mod 2) = 1;
solve ::int_search([x], input_order, indomain_min) maximize x;
")
r = model$solve()
#output = "[false, false, false, false]\n----------"
