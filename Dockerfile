FROM ruby:2.3.5

COPY scripts/install-essentials /tmp/install-essentials
RUN /tmp/install-essentials

# Node.js
COPY scripts/install-node /tmp/install-node
RUN /tmp/install-node && node --version

# PhantomJS
COPY scripts/install-phantomjs /tmp/install-phantomjs
RUN /tmp/install-phantomjs && phantomjs --version

# Chrome
ENV CHROME_VERSION 62.0.3202.75-1
COPY scripts/install-chrome /tmp/install-chrome
RUN /tmp/install-chrome $CHROME_VERSION && google-chrome --version

# Linter dependencies
RUN gem install bundler-audit \
  && gem install pronto \
  && gem install pronto-brakeman \
  && gem install pronto-coffeelint \
  && gem install pronto-rubocop \
  && gem install pronto-rails_schema \
  && gem install pronto-scss

# Clean up apt and tmp folders
RUN apt-get purge -y --auto-remove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
