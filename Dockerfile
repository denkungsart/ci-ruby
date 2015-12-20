FROM ruby:2.1.8

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install -y nodejs

# PhantomJS
ENV PHANTOMJS_VERSION 1.9.8
RUN curl -fSL https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-"$PHANTOMJS_VERSION"-linux-x86_64.tar.bz2 -o /tmp/phantomjs-"$PHANTOMJS_VERSION"-linux-x86_64.tar.bz2 \
    && tar -xjf /tmp/phantomjs-"$PHANTOMJS_VERSION"-linux-x86_64.tar.bz2 -C /tmp \
    && mv /tmp/phantomjs-"$PHANTOMJS_VERSION"-linux-x86_64/ /var/phantomjs \
    && ln -s /var/phantomjs/bin/phantomjs /usr/local/bin/phantomjs

# wkhtmltopdf
ENV WKHTMLTOPDF_MAJOR_VERSION 0.12
ENV WKHTMLTOPDF_VERSION 0.12.2.1

RUN curl -fSL http://download.gna.org/wkhtmltopdf/"$WKHTMLTOPDF_MAJOR_VERSION"/"$WKHTMLTOPDF_VERSION"/wkhtmltox-"$WKHTMLTOPDF_VERSION"_linux-jessie-amd64.deb -o /tmp/wkhtmltox-"$WKHTMLTOPDF_VERSION"_linux-jessie-amd64.deb \
    && dpkg -x /tmp/wkhtmltox-"$WKHTMLTOPDF_VERSION"_linux-jessie-amd64.deb /tmp/wkhtmltopdf \
    && mv /tmp/wkhtmltopdf/usr/local/bin/wkhtmltopdf /var/wkhtmltopdf \
    && ln -s /var/wkhtmltopdf /usr/local/bin/wkhtmltopdf

# pdftk
RUN apt-get install -y pdftk \
    && ln -s /usr/bin/pdftk /usr/local/bin/pdftk

# ffprobe
ENV FFMPEG_VERSION 2.8.3

RUN apt-get install -y xz-utils
RUN curl -fSL http://johnvansickle.com/ffmpeg/releases/ffmpeg-release-64bit-static.tar.xz -o /tmp/ffmpeg-release-64bit-static.tar.xz \
    && tar -xJf /tmp/ffmpeg-release-64bit-static.tar.xz -C /tmp \
    && mv /tmp/ffmpeg-"$FFMPEG_VERSION"-64bit-static/ffprobe /var/ffprobe \
    && ln -s /var/ffprobe /usr/local/bin/ffprobe

# PostgreSQL client
RUN apt-get install -y postgresql-client

# Clean up apt and tmp folders
RUN apt-get purge -y --auto-remove xz-utils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
