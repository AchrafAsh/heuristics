
SHO — Stochastic Heuristics Optimization
========================================

SHO is a didactic Python framework for implementing metaheuristics
(or evolutionary computation, or search heuristics).

Its main objective is to free students from implementing boring stuff
and allow them to concentrate on single operator implementation.

The framework implements a simple sensor placement problem
and handle metaheuristics manipulating solutions represented as
numerical vectors or bitstrings.

Author: Johann Dreo <johann@dreo.fr>.

Documentation
-------------

Basic explanations about the code architecture are in CODE.md.
The lecture syllabus is in LESSON.md.

To build up a PDF file with all the doc, install `pandoc` and call:
```sh
./make_doc.sh CODE.md LESSON.md
```
