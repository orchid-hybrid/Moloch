Moloch
=====

<p align="center">
  <img src="http://i.imgur.com/VsBMskb.jpg" />
</p>



Plan
====

The compiler is based on the following steps:

Parse =>
 Macroexpand =>
  CPS =>
   CC =>
    Closure Analysis =>
     Stack =>
      Emit C

### Strategy

* CPS commits us to implementing lambda efficiently
* Use XP methods, write lots of tests and automate running them
* Separation of Concerns: Divide things cleanly into modules

### Things to consider

* Macros: develop a syntactic-closure based macro system, it will be possible to implement syntax-rules with it
* C-exprs: Make it really easy for the compiler to emit well formed C code [good progress]
* Runtime: scheme interpreter for the stack runtime, be able to execute compiled code this way to compare against emitted C
* Have several tiers of tests (simple scheme scripts to run and analyze the compilation of) [done]
* Eta reduction/other simple reductions after CPS?

### Improvements upon moo

* Lexical environment: to correctly handle things like (lambda (let) ... (let ...) ...) we need to carry a lexical environment around while processing terms. Practice for this would be implementing a hygienic macro system
* Stack frames: We can implement var-args and detect wrong number of args passed using stack-frames, this also opens the door to stack allocation of environments
* Closure Analysis: We must stack allocate closure/environments when possible

Usage
=====

To get the code use `git clone --recursive` since it uses submodules
