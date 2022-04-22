This is the README of the _PLIF_ (pl/sql information flow) analysis framework.

PLIF is developed in the Institute of Artificial Intelligence of MIREA - Russian Technological University.
This software is a RESEARCH PROTOTYPE and comes with NO WARRANTY.

For further details see publications related to PLIF *./publications*

In case you find BUGS, feel free to report them through the GitHub bug tracker.

_PLIF_ is based on many researches in the field of software security formal models.

# What is PLIF

PLIF is a framework that can be used for information flow control (IFC) in oracle database environment.
It is based on temporal logic of actions and model checking technology. We put Paralocks policy language at the core of our project. 

[Paralocks/Paragon](https://content.iospress.com/articles/journal-of-computer-security/jcs15791)

Though direct data retrieval (updating) is possible it is assumed that critical parts of a database is accessed via pl/sql program units.

The overall analysis process includes the following stages:

1. Translation of _PL/SQL_ code into _TLA+_ specifications with plsql2tla utility.
2. Democrating the specifications accordinally with existent global access control policy rules (RBAC). On this step we add security policies to literals, formal arguments, exceptions, local variables etc. 
3. Replaying the model with TLC or other model checker. 
4. Correcting the model and instrumenting the source code of _PL/SQL_ program units (changing the global access control policy rules) in case of security invariant violation.

# INSTALLATION

The instrumental basis of the framework includes _TLA+ toolbox_, _plif2tla_ and _plifparser_ utilities. 
The ideas for plif2tla design were benefited from [c2tla](). 
plif_parser is in fact a customization of [tla+ trace explorer]().

## INSTALLING TLA+ toolbox

To install _TLA+ toolbox_ see [Tla+ toolbox]

## INSTALLING plif2tla

Copy _plif2tla_ folder to some location on your hard drive.

## INSTALLING plifparser

Copy _plifparser_ folder to some location on your hard drive.

## Quick Start

Being an initial prototype _plif_ platform has a number of limitations regarding _PLSQL_ grammar. _plsql2tla_ as well as the whole project currently supports just a short list of Oracle _PL/SQL_ a and _SQL_ statements and expressions including: _select_, _insert_, _update_, _assign_, arithmetic operators, comparison operators, logical operators, _if_, _while_, _null_, _throw exception_, _when xxx_ an and some others. For more details see [plsql2tla]()

It is assumed that before begining analysis we have a set of _PL/SQL_ program units implementing the critical part of business logic (see /publications/... ) and predefined rules of the general access control policy (typically role-based) represented as grant/revoke statements.

1. To generate an initial set of _TLA+_ specifications modeling parallel user sessions in database environment change the current directory to the home directory of _plsql2tla_ and run
	`
	java plsql2tla.jar .....
	` 
As result new .tla files will be added to ./plsqlspecs folder.

2. Markup required parameters, variables, exception etc with respect to the general access control policy i.e. 
	`
	 {<<x,<<[t_expire |-> {NONE}], [guest |-> {NONE}, reviewer |-> {NONE}, manager |-> {x}, organizer |-> {NONE}]>> >>}
        `
which essentually means that an actor _x_ can only read labeled data iff the lock _manager_ is open in his session. For more details see /publications/...

3. Create a new _TLC_ model and set values for nessecary constants (more details see /publications/...) .

Replay the model accordinally to the algo described in (/publications/...).

![Configuring the model](https://github.com/timimin/plif/blob/main/blobs/screen_plif_model.png?raw=true)

4. In case of ParalocksInv violation explore the error trace with _plifparser_. To run it choose _trace-explorer.html_ in _plifparser_ home directory.

![Configuring the model](https://github.com/timimin/plif/blob/main/blobs/screen_plif_parser_1.png?raw=true)
           
![Configuring the model](https://github.com/timimin/plif/blob/main/blobs/screen_plif_parser_2.png?raw=true)

Fix the model and apply source code instrumentation or change the global policy if needed (see /publications/...).


