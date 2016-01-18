# SEE: Dockerfile.worker

# SYNC: Dockerfile/1 {
FROM ruby:2.2.3
RUN \
    apt-get update -y && \
    apt-get install -y \
        build-essential \
        libpq-dev && \
    useradd --home-dir /srv/tunefl/ --shell /usr/sbin/nologin tunefl
# SYNC: }

RUN \
    mkdir \
        /srv/tunefl.bundle/ \
        /srv/tunefl/ \
        /srv/tunefl/public/ \
        /srv/tunefl/public/assets/ \
        /srv/tunefl/public/system/ \
        /srv/tunefl/public/uploads/ \
        /srv/tunefl/tmp/ \
        /srv/tunefl/tmp/cache/ \
        /srv/tunefl/tmp/pids/ \
        /srv/tunefl/tmp/sockets/ && \
    chown -R tunefl \
        /srv/tunefl.bundle/ \
        # not /srv/tunefl/
        /srv/tunefl/public/ \
        /srv/tunefl/tmp/

COPY [ \
    "Gemfile", \
    "Gemfile.lock", \
    "/srv/tunefl/"]

# SYNC: Dockerfile/2 {
WORKDIR /srv/tunefl/
USER tunefl
ENV BUNDLE_APP_CONFIG /srv/tunefl.bundle/
# SYNC: }

RUN bundle install --path /srv/tunefl.bundle/

VOLUME [ \
    "/srv/tunefl.bundle/", \
    "/srv/tunefl/public/", \
    "/srv/tunefl/tmp/"]
