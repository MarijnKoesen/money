# Setup instructions

To setup for the workshop you need to get a git repository and run a docker container containing all the tools we're going to need



## Step 1: Clone the repo

```
$ git clone https://github.com/paulinevos/money
$ cd money
```



## Step 2: Run the container

Option 1) Checkout the container from dockerhub (recommended):

```
$ docker run --rm -it -v "$PWD":/money -w /money paulinevos/gitgoodworkshop:latest
```


Option 2) Build it yourself

```
$ docker build -t gitgoodworkshop .
$ docker run --rm -it -v "$PWD":/money -w /money gitgoodworkshop
```

You chould now have a shell inside the container, with the code for the workshop mounted in `/money`.

In the next steps we are going to install the projects' dependencies and run the tests to make sure everything is working as expected.


## Step 3: Install the projects' dependencies:

Installing the dependencies will take around a minute or so.

```
(This should be run from inside the container)
$ composer install
```



## Step 4: Run the tests

Finaly lets run the tests and make sure it's all good

To run all the tests run:

```
$ composer test
```

To run only PHPSpec:

```
$ vendor/bin/phpspec run
```

To run only Unit Tests

```
$ vendor/bin/phpunit --exclude-group segmentation
```
