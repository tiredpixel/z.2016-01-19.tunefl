# Tunefl

[![Build Status](https://travis-ci.org/tiredpixel/tunefl.png?branch=master,stable)](https://travis-ci.org/tiredpixel/tunefl)
[![Code Climate](https://codeclimate.com/github/tiredpixel/tunefl.png)](https://codeclimate.com/github/tiredpixel/tunefl)

![](https://raw.github.com/tiredpixel/tunefl/master/app/assets/images/logo.png)

[LilyPond](http://lilypond.org) mini-score engraving and sharing service for musicians.

The live Tunefl service is at [tunefl.com](https://www.tunefl.com).

More sleep lost by [tiredpixel](https://www.tiredpixel.com).


## Externals

- [PostgreSQL](http://www.postgresql.org/)

- [Redis](http://redis.io/)

- [LilyPond](http://lilypond.org)
  
  Ensure `lilypond` is in the `PATH`.


## Installation

- Config (copy and edit as appropriate):
  
  - `.env.example` => `.env`

- Libraries
  
  Using [Bundler](http://gembundler.com/), `bundle install`.

- Database
  
  Migrate using `rake db:migrate` (`rake db:schema:load` won't work properly).

The default Ruby version supported is defined in `.ruby-version`.
Any other versions supported are defined in `.travis.yml`.


## Usage

Start the `Procfile` processes:

    foreman start

Visit the `web` process at <http://localhost:3000> or similar. Visit the `web` process admin section at <http://localhost:3000/admin> or similar.

Monitor the queue using [sidekiq-spy](https://github.com/tiredpixel/sidekiq-spy):

    sidekiq-spy -n resque


## Stay Tuned


## Development

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
