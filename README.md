OpenProject Help Link
=====================

This plugin allows you to change the target of the help link in your
OpenProject. Doing so allows you to e.g. have a support project within your OpenProject.

Requirements
------------

This plugin aims to be compatible with

* OpenProject 0.1

If you are running into compatibility issues, please report a bug in the
project's issue tracker.

Installation
------------

Please follow the default plugin installation instructions for OpenProject.
This plugin does not have any migrations.

Usage
-----

The url of the help link is configurable with this plugin. You can set the url in:

Administration > Plugins > Configure (in the "OpenProject Help Link Changer" row)

Development
-----------

To run the tests, you will need a current version of our Dev Tools
* [Redmine Dev Tools](https://github.com/finnlabs/redmine-dev-tools and)
* [Chiliproject Cucumber](https://github.com/finnlabs/chiliproject_cucumber).

After running

    bundle install

You should be able to execute the cukes with

    RAILS_ENV=test rake redmine:cucumber:help_link

If these instructions are insufficient, please open a ticket in the GitHub
issue tracker with information, where you are stuck.

Credits
-------

We would like to thank

* Deutsche Telekom AG (opensource@telekom.de) for project sponsorhip
* Birthe Russmeyer and Niels Lindenthal of finnlabs for their consulting
  and project management

License
-------

(c) 2011-2013 - Finn GmbH

This plug-in is licensed under the GNU GPL v3. See COPYRIGHT and GPL
for details.
