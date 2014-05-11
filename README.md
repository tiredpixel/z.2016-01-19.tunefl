# tunefl

[![Build Status](https://travis-ci.org/tiredpixel/tunefl.png?branch=master,stable)](https://travis-ci.org/tiredpixel/tunefl)
[![Code Climate](https://codeclimate.com/github/tiredpixel/tunefl.png)](https://codeclimate.com/github/tiredpixel/tunefl)

![](https://raw.github.com/tiredpixel/tunefl/master/app/assets/images/logo.png)

[LilyPond](http://lilypond.org) mini-score engraving and sharing service for musicians.

The live tunefl service is provided by [tunefl.com](http://www.tunefl.com) ([@tunefl](https://twitter.com/tunefl)).

More sleep lost by [tiredpixel](http://www.tiredpixel.com).


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

We have a [Librelist](http://librelist.com) mailing list!
To subscribe, send an email to <tunefl@librelist.com>.
To unsubscribe, send an email to <tunefl-unsubscribe@librelist.com>.
There be [archives](http://librelist.com/browser/tunefl/).

You can also become a [watcher](https://github.com/tiredpixel/tunefl/watchers)
on GitHub. And you can become a [stargazer](https://github.com/tiredpixel/tunefl/stargazers) if you are so minded. :D


## Contributions

Contributions are embraced with much love and affection!
Please fork the repository and wizard your magic, ensuring that any tests are not broken by the changes. :)
Then send me a pull request.
If you'd like to discuss what you're doing or planning to do, or if you get
stuck on something, then just wave. :)

Do whatever makes you happy. We'll probably still like you. :)

Tests are written using [RSpec](http://rspec.info/). To run all tests:

    foreman run rspec

There are not many tests, because the application is very simple. If generating a score from the home page works, then things are probably okay.


## Blessing

May you find peace, and help others to do likewise.


## Licence

© [tunefl.com](http://www.tunefl.com) & [tiredpixel](http://www.tiredpixel.com) 2014.
It is free software, released under the MIT License, and may be redistributed under the terms specified in `LICENSE`.
