# SEE: Dockerfile

# SYNC: Dockerfile/1 {
FROM ruby:2.2.3
RUN \
    apt-get update -y && \
    apt-get install -y \
        build-essential \
        libpq-dev && \
    useradd --home-dir /srv/tunefl/ --shell /usr/sbin/nologin tunefl
# SYNC: }

# The `lilypond` package has lots of dependencies, and installation takes a long
# time. This fragment should be placed at as low a layer as possible, but
# maximising the shared layers between `web` (`Dockerfile`) and `worker`
# (`Dockerfile.worker`). `web` does not need `lilypond`, so we keep that image
# clean.
RUN \
    apt-get update -y && \
    apt-get install -y \
        lilypond

# SYNC: Dockerfile/2 {
WORKDIR /srv/tunefl/
USER tunefl
ENV BUNDLE_APP_CONFIG /srv/tunefl.bundle/
# SYNC: }
