FROM ruby:2.5.3

COPY scripts/install-essentials /tmp/install-essentials
RUN /tmp/install-essentials

# Node.js
COPY scripts/install-node /tmp/install-node
RUN /tmp/install-node && node --version

# PhantomJS
COPY scripts/install-phantomjs /tmp/install-phantomjs
RUN /tmp/install-phantomjs && phantomjs --version

# Chrome
ENV CHROME_VERSION 72.0.3626.119-1
ENV CHROME_DRIVER_VERSION 2.46
COPY scripts/install-chrome /tmp/install-chrome
RUN /tmp/install-chrome $CHROME_VERSION $CHROME_DRIVER_VERSION && google-chrome --version

# Yarn
COPY scripts/install-yarn /tmp/install-yarn
RUN /tmp/install-yarn && yarn --version

# Linter dependencies
RUN gem install bundler-audit \
  && gem install pronto -v 0.10.0 \
  && gem install pronto-brakeman -v 0.10.0 \
  # && gem install pronto-coffeelint \ TODO: not yet compatible w/ pronto 0.10
  && gem install pronto-rubocop -v 0.10.0 \
  # && gem install pronto-rails_schema \ TODO: not yet compatible w/ pronto 0.10
  && gem install pronto-scss -v 0.10.0

# wkhtmltopdf dependencies
RUN apt-get install -y xfonts-75dpi xfonts-base
# release from https://github.com/wkhtmltopdf/wkhtmltopdf/releases/tag/0.12.5
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb
RUN dpkg -i wkhtmltox_0.12.5-1.stretch_amd64.deb

# Clean up apt and tmp folders
RUN apt-get purge -y --auto-remove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
