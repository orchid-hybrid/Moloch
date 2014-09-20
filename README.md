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
   Simplify =>
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



Todo
====

* Port back to chicken: Racket is frustrating - move back to chicken but need to get all the unit testing and ideally modules happening too.

| Stage        | Status           | Notes |
| -------------|:-------------|----:|
| Parser      | Complete! | has nice tests |
| Macroexpand | Mostly compete| (MAC) |
| CPS | partially done | add  values/multiple-values, what else?  |
| Simplification |  | (SIMPL) |
| CC |       | |
| Closure Analysis |       | (CLOSE) Learn how to do this |
| Stack |       | (STACK) |
| Emit C | Done! c-exprs | Sweet! |


* (MAC) This is all in syntactic-closures-macro-system. Need to implement and test more forms in prelude/macros.rkt
* (SIMPL) perform some simplifications such as the following [ensure that they don't break anything]
 
    ((lambda () body)) => body
    ((lambda (x) (... x ...)) exp) => (... exp ...)
       (if x is references only once)
    remove unused arguments to procedures (args have no side effects)

* (CLOSE) The [RABBIT](http://library.readscheme.org/page1.html) and [ORBIT](http://repository.readscheme.org/ftp/papers/orbit-thesis.pdf) papers cover this. Need to understand this better and implement it!
* (STACK) Designing the stack runtime, implementing it in c-exprs.

Usage
=====

To get the code use `git clone --recursive` since it uses submodules
Problem with empty submodules? `git submodule update --init` http://stackoverflow.com/questions/11358082/empty-git-submodule-folder-when-clone
