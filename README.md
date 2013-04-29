tunefl
======

![](https://raw.github.com/tiredpixel/tunefl/master/app/assets/images/logo.png)

tunefl is a fabarooney musical web-application which runs [LilyPond](http://lilypond.org) as a service. The live tunefl service is provided by [tunefl.com](http://www.tunefl.com). If you're a tweetling, you might like to follow [@tunefl](https://twitter.com/tunefl).

More sleep lost by [tiredpixel](http://www.tiredpixel.com).


Installation
------------

To run tunefl in development, so you can poke into dark corners, jump, hide, then contribute:

- [PostgreSQL](http://www.postgresql.org)

  Install and configure.

- [Redis](http://redis.io)

  Install and configure.

- [LilyPond](http://lilypond.org)

  Install and ensure in `PATH` by running `lilypond` on the command-line.

- [Bundler](http://gembundler.com)

  Install gems using `bundle install`.

- Config

  Copy and edit as appropriate; no changes are needed, to run with file-storage instead of a CDN:

  - `.env.example` => `.env`

- Database

  Migrate using `rake db:migrate` (`rake db:schema:load` won't work properly, as yet).

- Run

  Start the web-app and a worker using `foreman start`. Visit <http://localhost:3000>. To monitor the queue, run `resque-web`, then visit <http://localhost:5678>.

- [RSpec](http://rspec.info)

  Migrate the test database using `rake db:test:prepare`, then run all tests using `rspec`.


Contributions
-------------

Contributions are embraced with much love and affection! Please fork the
repository and wizard your magic, ensuring that any tests are not broken by the
changes. Then send a pull request. Simples! If you'd like to discuss what you're
doing or planning to do, or if you get stuck on something, then just wave. :)

Do whatever makes you happy. We'll probably still like you. :)

The repository uses a [Git-Flow](http://nvie.com/posts/a-successful-git-branching-model)-esque model; the branches operate thusly:

- [master](https://github.com/tiredpixel/tunefl/tree/master)

  The latest stable code as run on [tunefl.com](http://www.tunefl.com).

- [develop](https://github.com/tiredpixel/tunefl/tree/develop)

  The latest edge code. This is normally the branch from which to branch.

- (other)

  Anything else is a bug/enhancement/feature/etc. branch, and will likely be one day merged into develop.


Blessing
--------

May you find peace, and help others to do likewise.


Licence
-------

© [tunefl.com](http://www.tunefl.com) &
[tiredpixel](http://www.tiredpixel.com) 2013. It is free software, released
under the MIT License, and may be redistributed under the terms specified in
`LICENSE`.
