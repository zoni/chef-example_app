example_app
===========

This cookbook sets up an example "Hello, world!" nodejs application.

Platforms
---------

This cookbook only works on Debian-based platforms at the moment.
Specifically, it is tested with kitchen-ci on:

* Ubuntu 12.04 LTS
* Ubuntu 14.04 LTS

Attributes
----------

* `node['example_app']['repository']`: The git url to the repository
  that is to be used for the application.
* `node['example_app']['revision']`: The revision of the repository
  to check-out (defaults to HEAD).
* `node['example_app']['servername']`: The servername to use for the
  nginx configuration (defaults to *example.app*).
* `node['example_app']['webserver']`: The webserver to configure.
  Only supports `:nginx` at this moment, other values will result in
  no configuration being done.
* `node['example_app']['setup_nginx']`: Set to false to disable
  automatic setup of nginx through the `nginx` cookbook. Useful when
  using your own wrapper cookbooks.
* `node['example_app']['setup_supervisor']`: Set to false to disable
  automatic setup of supervisor through the `supervisor` cookbook.
  Useful when using your own wrapper cookbooks.
* `node['example_app']['setup_nodejs']`: Set to false to disable
  automatic setup of nodejs through the `nodejs` cookbook. Useful when
  using your own wrapper cookbooks.

Recipes
-------

### example_app::default

This top-level recipe sets up the entire application. It includes the
other recipes automatically as needed based on the attributes above.

### example_app::setup

This recipe sets up the application itself, including necessary
directories, git check-out and supervisor configuration.

### example_app::nginx

This recipe sets up the nginx-related configuration necessary
to server the application. Included automatically when
`node['example_app']['webserver']` is set to `:nginx`.
