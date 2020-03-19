# minizinc-gsoc-r
Test for Google Summer of Code Minizinc Project
## Easy
As I see it, there are two approaches to this task. The first one is to use OOP and define classes for variables, models and solvers. These objects are then input into another object that converts R objects into Minizinc models. 

The second approach is to copy Python interface to Minizinc. From my observations, the main drawback of Python interface is that users need to already be familiar with Minizinc in order to use it. 

## Medium
There are two ways you can describe a model in Python interface: 
(1) add Minizinc code as string  
(2) load a minizinc file
 
First, you need to create a model object that takes Minizinc code as string. Then, the library creates a temporary mzn file that contains Minizinc code. The library starts a process that calls Minizinc executable with specified parameters and captures the output of Minizinc into a JSON file that is then parsed. The main drawback of Python interface is that users already need to know a bit about Minizinc. 
For R interface I want interface to be self-contained. As in, users will write their models as they would normally do in a canonical R approach. This will be more intuitive for R programmers since this way they don’t need to know Minizinc syntax. The drawback for this approach is then interfacing Minizinc language with R objects. 

## Hard 
Only works for constraints that invole two variables only. 
See package vignettes. 

### Note
The work is still in progress. 
