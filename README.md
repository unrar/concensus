concensus
==========
*concensus* is a ruby application which aims to help the management of a census, or any other kind of database
of people. It was built with the purpose of RMVC exemplification.

MVC structure
--------
concensus is made with [RMVC](http://github.com/unrar/rmvc), so it's built on a simple MVC (model-view-controller) structure.
The main functionality of concensus is to help people understand better the concept of MVC. 
As of v1, it has a model that manages the SQLite3 database queries, a controller and a view. 

Future functionality
---------
I am working on a more complex version of concensus. It would have many views, models and controllers:

* A view for the log in management, linked to the main controller and a model that runs the database queries related to logging in.
* A view for the anonymous user only allowed to look someone's public data up, linked to its own controller and the model devoted to looking up information (not editing, adding or removing it).
* A view for the administrative user, with a menu with all the possible options (add an entry, remove an entry, edit an entry and look an entry up), linked to both looking-up and editing models, and its own controller.