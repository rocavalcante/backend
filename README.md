# IMAGE base ubuntu16.04

Packages Installed:

    * pip;
    * virtualenv;
    * pipenv;
    * python-3.6;
```bash

Ports:

     Selenium: 4444:4444;
     app: 8080:8080;
```

## Build

```bash
make build
```

## Test

```bash
docker run --name foobar --rm -p 8080:8080 -p 4444:4444 -it rodrigoibka/backend:1.0 /bin/bash
```

```bash
make test
```
And HAVE FUN :)
