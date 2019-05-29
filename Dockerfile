FROM ruby:2.5.5

# build essentials
COPY scripts/install-essentials /tmp/install-essentials
RUN /tmp/install-essentials

# Node.js
COPY scripts/install-node /tmp/install-node
RUN /tmp/install-node && node --version

# Chrome
ENV CHROME_VERSION 74.0.3729.169-1
ENV CHROME_DRIVER_VERSION 74.0.3729.6
COPY scripts/install-chrome /tmp/install-chrome
RUN /tmp/install-chrome $CHROME_VERSION $CHROME_DRIVER_VERSION && google-chrome --version

# Yarn
COPY scripts/install-yarn /tmp/install-yarn
RUN /tmp/install-yarn && yarn --version

# Linter dependencies
RUN gem install bundler-audit \
  && gem install pronto -v 0.10.0 \
  # RuboCop extensions
  && gem install rubocop-rails_config rubocop-performance \
  && gem install pronto-brakeman -v 0.10.0 \
  # && gem install pronto-coffeelint \ TODO: not yet compatible w/ pronto 0.10
  && gem install pronto-rubocop -v 0.10.0 \
  # && gem install pronto-rails_schema \ TODO: not yet compatible w/ pronto 0.10
  && gem install pronto-scss -v 0.10.0

# Clean up apt and tmp folders
RUN apt-get purge -y --auto-remove \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
