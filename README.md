concensus
==========
*concensus* is a ruby application which aims to help the management of a census, or any other kind of database
of people. It was built with the purpose of RMVC exemplification.

MVC structure
--------
concensus is made with [RMVC](http://github.com/unrar/rmvc), so it's built on a simple MVC (model-view-controller) structure.
The main functionality of concensus is to help people understand better the concept of MVC. 
As of v1, it has a model that manages the SQLite3 database queries, a controller and a view. 

How to use concensus
------------
It's a very simple application, with no GUI yet. When started, it'll ask for a username and password. If you're an administrator, you'll login with your data (which you manually entered in the SQLite database) and access the admin view. If you're a normal user, you'll login with "anonymous/anonymous".
There are a few things you can do after you've logged in as an administrator:

# Look a name up and be told its age (same as public view).
# Add an entry to the census.
# Remove an entry from the census.
# Edit an entry from the census.
# List all the entries from the census.

TODO
------
* An API or some kind of extensible system will soon be added so the database can be elastic and the whole "census" can be customized into any kind of database without manually editing the SQLite database.
* Support for major SQL engines