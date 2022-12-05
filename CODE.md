# Code

## Executable

The main interface is implemented in `snp.py`.
New algorithms should be integrated within this file and the interface should not be modified.
One may add arguments, but not remove or change the contracts of the existing ones.

The file `snp_landscape.py` is an example that plots the objective function
and a greedy search trajectory for a simple problem with only two dimensions.


## Architecture

The design pattern of the framework is a functional approach to composition.
The goal is to be able to assemble a metaheuristic, by plugging atomic
functions in an algorithm template.


### Operators

The base of the pattern is a function that contains the main loop
of the algorithm, and call other functions called "operators".
Example of those algorithms are in the `algo` module.

For instance, the `random` algorithm depends on an objective function `func`,
an initialization operator `init` and a stopping criterion operator `again`.


### Encoding

Some operator do not depend on the way solutions are encoded
(like the stopping criterions) and some operators do depend on the encoding.
The former are defined in their own modules while the later are defined
in the module corresponding to their encoding (either `num` or `bit`).


### Interface capture

As they are assembled in an algorithm that do not know their internal
in advance, an operators needs to honor an interface.
For instance, the `init` operator's interface takes no input parameter
and returns a solution to the problem.

However, some operator may need additional parameters to be passed.
To solve this problem, the framework use an interface capture pattern.

There is two ways to capture the interface: either with a functional approach,
either with an object-oriented approach.
You can use the one you prefer, the advice is to use the functional approach when
you can implement your operator as a stateless function,
and the object-oriented approach when you need àour operator to manage a state.


#### Function capture

The functional capture helpers are implemented in the `make` module.
Basically, a function in this module capture the operator function's full
interface and returns a function having the expected interface of the
operator.

The implicit rule is to use positional arguments for mandatory parameters
on which the operator is defined, and keyword arguments for parameters
which are specific to the operator.


#### Object-oriented capture

The object-oriented approach does not need helpers,
you just need to define a "functor" class,
that is, a class which implements the `__call__` interface.
This special function member allows to call an instance of a class
as if it was a function.

The `__call__` method should honor the targeted operator interface.
To pass fixed parameters, use the `__init__` constructor.

There is an example of an operator implemented this way
as the `steady` class in the `sho/iters.py` file.


### Going Further

To see more examples of this kind of modular architecture, in various languages,
you can have a look at the [algopattern](https://github.com/nojhan/algopattern)
project on Github.

![](https://raw.githubusercontent.com/nojhan/algopattern/master/algopattern_operators.svg)
