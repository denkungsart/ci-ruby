FROM ruby:3.3.4-bookworm
ARG TARGETPLATFORM

# build essentials
COPY scripts/install-essentials /tmp/install-essentials
RUN /tmp/install-essentials

# Node.js
COPY scripts/install-node /tmp/install-node
RUN /tmp/install-node && node --version

# Yarn
COPY scripts/install-yarn /tmp/install-yarn
RUN /tmp/install-yarn && yarn --version

# wkhtmltopdf
COPY scripts/install-wkhtmltopdf /tmp/install-wkhtmltopdf
RUN /tmp/install-wkhtmltopdf && wkhtmltopdf --version

# FFmpeg
COPY scripts/install-ffmpeg /tmp/install-ffmpeg
RUN /tmp/install-ffmpeg && ffmpeg -version && ffprobe -version

# Install bundler 2 & RubyGems
RUN gem install bundler
RUN gem update --system

# Clean up apt and tmp folders
RUN apt-get purge -y --auto-remove \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set locale to UTF-8
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
