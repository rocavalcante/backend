# IMAGE base ubuntu16.04

Packages Installed:

    * Firefox;
    * Geckodriver;
    * Selenium web driver;
    * pip;
    * virtualenv;
    * pipenv;
    * python-3.6;

Ports:

     Selenium: 4444:4444;
     app: 8080:8080;

## Test IMAGE

`docker run --name foobar --rm -p 8080:8080 -p 4444:4444 -it rodrigoibka/backend:1.0 /bin/bash`

And HAVE FUN :)
