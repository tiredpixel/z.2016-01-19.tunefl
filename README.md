# Tunefl

[![Build Status](https://travis-ci.org/tiredpixel/tunefl.png?branch=master,stable)](https://travis-ci.org/tiredpixel/tunefl)
[![Code Climate](https://codeclimate.com/github/tiredpixel/tunefl.png)](https://codeclimate.com/github/tiredpixel/tunefl)

![](https://raw.github.com/tiredpixel/tunefl/master/app/assets/images/logo.png)

[LilyPond](http://lilypond.org) mini-score engraving and sharing service for musicians.

The live Tunefl service is at [tunefl.com](https://www.tunefl.com).

More sleep lost by [tiredpixel](https://www.tiredpixel.com).


## Installation

The primary method of development installation is using
[Docker](https://www.docker.com/). You can also use this as a basis for
production installation, but you'll probably want to change some things, if so.

You can also install manually, by installing the linked services and packages
defined in `Dockerfile` & `Dockerfile.worker`, using `bundle install`, and
running services using the supplied `Procfile`.

The default Ruby version supported is defined in `.ruby-version`.
Any other versions supported are defined in `.travis.yml`.

### Prerequisites

- [Docker Engine](https://docs.docker.com/engine/installation/)

- [Docker Compose](https://docs.docker.com/compose/install/)

### Configuration

Copy and configure your settings:

```bash
cp .env.example .env
```

### Database

Start the `postgres` service:

```bash
docker-compose up -d postgres
```

Connect using `psql`:

```bash
docker exec -it tunefl_postgres_1 psql -U postgres
```

Create the database:

```sql
CREATE ROLE tunefl_dev LOGIN PASSWORD 'password';
CREATE DATABASE tunefl_dev OWNER tunefl_dev;
```

Start the `web` service:

```bash
docker-compose up -d web
```

Migrate the database:

```bash
docker exec -it tunefl_web_1 rake db:migrate
```

Stop all services:

```bash
docker-compose stop
```


## Usage

Start all services:

```bash
docker-compose up
```

Open the `web` service in a browser:

```bash
xdg-open "http://$(docker-compose port web 8080)"
```

Open the `web` service admin area in a browser:

```bash
xdg-open "http://$(docker-compose port web 8080)/admin"
```

Monitor the queue using
[Sidekiq Spy](https://github.com/tiredpixel/sidekiq-spy):

```bash
docker exec -it tunefl_worker_1 \
    sh -c 'TERM=xterm bundle exec sidekiq-spy -h redis -n resque'
```


## Development

*TODO: update for Docker instructions*

To run all tests:

```bash
foreman run rspec
```

Tests are written using [RSpec](http://rspec.info/).
There are not many tests, because the application is very simple.
If generating a score from the home page works, then things are probably okay.


## Stay Tuned

You can become a
[watcher](https://github.com/tiredpixel/tunefl/watchers)
on GitHub. And you can become a
[stargazer](https://github.com/tiredpixel/tunefl/stargazers)
if you are so minded. :D


## Contributions

Contributions are welcome! Please fork the repository and prepare your patches
in one or more branches, ensuring that any tests are not broken by the changes.
Then, send me one or more pull requests. Proposed patches will then be reviewed
prior to acceptance, usually into `master` branch.
If you'd like to discuss something, then please get in touch.

Do whatever makes you happy. We'll probably still like you. :)


## Blessing

May you find peace, and help others to do likewise.


## Licence

Copyright © 2012-2016 [tiredpixel](https://www.tiredpixel.com).
See `LICENSE.txt`.
