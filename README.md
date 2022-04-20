This is the README of the PLIF (pl/sql information flow) analysis framework.

PLIF is developed in the Institute of Artificial Intelligence of MIREA - Russian Technological University.
This software is a RESEARCH PROTOTYPE and comes with NO WARRANTY.

For further details and publications related to PLIF see *./publications*

In case you find BUGS, feel free to report them through the GitHub bug tracker.

PLIF is based on many researches in the field of software security formal models.

# What is PLIF

PLIF is a framework that can be used for information flow control (IFC) in oracle database environment.
It is based on temporal logic of actions and model checking technology. We put Paralocks policy language at the core of our project. 

[Paralocks/Paragon](https://content.iospress.com/articles/journal-of-computer-security/jcs15791)

Though direct data retrieval (updating) is possible it is assumed that critical parts of a database is accessed via pl/sql program units.

The overall analysis process includes the following stages:

1. Translation of PL/SQL code into TLA+ specifications.
2. Democrating the specifications accordinally with existent global access control policy rules (RBAC). On this step we add security policies to literals, formal arguments, exceptions, local variables etc. 
3. Replaying the model with TLC or other model checker. 
4. Correcting the model and instrumenting the source code of PL/SQL program units (changing the global access control policy rules) in case of security invariant violation.

See more details in [PLIF. CONCEPT](https://...)
 

1.


static analysis tool that can be used for information flow
control (IFC) of Java bytecode. IFC allows to verify the
	INTEGRITY
		(no attacker can temper with sensitive information)
or 
	CONFIDENTIALITY
		(no attacker can infer secret information from public outputs)
of a Java program.

System dependence graphs (SDG) form the basic technology for our analyses.
These graphs precisely represent all information flow within a program. To
classify the sensitivity of data, input and output channels of a program are
annotated with security levels. Joana determines using a data flow analysis
on the SDG whether data of a certain security level may illicitly reach an
unauthorized user of the system
