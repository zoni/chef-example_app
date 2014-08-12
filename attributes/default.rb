default['example_app']['repository'] = "https://gist.github.com/zoni/c02e3cb936f30422bfef"
default['example_app']['revision'] = "HEAD"
default['example_app']['servername'] = "example.app"

default['example_app']['webserver'] = :nginx
default['example_app']['setup_nginx'] = true
default['example_app']['setup_supervisor'] = true
default['example_app']['setup_nodejs'] = true
