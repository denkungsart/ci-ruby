FROM ruby:3.1.3-bullseye

# build essentials
COPY scripts/install-essentials /tmp/install-essentials
RUN /tmp/install-essentials

# Node.js
COPY scripts/install-node /tmp/install-node
RUN /tmp/install-node && node --version

# Chrome
ENV CHROME_VERSION 108.0.5359.94-1
ENV CHROME_DRIVER_VERSION 108.0.5359.71
COPY scripts/install-chrome /tmp/install-chrome
RUN /tmp/install-chrome $CHROME_VERSION $CHROME_DRIVER_VERSION && google-chrome --version

# Yarn
COPY scripts/install-yarn /tmp/install-yarn
RUN /tmp/install-yarn && yarn --version

# wkhtmltopdf
COPY scripts/install-wkhtmltopdf /tmp/install-wkhtmltopdf
RUN /tmp/install-wkhtmltopdf && wkhtmltopdf --version

# ImageMagick
COPY scripts/install-imagemagick /tmp/install-imagemagick
RUN /tmp/install-imagemagick && identify -version && identify -list configure

# FFmpeg
ENV FFMPEG_DOWNLOAD_URL https://denkungsart.s3.eu-west-1.amazonaws.com/ffmpeg-git-amd64-static.tar.xz
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
