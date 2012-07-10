tunefl
======

![](http://tunefl.com/assets/logo-978062079879cb3fb28cf9c8d4ae5dfd.png)

tunefl is a musical web-application which runs [LilyPond](http://lilypond.org)
as a service. The live tunefl service is provided by
[tunefl.com](http://tunefl.com). If you're a tweetling, you might like to follow
[@tunefl](http://twitter.com/tunefl).

More sleep lost by [@tiredpixel](http://twitter.com/tiredpixel).


Installing
----------

tunefl is a Rails 3 app, and is set up to use [RVM](http://rvm.io/) and
[Bundler](http://gembundler.com/). To install, trust the `.rvmrc` file,
`bundle`, and copy any `config/*.yml.example` files as `config/*.yml`,
setting your own settings. Also set the environment variables, using your
chosen method. Ensure you have PostgreSQL setup, then `rake db:migrate` (the
settings have not yet been moved to the more correct `db/seeds.rb`, so
`rake db:schema:load` won't work), and `rails s`.

You'll probably also want to get [Resque](http://github.com/defunkt/resque/)
running, ensuring you have a [Redis](http://redis.io/) server. Starting a single
worker should be fine for development (`QUEUE=* rake resque:work`).

[LilyPond](http://lilypond.org) needs to be installed, and accessible by
running `lilypond` on the command-line.


Contributing
------------

Contributions are embraced with much love and affection. Please fork the
repository and do your magic, ensuring that any tests are not broken by the
changes. Then send a pull request. Simples! If you'd like to discuss what you're
doing or planning to do, or if you get stuck on something, then just wave. :)

Priorities are stablising and refactoring what's already been released, writing
tests (!), and improving this documentation ;) - but do whatever makes you
happy. :)


License
-------

Copyright © 2012 [tunefl.com](http://tunefl.com) &
[@tiredpixel](http://twitter.com/tiredpixel). It is free software, released
under the MIT License, and may be redistributed under the terms specified in
`LICENSE`.

