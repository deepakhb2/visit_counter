# Page Visit Counter
Parse the web server log to count page views and unique page views. Display the unique links on console sorted by most page views and most unique page views.

## Description
Write a ruby script that:

a. Receives a log as argument (webserver.log is provided)
e.g.: ./parser.rb webserver.log

b. Returns the following:
> list of webpages with most page views ordered from most pages views to less page views
e.g.:
/home 90 visits /index 80 visits etc... > list of webpages with most
unique page views also ordered
e.g.:
/about/2 8 unique views
/index 5 unique views etc...

## Commands
** Run scripts: **
```bash
$ ruby services/parser.rb ./input/webserver.log
```

** Run tests: **
```bash
$ rspec
```
