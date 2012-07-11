tunefl
======

![](http://tunefl.com/assets/logo-978062079879cb3fb28cf9c8d4ae5dfd.png)

tunefl is a fabarooney musical web-application which runs
[LilyPond](http://lilypond.org) as a service. The live tunefl service is
provided by [tunefl.com](http://tunefl.com). If you're a tweetling, you might
like to follow [@tunefl](http://twitter.com/tunefl).

More sleep lost by [@tiredpixel](http://twitter.com/tiredpixel).


Installing
----------

To run tunefl in development, so you can poke into dark corners, jump, hide,
then contribute:

- Ensure [PostgreSQL](http://www.postgresql.org/) is installed and set up.

- Ensure [Redis](http://redis.io/) is installed and set up.

- Ensure [LilyPond](http://lilypond.org) is installed, and accessible by
  running `lilypond` on the command-line.

- If you use [RVM](http://rvm.io/) (recommmended), trust the `.rvmrc` file.

- Using [Bundler](http://gembundler.com/), `bundle install`.

- Copy `config/database.yml.example` to `config/database.yml`, editing as
  appropriate.

- Copy `.env.example` to `.env`, and `Procfile.example` to `Procfile`,
  editing as appropriate (no changes are needed, to run with file-storage
  without a CDN).

- Migrate the database using `rake db:migrate` (`rake db:schema:load` won't
  work properly, as yet).

- Start the web-app and a worker, using `foreman start`.

- Visit http://localhost:3000.

- If you want to monitor the queue, run `resque-web`, then visit
  http://localhost:5678.


Contributing
------------

Contributions are embraced with much love and affection! Please fork the
repository and do your magic, ensuring that any tests are not broken by the
changes. Then send a pull request. Simples! If you'd like to discuss what you're
doing or planning to do, or if you get stuck on something, then just wave. :)

For your fascination, the repository branch structure is as follows:

- master : The latest 'stable' code, not guaranteed in the least to be stable ;)
  but as run on [tunefl.com](http://tunefl.com).

- develop : The 'edge' code. This is normally the branch you'll want to branch
  from.

- feature/* : One branch per 'feature', prepended with an issue-number, ideally.
  e.g. feature/123-leafy-spiderplants.

Priorities are stablising and refactoring what's already been released :) and
writing tests :! - but do whatever makes you happy. :) We'll probably still
like you.


License
-------

Copyright © 2012 [tunefl.com](http://tunefl.com) &
[@tiredpixel](http://twitter.com/tiredpixel). It is free software, released
under the MIT License, and may be redistributed under the terms specified in
`LICENSE`.

