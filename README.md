# minizinc-gsoc-r
Test for Google Summer of Code Minizinc Project
## Easy
As I see it, there are two approaches to this task. The first one is to use OOP and define classes for variables, models and solvers. These objects are then input into another object that converts R objects into Minizinc models. 

The second approach is to copy Python interface to Minizinc. From my observations, the main drawback of Python interface is that users need to already be familiar with Minizinc language in order to use it. However it is an easier way to write interface. I'm afraid that most R users will not be able to use the proposed package easily as they will have to learn both how to use utilize the package as well as the basics of Minizinc.   

## Medium
There are two ways you can describe a model in Python interface: 
(1) add a string model with minizinc code 
(2) load a minizinc model.
 
First, you need to create a model object that can take Minizinc code as string argument. Then, the library creates a temporary mzn file that contains the Minizinc code. The library does starts a process that calls Minizinc executable with specified parameters and captures the output of Minizinc into a JSON file that is then parsed. The main drawback of python interface is that users already need to know a bit about Minizinc. 
For R interface I want to use OOP principles and create objects that describe a model. This will be more intuitive for R programmers since this way they don’t need to know Minizinc syntax, as I think most R programmers won’t. The drawback for this approach is then interfacing minizinc language with R objects. I’ll have to do tons of parsing. 

## Hard 
Only works for binary constraints (for now). 
See package examples. 

### Note
The work is still in progress. I haven't implemented all features that I want to see before submitting this to Google Summer of Code. 
